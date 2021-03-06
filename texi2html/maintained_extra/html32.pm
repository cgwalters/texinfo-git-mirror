# -*-perl-*-
#+##############################################################################
#
# html32.pm: output HTML 3.2
#
#    Copyright (C) 2003, 2004, 2007, 2009 Free Software Foundation, Inc.
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

use strict;

set_default('COMPLEX_FORMAT_IN_TABLE', 1);

#html_default_load();
t2h_default_load_format('html');

set_default('DOCTYPE', '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2//EN" "http://www.w3.org/TR/html32/loose.dtd">');

set_default('FRAMESET_DOCTYPE', get_conf('DOCTYPE'));

set_from_init_file('BODYTEXT', 'bgcolor="#FFFFFF" text="#000000" link="#0000FF" vlink="#800080" alink="#FF0000"');
# this controls the pre style for menus
$MENU_PRE_STYLE = '';

$NO_BULLET_LIST_STYLE ='';

$MENU_SYMBOL = '*';

# This lines are inserted before and after the shortcontents 
$BEFORE_OVERVIEW = "";
$AFTER_OVERVIEW = '';

# This lines are inserted before and after the contents 
$BEFORE_TOC_LINES = "";
$AFTER_TOC_LINES = '';

# html version for latex2html
set_default('L2H_HTML_VERSION', '3.2');

# no css. NO_CSS also triggers no class if html_default_attribute_class
# is used, which is the case for all the dynamically output elements.
set_default('NO_CSS', 1);

# no accesskey in html 3.2
set_default('USE_ACCESSKEY', 0);

# Similar with what t2h_default_set_iso_symbols(0) does but without changing
# all the things command, only a selected list.
# USE_ISO is not needed since normal_text is redefined.
set_default('OPEN_QUOTE_SYMBOL', '`');
set_default('CLOSE_QUOTE_SYMBOL', "'");
t2h_remove_text_substitutions("'", 1, 0, 0, 1);
t2h_remove_text_substitutions('`', 1, 0, 0, 1);

foreach my $command ('euro', 'geq', 'leq', 
   'bullet', 'equiv', 'expansion', 'point', 'result', 'arrow',
   'quotedblleft', 'quotedblright', 
   'quoteleft', 'quoteright',
   'quotedblbase', 'quotesinglbase', 'guillemetleft', 'guillemetright',
   'guillemotleft', 'guillemotright', 'guilsinglleft', 'guilsinglright')
{
    $things_map{$command} = &$protect_text($default_things_map{$command});
    $pre_map{$command} = $things_map{$command};
}

$things_map{'oe'} = '&#156;';
$things_map{'OE'} = '&#140;';
$things_map{'dots'} = '<small>...</small>';
$things_map{'enddots'} = '<small>...</small>';

$pre_map{'dots'} = '...';
$pre_map{'oe'} = $things_map{'oe'};
$pre_map{'OE'} = $things_map{'OE'};


$style_map{'sansserif'} = {};
$style_map{'r'} = {};
$style_map_pre{'r'} = {};
$style_map_pre{'sansserif'} = {};

$format_map{'multitable'} = 'table';

# formatting functions

$protect_text      = \&t2h_html32_protect_text;
$normal_text       = \&t2h_html32_normal_text;
#$acronym_like      = \&t2h_html32_acronym_like;
$acronym_like      = \&t2h_default_acronym_like;
$row               = \&t2h_html32_row;
$cell              = \&t2h_html32_cell;


# &quot; is not in html 3.2
sub t2h_html32_protect_text($)
{
   my $text = shift;
   $text =~ s/&/&amp;/g;
   $text =~ s/</&lt;/g;
   $text =~ s/>/&gt;/g;
   $text =~ s/\"/&#34;/g;
   return $text;
}

sub t2h_html32_normal_text($$$$$$$;$)
{
   my $text = shift;
   my $in_raw_text = shift;
   my $in_preformatted = shift;
   my $in_code = shift;
   my $in_math = shift;
   my $in_simple = shift;
   my $style_stack = shift;
   my $state = shift;

   $text = uc($text) if (in_cmd($style_stack, 'sc'));
   $text = &$protect_text($text) unless($in_raw_text);
   if (! $in_code and !$in_preformatted)
   {
       if ($in_raw_text) #FIXME really do that ? It is done by makeinfo
       {
           $text =~ s/``/"/g;
           $text =~ s/''/"/g;
       }
       else
       {
           $text =~ s/``/&#34;/g;
           $text =~ s/''/&#34;/g;
       }
       # FIXME really do that in raw text?
       $text =~ s/---/\x{1F}/g; 
       $text =~ s/--/-/g; 
       $text =~ s/\x{1F}/--/g;
   }
   return $text;
}

# no acronym, and no abbr in html 3.2
sub t2h_html32_acronym_like($$$$$$)
{
    my $command = shift;
    my $acronym_texi = shift;
    my $acronym_text = shift;
    my $with_explanation = shift;
    my $explanation_lines = shift;
    my $explanation_text = shift;
    my $explanation_simply_formatted = shift;
    
    if ($with_explanation)
    {
        return gdt('{acronym_like} ({explanation})', {'acronym_like' => $acronym_text, 'explanation' => $explanation_text},{'duplicate'=>1})
    }
    else
    {
        return $acronym_text;
    }
}

# row in multitable. no thead in html 3.2
sub t2h_html32_row($$)
{
    my $text = shift;
    my $macro = shift;

    if ($text =~ /\S/)
    {
         return '<tr>' . $text . '</tr>' . "\n";
    }
    return '';
}

# cell in multitable. in html 3.2 width is in pixel and not in percent in 
# th or td.
sub t2h_html32_cell($$)
{
    my $text = shift;
    my $row_macro = shift;
    my $columnfractions = shift;
    my $prototype_row = shift;

    $text =~ s/^\s*//;
    $text =~ s/\s*$//;

    if ($row_macro eq 'headitem')
    {
        return "<th>" . $text . '</th>';
    }
    return "<td>" . $text . '</td>';
}
