#! /bin/sh
# $Id: rename.sh,v 1.9 2024/12/31 21:58:47 tom Exp $
# install-helper for flex/reflex
#
# $1 = input file
# $2 = output file
# $3 = header file needed by this program
# $4 = library file needed by this program

LANG=C;     export LANG
LC_ALL=C;   export LC_ALL
LC_CTYPE=C; export LC_CTYPE
LANGUAGE=C; export LANGUAGE

my_tmpdir=`mktemp -d`
trap 'rm -rf "$my_tmpdir"; exit 1' 1 2 3 15
trap 'rm -rf "$my_tmpdir"; exit 0' 0

SOURCE=$1; shift
TARGET=$1; shift
HEADER=$1; shift
LIBNAME=$1; shift

initial=`basename "$SOURCE"`
renamed=`basename "$TARGET" | sed -e 's%\.%++.%'`
partial=$my_tmpdir/$initial

sed	-e "s,FlexLexer.h,${HEADER},g" \
	-e "s,\-lfl\>,-l$LIBNAME,g" \
	<"$SOURCE" >"$partial"
sh ./install-man "${partial}" "$TARGET"
sh ./install-man -l "${renamed}" "$TARGET"
