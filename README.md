# sqliteprebuilt
Prebuilt sqlite3 shared libraries for multiple platforms and their build scripts

## Features
* Enable JSON1 extension by default
* Support C API provided by sqlite3.h and C++ wrapper API provided by [SQLiteCpp](https://github.com/SRombauts/SQLiteCpp)

## Platforms
* Any PC platforms that supports cmake (OSX, Linux, Unix, Windows)
* Android NDK

## Important Notes
### Android
The currently in-use C++ runtime is gnustl_shared, so you must also copy it to your project. If you want a different runtime, you can change the `APP_STL` value in the `android/jni/Application.mk` make file.

