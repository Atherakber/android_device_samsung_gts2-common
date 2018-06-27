#!/bin/sh

dir=`cd $(dirname $0) && pwd`
top=$dir/../../../..

if [ -n "$(find $dir -name \*.patch -type f)" ]; then
    for patch in `ls $dir/*.patch` ; do
        echo ""
        echo "#### patching ${patch##*/} ####"
        patch -p1 -N -i $patch -r - -d $top
    done
    echo ""
    echo "#### patches applied successfully ####"
    echo ""
    find . -name "*.orig" -delete
else
    echo ""
    echo "#### no patches to apply ####"
    echo ""
fi
