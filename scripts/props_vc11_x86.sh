#!/bin/sh

PATH=/c/Program\ Files/Git/usr/bin/:$PATH

find \( -name '*.sln' -o -name '*.vcxproj' \) -exec sed -i 's/\# Visual Studio 2013/\# Visual Studio 2012/g' {} \;

find \( -name '*.sln' -o -name '*.vcxproj' \) -exec sed -i '/VisualStudioVersion \=/d' {} \;

find \( -name '*.sln' -or -name '*.vcxproj' \) -exec sed -i 's/v120/v110/g' {} \;

find \( -name '*.sln' -or -name '*.vcxproj' \) -exec sed -i 's/ToolsVersion\=\"12\.0\"/ToolsVersion\=\"4\.0\"/g' {} \;

sed -i 's/#define VER_COMMENTS_STR            "Build with Visual Studio."/#define VER_COMMENTS_STR            "Build with Visual Studio 2012."/g' ConsoleApplication/ConsoleApplication/Version.h
sed -i 's/#define VER_FILE_DESCRIPTION_STR    VER_PRODUCTNAME_STR " (msvc)"/#define VER_FILE_DESCRIPTION_STR    VER_PRODUCTNAME_STR " (msvc11)"/g' ConsoleApplication/ConsoleApplication/Version.h
