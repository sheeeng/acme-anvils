#!/bin/sh

PATH=/c/Program\ Files/Git/usr/bin/:$PATH

VERSION_SHA1=`git rev-parse --short HEAD`
echo \$VERSION_SHA1: $VERSION_SHA1

VERSION_NUM=`git rev-list --count HEAD`
echo \$VERSION_NUM: $VERSION_NUM

BRANCH_NAME=`git rev-parse --abbrev-ref HEAD`
echo \$BRANCH_NAME: $BRANCH_NAME

BRANCH_SHA1=$BRANCH_NAME-$VERSION_SHA1
echo \$BRANCH_SHA1: $BRANCH_SHA1

VERMAJOR=4
echo \$VERMAJOR: $VERMAJOR

VERMINOR=0
echo \$VERMINOR: $VERMINOR

VERBUILD=0
echo \$VERBUILD: $VERBUILD

VERPRIVATE=$VERSION_NUM
echo \$VERPRIVATE: $VERPRIVATE

VERSTR=$VERMAJOR.$VERMINOR.$VERBUILD
echo \$VERSTR: $VERSTR

echo \$PWD: $PWD
echo \$WORKSPACE: $WORKSPACE

echo Patching copyrights.

sed -i "s/Copyright \o251 2015/Copyright \o251 `date +%Y`/g" PluginCreator/PluginCreator/Version.h

echo Patching copyrights.

echo Patching ConsoleApplication version.

sed -i "s/#define VERSION_MAJOR               0/#define VERSION_MAJOR               $VERMAJOR/" ConsoleApplication/ConsoleApplication/Version.h
sed -i "s/#define VERSION_MINOR               0/#define VERSION_MINOR               $VERMINOR/" ConsoleApplication/ConsoleApplication/Version.h
sed -i "s/#define VERSION_BUILD               0/#define VERSION_BUILD               $VERBUILD/" ConsoleApplication/ConsoleApplication/Version.h
sed -i "s/#define VERSION_PRIVATE             0/#define VERSION_PRIVATE             $VERPRIVATE/" ConsoleApplication/ConsoleApplication/Version.h
sed -i "s/#define VERSION_SHA1                \"c0ffee\"/#define VERSION_SHA1                \"$BRANCH_SHA1\"/" ConsoleApplication/ConsoleApplication/Version.h

sed -n -e 10,14p -e 19p -e 33p ConsoleApplication/ConsoleApplication/Version.h | tee $WORKSPACE/ConsoleApplication_version.log

echo Finish patching ConsoleApplication version.
