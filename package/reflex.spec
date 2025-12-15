Summary: Fast lexical analyzer generator
# $XTermId: reflex.spec,v 1.34 2025/12/15 01:11:12 tom Exp $
Name: reflex
Version: 20251214
Release: 1
License: BSD
Group: Applications/Development
URL: https://invisible-island.net/archives/%{name}
Source0: %{URL}/%{name}-%{version}.tgz
Packager: Thomas Dickey <dickey@invisible-island.net>

%description
Reflex is a tool for generating scanners (programs which recognize
lexical patterns in text).  It reads the given input files for a
description of a scanner to generate.  The description is in the form of
pairs of regular expressions and C code, called rules.  Reflex generates
as output a C source file, lex.yy.c, which defines a routine yylex(). 
This file is compiled and linked with the -lrefl library to produce an
executable.  When the executable is run, it analyzes its input for
occurrences of the regular expressions.  Whenever it finds one, it
executes the corresponding C code.

This is based on flex 2.5.4a, and unlike so-called "new" flex,
remains compatible with POSIX lex.

%prep

%define debug_package %{nil}

%setup -q -n %{name}-%{version}

%build

INSTALL_PROGRAM='${INSTALL}' \
	./configure \
		--program-prefix=b \
		--target %{_target_platform} \
		--prefix=%{_prefix} \
		--bindir=%{_bindir} \
		--libdir=%{_libdir} \
		--mandir=%{_mandir}

make

%install
[ "$RPM_BUILD_ROOT" != "/" ] && rm -rf $RPM_BUILD_ROOT

make install DESTDIR=$RPM_BUILD_ROOT

strip $RPM_BUILD_ROOT%{_bindir}/%{name}

%clean
[ "$RPM_BUILD_ROOT" != "/" ] && rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root)
%{_bindir}/%{name}
%{_bindir}/%{name}++
%{_mandir}/man1/%{name}*.*
%{_includedir}/reFlexLexer.h
%{_libdir}/librefl.a

%changelog
# each patch should add its ChangeLog entries here

* Sun Dec 14 2025 Thomas E. Dickey
- testing reflex 20251214-1

* Wed Oct 12 2022 Thomas Dickey
- update manpage-dependency

* Sat Nov 11 2017 Thomas Dickey
- disable debug-build

* Sun Jun 27 2010 Thomas Dickey
- initial version
