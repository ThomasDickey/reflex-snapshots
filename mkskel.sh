#! /bin/sh
# $Id: mkskel.sh,v 1.7 2024/12/31 21:10:52 tom Exp $

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
    NULL
};
!
