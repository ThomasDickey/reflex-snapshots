#! /bin/sh
# $Id: mkskel.sh,v 1.4 2008/11/16 16:04:13 tom Exp $

cat <<!
/* File created from flex.skl via mkskel.sh */

#include "flexdef.h"

const char *skel[] =
{
!

sed 's/\\/&&/g' $* | \
sed 's/"/\\"/g' | \
sed 's/.*/    "&",/' | \
sed 's/	/\\t/g' | \
sed 's,^    "%%,    /*-----------------------------------------------------------------------*/\
    "%%,'

cat <<!
    0
};
!
