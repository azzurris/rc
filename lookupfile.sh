#!/bin/sh
echo -e "!_TAG_FILE_SORTED\t2\t/2=foldcase/"> filenametags
find ./ -name "*.c" -o -name "*.h"|find  -printf "%f\t%p\t1\n" | sort -f>> filenametags
