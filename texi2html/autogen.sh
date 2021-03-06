#! /bin/sh
# Run this to generate all the initial makefiles, etc.

test -f Makefile.am || cd "`dirname \"$0\"`"

#autopoint -f
#cp po/* po_messages
#cp po/* po_document
#rm -rf po

gettextize -f --no-changelog --po-dir=po_messages
gettextize -f --no-changelog --po-dir=po_document

# Create `aclocal.m4'.
mkdir -p m4
aclocal -I m4

# Create `Makefile.in' from `Makefile.am', and symlink `install-sh',
# `missing' and `mkinstalldirs' from /usr/share/automake.
automake --add-missing -c

# Create `configure' from `configure.in'.
autoconf
