Summary: reflex - fast lexical analyzer generator
%define AppProgram reflex
%define AppVersion 20131209
# $XTermId: reflex.spec,v 1.5 2013/12/09 23:46:34 tom Exp $
Name: %{AppProgram}
Version: %{AppVersion}
Release: 1
License: BSD
Group: Applications/Development
URL: ftp://invisible-island.net/%{AppProgram}
Source0: %{AppProgram}-%{AppVersion}.tgz
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

%setup -q -n %{AppProgram}-%{AppVersion}

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

make install                    DESTDIR=$RPM_BUILD_ROOT

strip $RPM_BUILD_ROOT%{_bindir}/%{AppProgram}

%clean
[ "$RPM_BUILD_ROOT" != "/" ] && rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root)
%{_bindir}/%{AppProgram}
%{_bindir}/%{AppProgram}++
%{_mandir}/man1/%{AppProgram}.*
%{_includedir}/reFlexLexer.h
%{_libdir}/librefl.a

%changelog
# each patch should add its ChangeLog entries here

* Sun Jun 27 2010 Thomas Dickey
- initial version
