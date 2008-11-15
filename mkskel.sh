#! /bin/sh
# $Id: mkskel.sh,v 1.2 2008/07/27 13:23:23 tom Exp $

cat <<!
/* File created from flex.skl via mkskel.sh */

#include "flexdef.h"

const char *skel[] =
{
!

sed 's/\\/&&/g' $* | sed 's/"/\\"/g' | sed 's/.*/    "&",/'

cat <<!
    0
};
!
