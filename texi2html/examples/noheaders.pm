# -*-perl-*-
#+##############################################################################
#
# noheaders.pm: output html without headers. Obsoleted by --no-header
#
#    Copyright (C) 2004, 2007 Free Software Foundation, Inc.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License,
# or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# Originally written by Patrice Dumas.
#
#-##############################################################################
#
# does nothing in case of info (at least in the test suite)

$print_section            = \&T2H_NOHEAD_print_section;
$end_section              = \&T2H_NOHEAD_end_section;
$one_section              = \&T2H_NOHEAD_one_section;
$print_Top_footer	      = \&T2H_NOHEAD_print_Top_footer;
$print_misc_footer	      = \&T2H_NOHEAD_print_misc_footer;
$print_head_navigation    = \&T2H_NOHEAD_noop;
$print_navigation            = \&T2H_NOHEAD_noop;
$about_body		      = \&T2H_NOHEAD_about_body;

sub T2H_NOHEAD_noop
{
  return '';
}

########################################################################
# Layout for html for every sections
#

sub T2H_NOHEAD_print_section
{
    my $fh = shift;
    my $first_in_page = shift;
    my $previous_is_top = shift;
    my $nw = main::print_lines($fh);
}

sub T2H_NOHEAD_one_section($$)
{
    my $fh = shift;
    my $element = shift;
    main::print_lines($fh);
    print $fh "$DEFAULT_RULE\n" if ($DEFAULT_RULE ne '');
    &$print_page_foot($fh);
}

###################################################################
# Layout of top-page I recommend that you use @ifnothtml, @ifhtml,
# @html within the Top texinfo node to specify content of top-level
# page.
#
# If you enclose everything in @ifnothtml, then title, subtitle,
# author and overview is printed
# Texi2HTML::HREF of Next, Prev, Up, Forward, Back are not defined
# if $T2H_SPLIT then Top page is in its own html file
sub T2H_NOHEAD_print_Top_footer($$)
{
    my $fh = shift;
    print $fh "$DEFAULT_RULE\n" if ($DEFAULT_RULE ne '');
}

###################################################################
# Layout of Toc, Overview, and Footnotes pages
# By default, we use "normal" layout
# Texi2HTML::HREF of Next, Prev, Up, Forward, Back, etc are not defined
# use: my $buttons = [...] to redefine navigation buttons
sub T2H_NOHEAD_print_misc_header
{
    my $fh = shift;
    &$print_page_head($fh) if (get_conf('SPLIT'));
}
sub T2H_NOHEAD_print_misc_footer
{
    my $fh = shift;
    print $fh "$DEFAULT_RULE\n" if ($DEFAULT_RULE ne '');
    if (get_conf('SPLIT'))
    {
        &$print_page_foot($fh);
    }

}

sub T2H_NOHEAD_end_section($)
{
    my $fh = shift;
    print $fh "$DEFAULT_RULE\n" if ($DEFAULT_RULE ne '');
}

###################################################################
# Layout of navigation panel

sub T2H_NOHEAD_about_body
{
}

