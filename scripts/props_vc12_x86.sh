#!/bin/sh

PATH=/c/Program\ Files/Git/usr/bin/:$PATH

sed -i 's/#define VER_COMMENTS_STR            "Build with Visual Studio."/#define VER_COMMENTS_STR            "Build with Visual Studio 2013."/g' ConsoleApplication/ConsoleApplication/Version.h
sed -i 's/#define VER_FILE_DESCRIPTION_STR    VER_PRODUCTNAME_STR " (msvc)"/#define VER_FILE_DESCRIPTION_STR    VER_PRODUCTNAME_STR " (msvc12)"/g' ConsoleApplication/ConsoleApplication/Version.h
