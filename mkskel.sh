#! /bin/sh
# $Id: mkskel.sh,v 1.5 2010/09/06 13:55:01 tom Exp $

cat <<!
/* File created from flex.skl via mkskel.sh */

#include "flexdef.h"

const char *const skel[] =
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
