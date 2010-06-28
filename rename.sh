#! /bin/sh
# $Id: rename.sh,v 1.5 2010/06/27 18:30:34 tom Exp $
# install-helper for flex/reflex
#
# $1 = input file
# $2 = output file
# $3 = actual name that flex is installed as
# $4 = actual name that header is installed as
# $5 = actual name that header is installed as
# $6+ = install program and possible options

LANG=C;     export LANG
LC_ALL=C;   export LC_ALL
LC_CTYPE=C; export LC_CTYPE
LANGUAGE=C; export LANGUAGE

SOURCE=$1; shift
TARGET=$1; shift
BINARY=$1; shift
HEADER=$1; shift
LIBNAME=$1; shift

CHR_LEAD=`echo "$BINARY" | sed -e 's/^\(.\).*/\1/'`
CHR_TAIL=`echo "$BINARY" | sed -e 's/^.//'`
ONE_CAPS=`echo $CHR_LEAD | tr '[a-z]' '[A-Z]'`$CHR_TAIL
ALL_CAPS=`echo "$BINARY" | tr '[a-z]' '[A-Z]'`

sed	-e "s,FlexLexer.h,${HEADER},g" \
	-e "s, flex\>, $BINARY,g" \
	-e "s,\<flex ,$BINARY ,g" \
	-e "s,\-lfl\>,-l$LIBNAME,g" \
	-e "s,\<Flex\>,$ONE_CAPS,g" \
	-e "s,\<FLEX\>,$ALL_CAPS,g" \
	<$SOURCE >source.tmp
"$@" source.tmp $TARGET
rm -f source.tmp
