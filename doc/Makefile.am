# $Id: Makefile.am,v 1.45 2011/10/21 18:42:34 karl Exp $
# Makefile.am for texinfo/doc.
#
# Copyright 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011
# Free Software Foundation, Inc.
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

# Put texinfo.txi first because that's the most important.
info_TEXINFOS = texinfo.txi info-stnd.texi info.texi
DISTCLEANFILES = texinfo texinfo-* info*.info*

# Use the programs built in our distribution, taking account of possible
# cross-compiling.
MAKEINFO = $(PERL) -I $(top_srcdir)/tp/ $(top_srcdir)/tp/texi2any.pl

# We'd also like to use something like this, but Automake calls
# "install-info" directly.
# INSTALL_INFO = $(top_builddir)/$(native_tools)/util/ginstall-info

TXI_XLATE = txi-cs.tex txi-de.tex txi-en.tex txi-es.tex txi-fr.tex \
	    txi-is.tex txi-it.tex txi-nl.tex txi-nb.tex txi-pl.tex \
	    txi-pt.tex txi-ru.tex txi-sr.tex txi-tr.tex txi-uk.tex

refcard_files = refcard/Makefile refcard/txicmdcheck \
                refcard/txirefcard-a4.pdf refcard/txirefcard.pdf \
		refcard/txirefcard.tex

# Include our texinfo.tex, not Automake's.
EXTRA_DIST = epsf.tex texinfo.tex \
             fdl.texi \
	     $(man_MANS) $(TXI_XLATE)
	     $(refcard_files)

if INSTALL_WARNINGS
install-data-local:
	@echo
	@echo "WARNING: If your texmf tree does not already contain"
	@echo "         up-to-date versions, you must install"
	@echo "             texinfo.tex and txi-??.tex manually,"
	@echo "         perhaps in TEXMF/tex/texinfo/,"
	@echo "         where TEXMF is a root of your TeX tree."
	@echo "         See doc/README for some considerations."
	@echo "         You can run make TEXMF=/your/texmf install-tex to do this."
	@echo
	@echo "         You may also need to install epsf.tex in"
	@echo "         TEXMF/tex/generic/dvips, if your TeX"
	@echo "         installation did not include it."
endif

texmf_texinfo = $(TEXMF)/tex/texinfo
texmf_dvips = $(TEXMF)/tex/generic/epsf
install-tex:
	test -n "$(TEXMF)" || (echo "TEXMF must be set." >&2; exit 1)
	$(mkinstalldirs) $(DESTDIR)$(texmf_texinfo) $(DESTDIR)$(texmf_dvips)
	$(INSTALL_DATA) $(srcdir)/texinfo.tex $(DESTDIR)$(texmf_texinfo)/texinfo.tex
	$(INSTALL_DATA) $(srcdir)/epsf.tex $(DESTDIR)$(texmf_dvips)/epsf.tex
	for f in $(TXI_XLATE); do \
	  $(INSTALL_DATA) $(srcdir)/$$f $(DESTDIR)$(texmf_texinfo)/$$f; done

# Do not create info files for distribution.
dist-info:
