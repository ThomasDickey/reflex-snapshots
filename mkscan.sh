#! /bin/sh
# $Id: mkscan.sh,v 1.1 2008/11/16 20:04:05 tom Exp $
# make the scan.c file for reflex, using POSIX locale.

LANG=C;     export LANG
LC_ALL=C;   export LC_ALL
LC_CTYPE=C; export LC_CTYPE
LANGUAGE=C; export LANGUAGE

"$@" | sed '/^#/s,\"[^/]*/scan.l\",\"scan.l\",'
