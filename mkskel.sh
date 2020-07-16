#! /bin/sh
# $Id: mkskel.sh,v 1.6 2020/07/15 23:24:16 tom Exp $

cat <<!
/* File created from flex.skl via mkskel.sh */

#include "flexdef.h"

const char *const skel[] =
{
!

sed 's/\\/&&/g' "$@" | \
sed 's/"/\\"/g' | \
sed 's/.*/    "&",/' | \
sed 's/	/\\t/g' | \
sed 's,^    "%%,    /*-----------------------------------------------------------------------*/\
    "%%,'

cat <<!
    0
};
!
