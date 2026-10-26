#include "ForthPipe.h"

#include <QCoreApplication>
#include <QDir>
#include <QFileInfo>
#include <QJsonDocument>
#include <QJsonObject>
#include <QLocalSocket>
#include <QMutexLocker>
#include <QProcess>
#include <QThread>
#include <QWaitCondition>

#include <cstring>

namespace {

QByteArray message(const char *op, const QString &text) {
    QJsonObject obj;
    obj.insert(QStringLiteral("op"), QString::fromLatin1(op));
    if (!text.isNull())
        obj.insert(QStringLiteral("text"), text);
    return QJsonDocument(obj).toJson(QJsonDocument::Compact);
}

QByteArray frameFor(const QByteArray &json) {
    QByteArray frame(4 + json.size(), '\0');
    const unsigned n = static_cast<unsigned>(json.size());
    frame[0] = static_cast<char>(n);
    frame[1] = static_cast<char>(n >> 8);
    frame[2] = static_cast<char>(n >> 16);
    frame[3] = static_cast<char>(n >> 24);
    memcpy(frame.data() + 4, json.constData(), static_cast<size_t>(json.size()));
    return frame;
}

bool writeAll(QLocalSocket *sock, const QByteArray &bytes) {
    const char *p = bytes.constData();
    int left = bytes.size();
    while (left > 0) {
        const qint64 n = sock->write(p, left);
        if (n <= 0)
            return false;
        p += n;
        left -= static_cast<int>(n);
        if (!sock->waitForBytesWritten(2000) && sock->bytesToWrite() > 0)
            return false;
    }
    return true;
}

void flushOutgoing(ForthPipe *owner, QLocalSocket *sock) {
    const QList<QByteArray> batch = owner->takeOutgoing();
    for (const QByteArray &frame : batch) {
        if (!writeAll(sock, frame))
            return;
    }
}

class SocketReader : public QThread {
public:
    ForthPipe *owner = nullptr;
    QString serverName;
    QWaitCondition *wake = nullptr;
    QMutex *wakeMu = nullptr;

    void run() override {
        // Match Windows: companion listens; editor connects (same as named-pipe client).
        QLocalSocket sock;
        bool connected = false;
        for (int i = 0; i < 80; ++i) {
            if (owner->stopping())
                return;
            sock.connectToServer(serverName);
            if (sock.waitForConnected(100)) {
                connected = true;
                break;
            }
            sock.abort();
            QThread::msleep(100);
        }
        if (!connected) {
            if (!owner->stopping())
                QMetaObject::invokeMethod(
                    owner, "noteFailed", Qt::QueuedConnection,
                    Q_ARG(QString, QStringLiteral("Forth companion socket did not open.")));
            return;
        }

        unsigned char hdr[4];
        QByteArray body;
        char *dst = reinterpret_cast<char *>(hdr);
        int need = 4;
        int got = 0;
        bool readingBody = false;
        bool told = false;

        while (!owner->stopping()) {
            flushOutgoing(owner, &sock);

            if (sock.bytesAvailable() < 1) {
                if (!sock.waitForReadyRead(100)) {
                    if (sock.state() != QLocalSocket::ConnectedState)
                        break;
                    if (wakeMu != nullptr && wake != nullptr) {
                        wakeMu->lock();
                        wake->wait(wakeMu, 50);
                        wakeMu->unlock();
                    }
                    continue;
                }
            }

            while (sock.bytesAvailable() > 0 && !owner->stopping()) {
                const qint64 n = sock.read(dst + got, need - got);
                if (n <= 0)
                    break;
                got += static_cast<int>(n);
                if (got < need)
                    continue;

                if (!readingBody) {
                    const unsigned len = static_cast<unsigned>(hdr[0]) |
                                        (static_cast<unsigned>(hdr[1]) << 8) |
                                        (static_cast<unsigned>(hdr[2]) << 16) |
                                        (static_cast<unsigned>(hdr[3]) << 24);
                    if (len > 4u * 1024u * 1024u)
                        goto done;
                    body.resize(static_cast<int>(len));
                    dst = body.data();
                    need = static_cast<int>(len);
                    got = 0;
                    readingBody = true;
                    if (need == 0)
                        goto deliver;
                    continue;
                }

            deliver: {
                const QJsonDocument doc = QJsonDocument::fromJson(body);
                const QJsonObject obj = doc.object();
                const QString op = obj.value(QStringLiteral("op")).toString();
                const QString text = obj.value(QStringLiteral("text")).toString();
                if (op == QLatin1String("out")) {
                    QMetaObject::invokeMethod(owner, "noteOutput", Qt::QueuedConnection,
                                              Q_ARG(QString, text));
                } else if (op == QLatin1String("cwd")) {
                    QMetaObject::invokeMethod(owner, "noteDirectory", Qt::QueuedConnection,
                                              Q_ARG(QString, text));
                } else if (op == QLatin1String("edit")) {
                    const int line = obj.value(QStringLiteral("line")).toInt(1);
                    QMetaObject::invokeMethod(owner, "noteEdit", Qt::QueuedConnection,
                                              Q_ARG(QString, text), Q_ARG(int, line));
                } else if (op == QLatin1String("version")) {
                    QMetaObject::invokeMethod(owner, "noteVersion", Qt::QueuedConnection,
                                              Q_ARG(QString, text));
                } else if (op == QLatin1String("status")) {
                    QMetaObject::invokeMethod(owner, "noteStatus", Qt::QueuedConnection,
                                              Q_ARG(QString, text));
                } else if (op == QLatin1String("last")) {
                    QMetaObject::invokeMethod(owner, "noteLast", Qt::QueuedConnection,
                                              Q_ARG(QString, text));
                } else if (op == QLatin1String("breaks")) {
                    QMetaObject::invokeMethod(owner, "noteBreaks", Qt::QueuedConnection,
                                              Q_ARG(QString, text));
                } else if (op == QLatin1String("err")) {
                    QMetaObject::invokeMethod(owner, "noteError", Qt::QueuedConnection,
                                              Q_ARG(QString, text));
                } else if (op == QLatin1String("debug")) {
                    /* Companion JSON uses 0/1 integers. toBool() is false unless
                       the value is a JSON boolean, so a pause never reached the editor. */
                    const bool armed = obj.value(QStringLiteral("armed")).toInt() != 0;
                    const bool paused = obj.value(QStringLiteral("paused")).toInt() != 0;
                    QMetaObject::invokeMethod(
                        owner, "noteDebug", Qt::QueuedConnection,
                        Q_ARG(bool, armed),
                        Q_ARG(bool, paused),
                        Q_ARG(int, obj.value(QStringLiteral("line")).toInt()),
                        Q_ARG(int, obj.value(QStringLiteral("off")).toInt()),
                        Q_ARG(int, obj.value(QStringLiteral("len")).toInt()),
                        Q_ARG(QString, obj.value(QStringLiteral("name")).toString()),
                        Q_ARG(QString, obj.value(QStringLiteral("path")).toString()));
                } else if (op == QLatin1String("pickdir")) {
                    /* The companion thread is blocked in this request. Show the
                       dialog on the GUI thread, queue the reply, then return so
                       the next flushOutgoing writes it. */
                    QMetaObject::invokeMethod(owner, "notePickDir", Qt::BlockingQueuedConnection,
                                              Q_ARG(QString, text));
                } else if (op == QLatin1String("bye") || op == QLatin1String("quit")) {
                    told = true;
                    QMetaObject::invokeMethod(owner, "noteStopped", Qt::QueuedConnection);
                }
                dst = reinterpret_cast<char *>(hdr);
                need = 4;
                got = 0;
                readingBody = false;
                body.clear();
            }
            }
        }

    done:
        sock.disconnectFromServer();
        if (!told && !owner->stopping())
            QMetaObject::invokeMethod(owner, "noteStopped", Qt::QueuedConnection);
    }
};

struct WakePair {
    QMutex mu;
    QWaitCondition cond;
};

} // namespace

ForthPipe::ForthPipe(QObject *parent) : QObject(parent) {}

ForthPipe::~ForthPipe() { shutdown(); }

QString ForthPipe::forthPath() const {
#ifndef EDITFORTH_FORTH_EXE
#define EDITFORTH_FORTH_EXE "forthx64"
#endif
#ifndef EDITFORTH_ARCH_NAME
#define EDITFORTH_ARCH_NAME "x64"
#endif
    const QString forthName = QString::fromLatin1(EDITFORTH_FORTH_EXE);
    const QString archName = QString::fromLatin1(EDITFORTH_ARCH_NAME);
    const QString archForth =
        QStringLiteral("Forth/build/") + archName + QLatin1Char('/') + forthName;
    const QString archRel = QStringLiteral("../../../") + archForth;
    const QStringList candidates = {
        QDir(QCoreApplication::applicationDirPath()).filePath(forthName),
        QDir(QCoreApplication::applicationDirPath()).filePath(archRel),
        QDir::current().filePath(archForth),
    };
    for (const QString &path : candidates) {
        if (QFileInfo::exists(path))
            return QFileInfo(path).absoluteFilePath();
    }
    return candidates.last();
}

QList<QByteArray> ForthPipe::takeOutgoing() {
    QMutexLocker lock(&m_mu);
    QList<QByteArray> batch = m_outq;
    m_outq.clear();
    return batch;
}

void ForthPipe::noteVersion(const QString &text) { emit versionReceived(text); }

void ForthPipe::noteStatus(const QString &text) { emit statusReceived(text); }

void ForthPipe::notePickDir(const QString &start) { emit pickDirRequested(start); }

void ForthPipe::post(const QByteArray &json) {
    QMutexLocker lock(&m_mu);
    m_outq.append(frameFor(json));
    if (m_wake != nullptr)
        static_cast<WakePair *>(m_wake)->cond.wakeAll();
}

void ForthPipe::start() {
    if (m_proc != nullptr)
        return;
    const QString path = forthPath();
    if (!QFileInfo::exists(path)) {
        emit engineFailed(QStringLiteral("Can't find %1.").arg(QFileInfo(path).fileName()));
        return;
    }
    m_stop = false;
    if (m_wake == nullptr)
        m_wake = new WakePair;

    const QString sockName =
        QStringLiteral("EditForthLin-%1").arg(QCoreApplication::applicationPid());

    m_proc = new QProcess(this);
    m_proc->setWorkingDirectory(QDir::currentPath());
    m_proc->start(path, {QStringLiteral("--companion"), sockName});
    if (!m_proc->waitForStarted(5000)) {
        emit engineFailed(QStringLiteral("%1 did not start.").arg(QFileInfo(path).fileName()));
        m_proc->deleteLater();
        m_proc = nullptr;
        return;
    }

    auto *reader = new SocketReader;
    reader->owner = this;
    reader->serverName = sockName;
    reader->wake = &static_cast<WakePair *>(m_wake)->cond;
    reader->wakeMu = &static_cast<WakePair *>(m_wake)->mu;
    m_reader = reader;
    reader->start();
}

void ForthPipe::shutdown() {
    if (m_stop.load() && m_proc == nullptr && m_reader == nullptr)
        return;
    m_stop = true;
    post(message("quit", QString()));
    if (m_wake != nullptr)
        static_cast<WakePair *>(m_wake)->cond.wakeAll();
    if (m_proc != nullptr) {
        if (!m_proc->waitForFinished(1500))
            m_proc->kill();
        m_proc->deleteLater();
        m_proc = nullptr;
    }
    if (m_reader != nullptr) {
        m_reader->wait(1500);
        delete m_reader;
        m_reader = nullptr;
    }
    if (m_wake != nullptr) {
        delete static_cast<WakePair *>(m_wake);
        m_wake = nullptr;
    }
}

void ForthPipe::eval(const QString &line) { post(message("eval", line)); }

void ForthPipe::sendKey(int key) { post(message("key", QString::number(key))); }

void ForthPipe::sendArm() { post(message("arm", QString())); }

void ForthPipe::requestBreaks() { post(message("breaks", QString())); }

void ForthPipe::enableBreak(int index, bool on) {
    post(message("break-en", QStringLiteral("%1,%2").arg(index).arg(on ? 1 : 0)));
}

void ForthPipe::toggleBreak(const QString &name) { post(message("break-toggle", name)); }

void ForthPipe::requestLast() { post(message("last", QString())); }

void ForthPipe::requestView(const QString &name) { post(message("view", name)); }

void ForthPipe::requestTree(const QString &mode) { post(message("tree", mode)); }

void ForthPipe::requestRunTo(int utf8Offset) { post(message("runto", QString::number(utf8Offset))); }

void ForthPipe::replyPickDir(const QString &path) { post(message("pickdir", path)); }

bool ForthPipe::signalBreak() {
    // Side-channel event comes with companion_linux; Esc key is the interim path.
    post(message("key", QString::number(27)));
    return true;
}

void ForthPipe::noteEdit(const QString &path, int line) { emit editReceived(path, line); }

void ForthPipe::noteLast(const QString &name) { emit lastReceived(name); }

void ForthPipe::noteOutput(const QString &text) { emit outputReceived(text); }

void ForthPipe::noteDirectory(const QString &path) { emit directoryChanged(path); }

void ForthPipe::noteStopped() { emit engineStopped(); }

void ForthPipe::noteFailed(const QString &message) { emit engineFailed(message); }

void ForthPipe::noteDebug(bool armed, bool paused, int line, int off, int len, const QString &name,
                          const QString &path) {
    emit debugReceived(armed, paused, line, off, len, name, path);
}

void ForthPipe::noteBreaks(const QString &text) { emit breaksReceived(text); }

void ForthPipe::noteError(const QString &text) { emit statusError(text); }
