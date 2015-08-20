#!/bin/sh

VERSION_SHA1=`git rev-parse --short HEAD`
echo \$VERSION_SHA1: $VERSION_SHA1

VERSION_NUM=`git rev-list --count HEAD`
echo \$VERSION_NUM: $VERSION_NUM

BRANCH_NAME=`git rev-parse --abbrev-ref HEAD`
echo \$BRANCH_NAME: $BRANCH_NAME

BRANCH_SHA1=$BRANCH_NAME-$VERSION_SHA1
echo \$BRANCH_SHA1: $BRANCH_SHA1

PATH=/c/Program\ Files/Git/usr/bin/:$PATH

if [[ $JOB_NAME =~ "vc11" ]]
then
 VC_NAME="vc11" #msvs2012
elif [[ $JOB_NAME =~ "vc12" ]]
then
 VC_NAME="vc12" #msvs2013
else
 exit 42
fi

# Create raw (as-is) archive without proper file sorting.

ARCHIVE_DIRECTORY_NAME=consoleapplication_"$VC_NAME"_b"$BUILD_NUMBER"_"$VERSION_NUM"_"$BRANCH_SHA1"
echo \$ARCHIVE_DIRECTORY_NAME: $ARCHIVE_DIRECTORY_NAME

tar czvf "$ARCHIVE_DIRECTORY_NAME".tar.gz PluginCreator/Win32/ *_version.log
/c/Program\ Files/7-Zip/7z a -tzip -mx9 "$ARCHIVE_DIRECTORY_NAME" -r PluginCreator/Win32/ *_version.log
/c/Program\ Files/7-Zip/7z a -t7z -mx9 "$ARCHIVE_DIRECTORY_NAME" -r PluginCreator/Win32/ *_version.log

tar czvf "$ARCHIVE_DIRECTORY_NAME"_versionlog.tar.gz *_version.log
/c/Program\ Files/7-Zip/7z a -tzip -mx9 "$ARCHIVE_DIRECTORY_NAME"_versionlog *_version.log
/c/Program\ Files/7-Zip/7z a -t7z -mx9 "$ARCHIVE_DIRECTORY_NAME"_versionlog *_version.log

# Create archive after proper file sorting.

DEBUG_DIRECTORY_NAME=consoleapplication_"$VC_NAME"_b"$BUILD_NUMBER"_"$VERSION_NUM"_"$BRANCH_SHA1"_debug
echo \$DEBUG_DIRECTORY_NAME: $DEBUG_DIRECTORY_NAME
mkdir "$DEBUG_DIRECTORY_NAME"

find PluginCreator/Win32/Debug -type f -name '*[dD].*' -exec cp -pv {} "$DEBUG_DIRECTORY_NAME" \;
cp -rpv Projects/RTE/include "$DEBUG_DIRECTORY_NAME"
find PluginCreator/Win32/Debug -type f -name '*[dD].*' -exec cp -pv {} "$DEBUG_DIRECTORY_NAME" \;
cp -pv *_version.log "$DEBUG_DIRECTORY_NAME"

tar czvf "$DEBUG_DIRECTORY_NAME".tar.gz "$DEBUG_DIRECTORY_NAME"
/c/Program\ Files/7-Zip/7z a -tzip -mx9 "$DEBUG_DIRECTORY_NAME" -r "$DEBUG_DIRECTORY_NAME"/*
/c/Program\ Files/7-Zip/7z a -t7z -mx9 "$DEBUG_DIRECTORY_NAME" -r "$DEBUG_DIRECTORY_NAME"/*

RELEASE_DIRECTORY_NAME=consoleapplication_"$VC_NAME"_b"$BUILD_NUMBER"_"$VERSION_NUM"_"$BRANCH_SHA1"_release
echo \$RELEASE_DIRECTORY_NAME: $RELEASE_DIRECTORY_NAME
mkdir "$RELEASE_DIRECTORY_NAME"

find ConsoleApplication/Win32/Release -type f -not -name '*[dD].*' -exec cp -pv {} "$RELEASE_DIRECTORY_NAME" \;
cp -rpv Projects/RTE/include "$RELEASE_DIRECTORY_NAME"
find ConsoleApplication/Win32/Release -type f -not -name '*[dD].*' -exec cp -pv {} "$RELEASE_DIRECTORY_NAME" \;
cp -pv *_version.log "$RELEASE_DIRECTORY_NAME"

tar czvf "$RELEASE_DIRECTORY_NAME".tar.gz "$RELEASE_DIRECTORY_NAME"
/c/Program\ Files/7-Zip/7z a -tzip -mx9 "$RELEASE_DIRECTORY_NAME" -r "$RELEASE_DIRECTORY_NAME"/*
/c/Program\ Files/7-Zip/7z a -t7z -mx9 "$RELEASE_DIRECTORY_NAME" -r "$RELEASE_DIRECTORY_NAME"/*
