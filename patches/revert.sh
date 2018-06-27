#!/bin/sh

dir=`cd $(dirname $0) && pwd`
top=$dir/../../../..

if [ -n "$(find $dir -name \*.patch -type f)" ]; then
    for patch in `ls $dir/*.patch` ; do
        echo "#### reverting ${patch##*/} ####"
        patch -p1 -R -i $patch -r - -d $top
    done
    echo ""
    echo "#### reversions completed successfully ####"
    echo ""
    find . -name "*.orig" -delete
else
    echo ""
    echo "#### no patches to revert ####"
    echo ""
fi
