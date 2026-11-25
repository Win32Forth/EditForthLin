EditForthLin 2.7.6 for Linux.

The arm64 installer is attached. It was built on Ubuntu 24.04.5 LTS. This release has no amd64 package and no AppImage. The amd64 file still in the repository is Releases/editforthlin_2.6.3_amd64.deb.

Install on Ubuntu 24.04 arm64 from the directory that contains the package:

sudo apt update
sudo apt install ./editforthlin_2.7.6_arm64.deb

apt downloads Qt 6, X11, zenity, and the other libraries named by the package.

Package size: 5954224 bytes.
SHA256: cfbf7110c932ef937a54d39c2e51cb1da4181615f45f7c5d213ce6674024350a

This release ports EditForthWin 2.7.6.

- CORES, KEY?, and INCLUDED match the 2.7.6 kernel.
- The editor adds Markdown preview, stack-effect, stackcheck, and recent folders.
- Restart drops the previous quit frame, so the new Forth session keeps answering.
- Ask Forth does not save keys.
- The X11 GRAPHICS window draws TRUECOLOR, COLOR8, and 1-bit pictures, with a green character grid, arrow keys, and the mouse.
- S in the Julia programs opens a zenity Save Picture dialog. PNG, JPEG, and TIFF are written by the Forth picture words.
- Image load and the small OOP windows still return cancel.
- The stand-alone emit grid is 384 by 192.
- On arm64, ANS-VALIDATE passed 394 and failed 0. Hayes counts were all zero, including FPERRORS.
- Smoke: 1 2 + . prints 3. 1 2 3 4 .S shows four values.

x64 objects are assembled in this tree. Link and pack the amd64 installer on Linux Mint with bash build-x64.sh and bash scripts/pack-deb.sh amd64.
