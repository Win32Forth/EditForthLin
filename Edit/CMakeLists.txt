cmake_minimum_required(VERSION 3.21)
project(EditForthLinEditor VERSION 0.1.5 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Widgets Network)
qt_standard_project_setup()

qt_add_executable(editforthlin
    src/main.cpp
    src/MainWindow.cpp
    src/CodeEdit.cpp
    src/DebugBar.cpp
    src/DiskDiff.cpp
    src/FindBar.cpp
    src/FolderSearch.cpp
    src/ForthConsole.cpp
    src/ForthPipe.cpp
    src/WebTab.cpp
    src/AskForth.cpp
    src/AskForthEmbed.cpp
)

target_link_libraries(editforthlin PRIVATE Qt6::Widgets Qt6::Network)

# Optional arch suffix for the binary name (default x64 on Linux Mint).
set(EDITFORTH_ARCH "x64" CACHE STRING "arch suffix for the editor executable")
message(STATUS "EditForthLin editor executable: editforthlin${EDITFORTH_ARCH}")

set_target_properties(editforthlin PROPERTIES
    OUTPUT_NAME "editforthlin${EDITFORTH_ARCH}"
)
