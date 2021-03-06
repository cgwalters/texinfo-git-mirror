#+##############################################################################
#
# docbook.pm: convert to docbook
#
#    Copyright (C) 2008, 2009, 2010 Free Software Foundation, Inc.
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


# regarding sections and nodes, in docbook we don't care at all about the
# splitting done in the main program. When there is a node, it is recorded as
# being pending. When there is a section it is opened, and closed when 
# there is the next section or end of file.

use strict;

my %docbook_complex_format;
my $kept_footnote_function;
my $docbook_in_footnote;
my %docbook_sections;
my %def_format_docbook;
my %def_argument_types_docbook;

my $docbook_pending_node_id;
my $docbook_current_section;
my @docbook_multitable_stack = ();
my @docbook_table_stack = ();
my @docbook_special_quotation;


sub docbook_default_load(;$)
{
my $from_command_line = shift;

t2h_default_set_variables_xml();
set_default('DOCTYPE', '<!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN" "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd" [
  <!ENTITY tex "TeX">
  <!ENTITY latex "LaTeX">
]>');
@T2H_FORMAT_EXPAND = ('docbook');
@IMAGE_EXTENSIONS = ('eps', 'gif', 'jpg', 'jpeg', 'pdf', 'png', 'svg', 'txt');
set_default('INLINE_INSERTCOPYING', 1);
# this should lead to end_section being only called at the end of sectioning
set_default('USE_NODES', 0);
set_default('USE_SECTIONS', 1);

set_default('SHOW_MENU', 0);
set_default('SHOW_TITLE', 0);
set_default('HEADERS', 0);
set_default('SPLIT', '');
# certainly irrelevant
set_default('SIMPLE_MENU', 0);

t2h_default_push_handler(\&docbook_initialize_variables, \@command_handler_init);

%style_map = ();
t2h_default_copy_style_map (\%default_style_map, \%style_map);
foreach my $accent_command ('tieaccent', 'dotless', keys(%unicode_accents))
{
     $style_map{$accent_command} = { 'function' => \&xml_default_accent };
}

delete $style_map{'sc'}->{'inline_attribute'};
# FIXME there is a code element in v4.3 
$style_map{'code'}->{'inline_attribute'} = 'literal';
$style_map{'strong'}->{'inline_attribute'} = 'emphasis role="bold"';
$style_map{'kbd'}->{'inline_attribute'} = 'userinput';
$style_map{'w'}->{'end'} = '<!-- /@w -->';
$style_map{'='}->{'function'} = \&docbook_macron;
$style_map{'b'}->{'inline_attribute'} = 'emphasis role="bold"';
$style_map{'cite'}->{'inline_attribute'} = 'citetitle';
$style_map{'command'}->{'inline_attribute'} = 'command';
$style_map{'dfn'}->{'inline_attribute'} = 'firstterm';
$style_map{'emph'}->{'inline_attribute'} = 'emphasis';
$style_map{'env'}->{'inline_attribute'} = 'envar';
$style_map{'file'}->{'inline_attribute'} = 'filename';
$style_map{'i'}->{'inline_attribute'} = 'wordasword';
$style_map{'key'}->{'inline_attribute'} = 'keycap';
delete $style_map{'key'}->{'begin'};
delete $style_map{'key'}->{'end'};
$style_map{'option'}->{'inline_attribute'} = 'option';
$style_map{'t'}->{'inline_attribute'} = 'literal';
delete $style_map{'sansserif'}->{'inline_attribute'};
delete $style_map{'r'}->{'inline_attribute'};
$style_map{'indicateurl'}->{'inline_attribute'} = 'wordasword';
delete $style_map{'indicateurl'}->{'begin'};
delete $style_map{'indicateurl'}->{'end'};
$style_map{'var'}->{'inline_attribute'} = 'replaceable';
delete $style_map{'verb'}->{'inline_attribute'};
$style_map{'email'}->{'function'} = \&docbook_email;
$style_map{'math'}->{'function'} = \&docbook_math;
$style_map{'uref'}->{'function'} = \&docbook_uref;
$style_map{'url'}->{'function'} = \&docbook_uref;
$style_map{'titlefont'}->{'function'} = \&docbook_titlefont;
#$style_map{'samp'}->{'function'} = \&docbook_samp;
#delete $style_map{'samp'}->{'inline_attribute'};
$style_map{'samp'}->{'inline_attribute'} = 'literal';
$style_map{'samp'}->{'begin'} = '&lsquo;';
$style_map{'samp'}->{'end'} = '&rsquo;';

$kept_footnote_function = $style_map{'footnote'}->{'function'};
$style_map{'footnote'}->{'function'} = \&docbook_footnote;

foreach my $style (keys(%style_map))
{
   delete ($style_map{$style}->{'quote'});
}

#use Data::Dumper;
%style_map_pre = ();
t2h_default_copy_style_map (\%style_map, \%style_map_pre);

$style_map_pre{'r'}->{'inline_attribute'} = 'lineannotation';

$colon_command_punctuation_characters{'.'} = '&period;';
$colon_command_punctuation_characters{':'} = '&colon;';
$colon_command_punctuation_characters{'?'} = '&quest;';
$colon_command_punctuation_characters{'!'} = '&excl;';

$stop_paragraph_command{'titlefont'} = 0;

# FIXME
#$no_paragraph_commands{'anchor'} = 0;

# FIXME
delete $special_accents{'ringaccent'};
$special_accents{'ogonek'} = 'aeiuAEIU';

%simple_map = %default_simple_map;
%simple_map_pre = %simple_map;

# FIXME right? &lstrok; &Lstrok;
$things_map{'l'} = '/l';
$things_map{'L'} = '/L';
$things_map{'TeX'} = '&tex;';
$things_map{'LaTeX'} = '&latex;';
$things_map{'enddots'} = '&hellip;.';
$things_map{'minus'} = '&minus;';
# FIXME &lowast;
$things_map{'point'} = '-!-';
# FIXME &equiv;
$things_map{'equiv'} = '==';
# FIXME no &lsaquo; nor &rsaquo;
$things_map{'guilsinglright'} = '&gt;';
$things_map{'guilsinglleft'} = '&lt;';
# The following is unneeded because normal_text is redefined.
# FIXME it should certainly be better to leave those substitutions,
# or even hardcodes them in normal_text.
# t2h_remove_text_substitutions("'", 1, 0, 0, 1);
# t2h_remove_text_substitutions('`', 1, 0, 0, 1);

$things_map{'quotedblbase'} = '&ldquor;';
$things_map{'quotesinglbase'} = '&lsquor;';

%pre_map = %things_map;

#delete $inter_item_commands{'cindex'};

#$no_paragraph_commands{'cindex'} = 0;
$no_paragraph_commands{'float'} = 0;

%docbook_complex_format = (
   'example' => 'screen',
   'smallexample' => 'screen',
   'display' => 'literallayout',
   'smalldisplay' => 'literallayout',
   'lisp' => 'programlisting',
   'smalllisp' => 'programlisting',
   'format' => 'abstract',
   'smallformat' => 'screen'
);

%docbook_sections = (
  'top'  => 'chapter',
  'part' => 'part',
  'chapter'  => 'chapter',
  'unnumbered'  => 'chapter',
  'centerchap'  => 'chapter',
  'appendix' => 'appendix',
  'majorheading' => 'other',
  'chapheading' => 'other',
  'heading' => 'sect1',
  'subheading' => 'sect2',
  'subsubheading' => 'sect3',
  2 => 'sect1',
  3 => 'sect2',
  4 => 'sect3'
);

%def_format_docbook = (
  'deffn' => [ ['function', 'name'] ],
   'defvr' => [ ['varname', 'name'] ],
   'deftypefn' => [ [ 'returnvalue', 'type' ], ['function', 'name'] ], 
   'deftypeop' => [ ['returnvalue', 'type'], ['methodname', 'name'] ], 
   'deftypevr' => [ ['returnvalue', 'type'], ['varname', 'name'] ], 
   'defcv' => [ ['classname', 'class'], ['property', 'name'] ], 
   'deftypecv' => [ ['returnvalue', 'type'], ['property', 'name'] ], 
   'defop' => [ ['classname', 'class'], ['methodname', 'name'] ], 
   'deftp' => [ ['structname', 'name'] ] 
);

%def_argument_types_docbook = (
  'param' => 'replaceable', 
  'paramtype' => 'type', 
  'delimiter' => ''
);

@docbook_special_quotation = ('note', 'caution', 'important', 'tip', 'warning');

$region_formats_kept{'copying'} = 1;

%format_map = (
       'group'       =>  '',
       'raggedright'       =>  '',
       'copying'     =>  'copying',
       );

$print_Top = \&docbook_print_Top;
$print_Top_footer = \&docbook_print_Top_footer;
$print_page_head = \&docbook_print_page_head;
$print_foot_navigation = \&docbook_noop;
$contents = \&docbook_noop;
$shortcontents = \&docbook_noop;
$about_body = \&docbook_noop;
$print_page_foot = \&docbook_print_page_foot;
$end_section = \&docbook_end_section;
$one_section = \&docbook_one_section;

$acronym_like          = \&docbook_acronym_like;
$anchor_label          = \&docbook_anchor_label;
$begin_format_texi     = \&docbook_begin_format_texi;
$cartouche             = \&docbook_cartouche;
$cell                  = \&docbook_cell;
$complex_format        = \&docbook_complex_format;
$def                   = \&docbook_def;
$def_line              = \&docbook_def_line;
$def_item              = \&docbook_def_item;
$element_label         = \&docbook_element_label;
$external_ref          = \&docbook_external_ref;
$float                 = \&docbook_float;
$foot_line_and_ref     = \&docbook_foot_line_and_ref;
$format                = \&docbook_format;
$format_list_item_texi = \&docbook_format_list_item_texi;
$heading               = \&docbook_heading;
$image                 = \&docbook_image;
$image_files           = \&docbook_image_files;
$index_entry_command   = \&docbook_index_entry_command;
$index_entry_label     = \&docbook_index_entry_label;
$index_summary         = \&docbook_index_summary;
$internal_ref          = \&docbook_internal_ref;
$insertcopying         = \&docbook_insertcopying;
$list_item             = \&docbook_list_item;
$misc_element_label    = \&docbook_noop;
$normal_text           = \&docbook_normal_text;
$paragraph             = \&docbook_paragraph;
$preformatted          = \&docbook_preformatted;
$printindex            = \&docbook_printindex;
$protect_text          = \&xml_default_protect_text;
$quotation              = \&docbook_quotation;
$quotation_prepend_text = \&docbook_quotation_prepend_text;
$listoffloats          = \&docbook_noop;
$raw                   = \&docbook_raw;
$row                   = \&docbook_row;
$sp                    = \&docbook_sp;
$style                 = \&docbook_style;
$table_item            = \&docbook_table_item;
$table_line            = \&docbook_table_line;
$table_list            = \&docbook_table_list;
$misc_command_line     = \&docbook_misc_commands;


}

sub docbook_footnote
{
    $docbook_in_footnote = 1;
    my $result = &$kept_footnote_function(@_);
    $docbook_in_footnote = 0;
    return $result;
}

sub docbook_macron($$)
{
    my $accent = shift;
    my $args = shift;
    return $args->[0] . "&macr;";
}

sub docbook_samp($$)
{
    shift;
    my $args = shift;
    return "&lsquo;<literal>$args->[0]</literal>&rsquo;";
}

sub docbook_email($$)
{
    my $command = shift;
    my $args = shift;
    my $mail = shift @$args;
    my $text = shift @$args;
    $mail = main::normalise_space($mail);
    if (defined($text) and $text =~ /\S/)
    {
        # FIXME normalise_space would be more legible.
        #return docbook_add_id('ulink').' url="mailto:'.$mail.'">'.main::normalise_space($text).'</ulink>';
        return docbook_add_id('ulink').' url="mailto:'.$mail.'">'.$text.'</ulink>';
    }
    return docbook_add_id('email').">$mail</email>";
}

sub docbook_uref($$)
{
    shift;
    my $args = shift;
    my $url = shift @$args;
    my $text = shift @$args;
    my $replacement = shift @$args;
    $url = main::normalise_space($url);
    $text = '' if (!defined($text));
    $replacement = '' if (!defined($replacement));
    $replacement = $text if ($replacement eq '');
    $replacement = $url if ($replacement eq '');
    $replacement = main::normalise_space($replacement);
    
    return docbook_add_id('ulink')." url=\"$url\">$replacement</ulink>";
}

# FIXME
sub docbook_titlefont($$)
{
    shift;
    my $args = shift;
    return "$args->[0]";
}

# FIXME there ought to be something better... Like use tex4ht mathml
# output or something like that
sub docbook_math($$)
{
    shift;
    my $args = shift;
    my $text = shift @$args;
    return $text;
}


sub docbook_print_page_head($)
{
    my $fh = shift;
    my $language = get_conf('documentlanguage');
    my $doctype = get_conf('DOCTYPE');
    my $extension = get_conf('EXTENSION');
    print $fh <<EOT;
<?xml version="1.0"?>
$doctype
<book id="$Texi2HTML::THISDOC{'file_base_name'}.$extension" lang="$language">
EOT
}

sub docbook_print_page_foot($)
{
    my $fh = shift;
    print $fh "". docbook_close_section();
    print $fh <<EOT;
</book>
EOT
}

sub docbook_print_Top($$$)
{
    my $fh = shift;
    my $has_top_heading = shift;
    my $element = shift;
    main::print_lines($fh, $Texi2HTML::THIS_SECTION);
}

sub docbook_element_tag($)
{
   my $element = shift;
#print STDERR "$element->{'texi'}, $element->{'tag_level'}, $element->{'level'}\n";
   return $docbook_sections{$element->{'tag_level'}} if (exists($docbook_sections{$element->{'tag_level'}}));
   return $docbook_sections{$element->{'level'}} if (exists($docbook_sections{$element->{'level'}}));
}

sub docbook_node_id($)
{
   my $node_texi = shift;
   my $node = main::substitute_line($node_texi, 'docbook node id', {'code_style' => 1, 'remove_texi' => 1});
   $node =~ s/[\s\"]/-/g;
   return &$protect_text($node);
}

sub docbook_initialize_variables()
{
   $docbook_pending_node_id = undef;
   $docbook_current_section = undef;
   @docbook_multitable_stack = ();
   @docbook_table_stack = ();
}

sub docbook_add_id($)
{
    my $element = shift;
    my $result = "<$element";
    if (defined($docbook_pending_node_id) and (!$docbook_in_footnote or $element eq 'footnote'))
    {
        $result .= " id=\"$docbook_pending_node_id\"";
        $docbook_pending_node_id = undef;
    }
    return $result;
}

sub docbook_heading($$$$$)
{
    my $element = shift;
    my $command = shift;
    my $texi_line = shift;
    my $line = shift;
    my $in_preformatted = shift;

    if (defined($command) and $command =~ /heading/)
    {
        my $text = '';
        if (defined($line))
        {
            $text = $line;
            # this isn't done in main program in that case...
            chomp ($text);
            $text =~ s/^\s*//;
        }
        return docbook_add_id('bridgehead')." renderas=\"$docbook_sections{$command}\">$text</bridgehead>\n";
    }

    my $result = '';

# FIXME verify xreflabel 
    if ($command ne 'node')
    {
        # close previous section
        $result .= docbook_close_section();
        my $title = $element->{'text_nonumber'};
        my $label = '';
        my $xreflabel = '';
        if ($element->{'number'})
        {
            my $label_nr = $element->{'number'};
            #$label_nr =~ s/\.$//;
            $label = $label_nr;
        }
        else
        {
            my $xreftitle = $title;
            $xreflabel = " xreflabel=\"$xreftitle\"";
        }
        $result .= docbook_add_id(docbook_element_tag($element) . " label=\"${label}\"${xreflabel}");
        $result .= ">\n<title>$title</title>\n";
        $docbook_current_section = $element;
    }
    return $result;
}

sub docbook_element_label($$$$)
{
    my $id = shift;
    my $element = shift;
    my $command = shift;
    my $line = shift;

    if ($command eq 'node')
    {
        $docbook_pending_node_id = docbook_node_id($element->{'texi'});
    }
    return '';
}

sub docbook_paragraph($$$$$$$$$$$$)
{
    my $text = shift;
    my $align = shift;
    my $indent = shift;
    my $paragraph_command = shift;
    my $paragraph_command_formatted = shift;
    my $paragraph_number = shift;
    my $format = shift;
    my $item_nr = shift;
    my $enumerate_style = shift;
    my $number = shift;
    my $command_stack_at_end = shift;
    my $command_stack_at_begin = shift;

    if (defined($paragraph_number) and defined($$paragraph_number))
    {
       $$paragraph_number++;
    }

    # no para in multitables, caption and shortcaptions.
    my $top_stack = '';
    $top_stack = $command_stack_at_begin->[-1] if (scalar (@$command_stack_at_begin));
    return $text if ($top_stack eq 'multitable' or $top_stack eq 'shortcaption' or $top_stack eq 'caption' or $top_stack eq 'documentdescription');

    if ($text =~ /\S/)
    {
       #return docbook_add_id('para').">$text</para>";
       return "<para>$text</para>";
    }
    return $text;
}


sub docbook_def_line($$$$$$$$$$$$$$$)
{
   my $category_prepared = shift;
   my $name = shift;
   my $type = shift;
   my $arguments = shift;
   my $index_label = shift;
   my $arguments_array = shift;
   my $arguments_type_array = shift;
   my $unformatted_arguments_array = shift;
   my $command = shift;
   my $class_name = shift;
   my $category = shift;
   my $class = shift;
   my $style = shift;
   my $original_command = shift;

   my %unformatted_arguments = ();

   my @unformatted_args = @$unformatted_arguments_array;
   foreach my $type (@$arguments_type_array)
   {
      my $unformatted_arg = shift @unformatted_args;
      $unformatted_arguments{$type} = $unformatted_arg;
   }
   # FIXME unformatted!
   my $result = "<synopsis role=\"$unformatted_arguments{'category'}\"><indexterm role=\""
    .$main::index_prefix_to_name{$style}."\"><primary>$class_name</primary></indexterm>";

   my %arguments = ( 'prepared_category' => $category_prepared,
         'category' => $category,
         'name' => $name,
         'type' => $type,
         'class' => $class
    );
   foreach my $type (keys(%arguments))
   {
      $arguments{$type} = '' if (!defined($arguments{$type}));
   }

   foreach my $mandatory_arg (@{$def_format_docbook{$command}})
   {
      my $elem = $mandatory_arg->[0];
      #if ($elem eq 'returnvalue' and $unformatted_arguments{$mandatory_arg->[1]} =~ /^\s*\@code\{/)
      if ($elem eq 'returnvalue' and $unformatted_arguments{$mandatory_arg->[1]} =~ /\@code\{/)
      {
      # FIXME unformatted
          my $arg_without_at_command = $unformatted_arguments{$mandatory_arg->[1]};
          #$arg_without_at_command =~ s/\s*\@code\{//;
          #$arg_without_at_command =~ s/\}\s*$//;
          while ($arg_without_at_command =~ /\@code\{([^\{\}]*)\}/)
          {
              $arg_without_at_command =~ s/\@code\{([^\{\}]*)\}/$1/;
          }
          $result .= "<$elem>$arg_without_at_command</$elem>";
      }
      else
      {
          $result .= "<$elem>$arguments{$mandatory_arg->[1]}</$elem>";
      }
   }

   my @types = @$arguments_type_array;
   @unformatted_args = @$unformatted_arguments_array;
   foreach my $arg (@$arguments_array)
   {
      my $type = shift @types;
      my $unformatted = shift @unformatted_args;
      if (exists ($def_argument_types_docbook{$type}))
      {
         if ($def_argument_types_docbook{$type} and
                ($type eq 'paramtype' or ($unformatted !~ /^\s*\@var\{/)))
         {
            $result .= "<$def_argument_types_docbook{$type}>$arg</$def_argument_types_docbook{$type}>";
         }
         else
         {
            $result .= $arg;
         }
      }
   }

   $result .= "</synopsis>\n";
   return $result;
}

# FIXME 
# @deffn 
# @c comment
# @end deffn
# leads to the creation of a <definitionitem> with a comment within, 
# while there should be no definitionitem 
sub docbook_def_item($)
{
    my $text = shift;
    my $only_inter_item_commands = shift;

    if ($text =~ /\S/)
    {
       return '<blockquote>' . $text . '</blockquote>' unless $only_inter_item_commands;
       return $text;
    }
    return '';
}

sub docbook_def($)
{
   my $text = shift;
   return docbook_add_id('informalfigure').'>'.$text.'</informalfigure>';
}

sub docbook_preformatted($$$$$$$$$$$$)
{
    my $text = shift;
    my $pre_style = shift;
    my $class = shift;
    my $leading_command = shift;
    my $leading_command_formatted = shift;
    my $preformatted_number = shift;
    my $format = shift;
    my $item_nr = shift;
    my $enumerate_style = shift;
    my $number = shift;
    my $command_stack_at_end = shift;
    my $command_stack_at_begin = shift;

    return $text;
}

sub docbook_misc_commands($$$$$)
{
    my $macro = shift;
    my $line = shift;
    my $args = shift;
    my $stack = shift;
    my $state = shift;
#print STDERR "$macro $line";
#print STDERR "ARGS @$args\n" if defined ($args);
    #my $result_text = undef;
    my $result_text = undef;
    if ($macro eq 'c' or $macro eq 'comment' and scalar(@$args))
    {
       my $comment_line = $args->[0];
       chomp ($comment_line);
       # makeinfo remove all the leading spaces
       $comment_line =~ s/^\s//;
       $result_text = &$comment ($comment_line);
    }
    elsif ($macro eq 'settitle')
    {
     # FIXME to be formatted? Also maybe in line_command. And in html, it
     # is handled by heading _text
       my $arg = $args->[0];
       $arg =~ s/^\s*//;
       chomp($arg);
       $result_text = "<title>$arg</title>\n";
    }
    return ($macro, $line, $result_text);
}

sub docbook_foot_line_and_ref($$$$$$$)
{
    my $number_in_doc = shift;
    my $number_in_page = shift;
    my $footnote_id = shift;
    my $place_id = shift;
    my $document_file = shift;
    my $footnote_file = shift;
    my $lines = shift;
    my $state = shift;

    my $result = docbook_add_id('footnote').'>';
    foreach my $line (@$lines)
    {
       $result .= $line;
    }
    return ([], $result . '</footnote>');
}

sub docbook_any_ref($$$)
{
    my $type = shift;
    my $args = shift;
    my $unformatted_args = shift;

    # FIXME?
    if ($type eq 'inforef')
    {
        my $node_file = "($args->[2])$args->[0]";
        if ($args->[1] ne '')
        {
            return "*note $args->[1]: $node_file";
        }
        else
        {
            return "*note ${node_file}::";
        }
    }
    else
    {
        if (($args->[3] ne '') or ($args->[4] ne ''))
        {
            return '' if ($args->[4] eq '');
            my $section_name = $args->[2];
            $section_name = $args->[0] if ($section_name eq '');
            if ($type eq 'ref')
            {
                return gdt('section `@asis{}`{section_name}\'@asis{}\' in @cite{{book}}', { 'section_name' => $section_name, 'book' => $args->[4] },{'duplicate'=>1});
            }
            elsif ($type eq 'xref')
            {
                return gdt('See section `@asis{}`{section_name}\'@asis{}\' in @cite{{book}}', { 'section_name' => $section_name, 'book' => $args->[4] },{'duplicate'=>1});
            }
            elsif ($type eq 'pxref')
            {
                return gdt('see section `@asis{}`{section_name}\'@asis{}\' in @cite{{book}}', { 'section_name' => $section_name, 'book' => $args->[4] },{'duplicate'=>1});
            }
        }
        my $link = docbook_node_id($unformatted_args->[0]);
        my $title = $args->[2];
        $title = $args->[1] if ($title eq '');
        if ($title eq '')
        {
            if ($type eq 'ref')
            {
                return gdt('{ref}', {'ref' => docbook_add_id('xref')." linkend=\"$link\"></xref>"});
            }
            elsif ($type eq 'pxref')
            {
                return gdt('see {ref}', {'ref' => docbook_add_id('xref')." linkend=\"$link\"></xref>"});
            }
            elsif ($type eq 'xref')
            {
                return gdt('See {ref}', {'ref' => docbook_add_id('xref')." linkend=\"$link\"></xref>"});
            }
        }
        else
        {
            if ($type eq 'ref')
            {
                return gdt('{title_ref}', {'title_ref' => docbook_add_id('link')." linkend=\"$link\">$title</link>"});
            }
            elsif ($type eq 'pxref')
            {
                return gdt('see {title_ref}', {'title_ref' => docbook_add_id('link')." linkend=\"$link\">$title</link>"},{'duplicate'=>1});
            }
            elsif ($type eq 'xref')
            {
                return gdt('See {title_ref}', {'title_ref' => docbook_add_id('link')." linkend=\"$link\">$title</link>"},{'duplicate'=>1});
            }
        }
    }
}

sub docbook_external_ref($$$$$$$$$)
{
    my $type = shift;
    my $section = shift;
    my $book = shift;
    my $file = shift;
    my $href = shift;
    my $cross_ref = shift;
    my $args_texi = shift;
    my $formatted_args = shift;
    my $node = shift;
    
    return docbook_any_ref ($type, $formatted_args, $args_texi);
}

sub docbook_internal_ref($$$$$)
{
    my $type = shift;
    my $href = shift;
    my $short_name = shift;
    my $name = shift;
    my $is_section = shift;
    my $args_texi = shift;
    my $formatted_args = shift;

    return docbook_any_ref ($type, $formatted_args, $args_texi );
}

sub docbook_index_entry_command($$$$$)
{               
   my $command = shift;
   my $index_name = shift;
   my $label = shift;
   my $entry_texi = shift;
   my $entry_formatted = shift;

   return $label if (defined($label) and $label ne '');
   return docbook_index_entry_label('','','',$main::index_prefix_to_name{$index_name}, '', '', $entry_formatted, {});
}

sub docbook_index_entry_label($$$$$$$$$)
{   
    my $identifier = shift;
    my $preformatted = shift;
    my $entry = shift;
    my $index_name = shift;
    my $index_command = shift;
    my $texi_entry = shift;
    my $formatted_entry = shift;
    my $in_region_not_in_output = shift;
    my $index_entry = shift;

    return "<indexterm role=\"${index_name}\"><primary>${formatted_entry}</primary></indexterm>";
}

sub docbook_close_section()
{
    my $element = $docbook_current_section;

    if (!defined($element))
    {
        return '';
    }

    my $result = '';

    # there is a special case for a @chapter that is a child of @top
    # but should not be considered as is, since it is also toplevel.
    # @part, however may have other toplevel elements as children.
    return '' if ($element->{'child'} and (!$element->{'child'}->{'toplevel'} or $element->{'tag'} ne 'top'));
    $result .= '</'.docbook_element_tag($element).">\n";

    my $current = $element;
    # the second condition is such that top is closed only if it has
    # sub-elements below chapter.
    # the third condition is such that elements with a next element are
    # only closed for the last element, except when the next element is 
    # toplevel and below top, such that @top is closed before the first 
    # @chapter if there are @section or the like below @top
    while ($current->{'sectionup'} and !($current->{'sectionup'}->{'tag'} eq 'top' and $current->{'toplevel'}) and (!$current->{'childnext'} or ($current->{'childnext'}->{'toplevel'} and $current->{'sectionup'}->{'tag'} eq 'top')))
    {
        $current = $current->{'sectionup'};
        $result .= '</'.docbook_element_tag($current).">\n";
    }
    return $result;
}

sub docbook_end_section($$$)
{
    my $fh = shift;
    my $end_foot_navigation = shift;
    my $element = shift;
}

sub docbook_print_Top_footer($$)
{
    my $fh = shift;
    my $end_page = shift;
    my $element = shift;
}

sub docbook_one_section($$)
{
    my $fh = shift;
    my $element = shift;
    main::print_lines($fh);
    &$print_page_foot($fh);
}

sub docbook_insertcopying($)
{
    my $text = shift;
    my $comment = shift;
    my $simple_text = shift;

    return $text;
}

sub docbook_acronym_like($$$$$$)
{
    my $command = shift;
    my $acronym_texi = shift;
    my $acronym_text = shift;
    my $with_explanation = shift;
    my $explanation_lines = shift;
    my $explanation_text = shift;
    my $explanation_simply_formatted = shift;

    $command = 'abbrev' if ($command eq 'abbr');
    my $result = docbook_add_id($command).">$acronym_text</${command}>";
    if ($with_explanation)
    {
        $result .= " ($explanation_text)";
    }
    return $result;
}


sub docbook_image_files($$$$)
{
    my $base = shift;
    my $extension = shift;
    my $texi_base = shift;
    my $texi_extension = shift;
    my @files = ();
    return @files if (!defined($base) or ($base eq ''));
# FIXME should look at extension argument? makeinfo doesn't
#    push @files,"$base.$extension" if (defined($extension) and ($extension ne ''));
    foreach my $ext (@IMAGE_EXTENSIONS)
    {
        push @files, ["$base.$ext", "$texi_base.$ext"];
    }
    return @files;
}


sub docbook_image($$$$$$$$$$$$$$$$;$)
{
    my $file = shift;
    my $base = shift;
    my $preformatted = shift;
    my $file_name = shift;
    my $alt = shift;
    my $width = shift;
    my $height = shift;
    my $raw_alt = shift;
    my $extension = shift;
    my $working_dir = shift;
    my $file_path = shift;
    my $in_paragraph = shift;
    my $file_locations = shift;
    my $base_simple_format = shift;
    my $extension_simple_format = shift;
    my $file_name_simple_format = shift;
    my $line_nr = shift;

#    if (!defined($file_path) or $file_path eq '' or $file_path =~ /\.txt$/)
#    {
#        if (defined($extension) and $extension ne '')
#        {
#            $file = "$base.$extension";
#        }
#        else
#        {
#            $file = "$base.jpg";
#            $extension = 'jpg';
#        }
#        main::line_warn ("no image file for $base, (using $file)");
#    }
    my $txt_path;
    my @files = ();
    my @extensions = @IMAGE_EXTENSIONS;
    foreach my $file_location (@$file_locations)
    {
        my ($file_located, $path, $file_simple_format) = @$file_location;
        my $extension = shift @extensions;
        if (defined($path))
        {
           if ($extension eq 'txt' and !defined($txt_path))
           {
              $txt_path = $path;
           }
           else
           {
              push @files, [$file_located, uc($extension), $file_simple_format];
           }
        }
    }
    push @files, ["$base.jpg", 'JPG', "$base_simple_format.jpg" ] unless (@files);

    my $begin = docbook_add_id('inlinemediaobject').'>';
    my $end = '</inlinemediaobject>';
    if ($preformatted or !$in_paragraph)
    {
         $begin = docbook_add_id('informalfigure').'><mediaobject>';
         $end = '</mediaobject></informalfigure>';
    }
    my $result = $begin;
    foreach my $file_spec (@files)
    {
       $result .= "<imageobject><imagedata fileref=\"$file_spec->[2]\" format=\"$file_spec->[1]\"></imagedata></imageobject>";
    }
    if (defined($txt_path))
    {
       if (open(TXT, "<$txt_path"))
       {
          my $in_encoding = get_conf('IN_ENCODING');
          if (defined($in_encoding) and get_conf('USE_UNICODE'))
          {
              binmode(TXT, ":encoding($in_encoding)");
          }
          $result.="<textobject><literallayout>";
          while (my $img_txt = <TXT>)
          {
              $result .= $img_txt;
          }
          $result .= '</literallayout></textobject>';
          close(TXT);
       } 
       else
       {
          main::line_warn (sprintf(__("\@image file `%s' unreadable: %s"), $txt_path, $!), $line_nr);
       }
    }
    else
    {
        main::line_warn (sprintf(__("Cannot find \@image file `%s.txt'"), $base), $line_nr);
    }

    return "$result$end";
}

sub docbook_format_list_item_texi($$$$)
{
    my $format = shift;
    my $line = shift;
    my $prepended = shift;
    my $command = shift;

    my $result_line = undef;

    if (defined($command) and $command ne '' and !exists $special_list_commands{$format}->{$command} and $format ne 'itemize')
    {
        #@*table
        $line =~ s/^\s*//;
        $line =~ s/\s*$//;
        if (exists ($style_map{$command}))
        {
           $result_line = "\@$command\{$line\}\n";
        }
        elsif (exists ($things_map{$command}))
        {           
           $result_line = "\@$command\{\} $line\n";
        }           
        else        
        {           
           $result_line = "\@$command $line\n";
        }
    }

    return ($result_line, 0);
}


# row in multitable
sub docbook_row($$;$$)
{
    my $text = shift;
    my $macro = shift;
    my $columnfractions = shift;
    my $prototype_row = shift;
    my $prototype_lengths = shift;
    my $column_number = shift;

    my $result = '';
    if ($macro eq 'headitem')
    {
         if ($docbook_multitable_stack[-1] != 0)
         {
             $result .= "<thead>";
             $result = "</tbody>" . $result if ($docbook_multitable_stack[-1] == 1);
             $docbook_multitable_stack[-1] = 0;
         }
    }
    elsif ($docbook_multitable_stack[-1] != 1)
    {
         $result .= "<tbody>";
         $result = "</thead>" . $result if ($docbook_multitable_stack[-1] == 0);
         $docbook_multitable_stack[-1] = 1;
    }
    $result .= "<row>$text</row>";
    
    return $result;
}

# cell in multitable
sub docbook_cell($$;$$)
{
    my $text = shift;
    my $row_macro = shift;
    my $columnfractions = shift;
    my $prototype_row = shift;
    my $prototype_lengths = shift;
    my $column_number = shift;

    return "<entry>" . $text . '</entry>';
}

# if varlistentry_state is > 0 it means that a varlistentry is opened.
# if varlistentry_state is == 2 it means that we are in a succession
#          of term
# if varlistentry_state is == 1 it means that we are in the line
# Having a listitem in a varlistentry is a must, so an empty
# listitem is added if a varlistentry is closed and varlistentry_state == 2
#
# varlistentry acceps only term and listitem, so inter_item_commands
# are put in the next term, or, if at the end of the table in a last
# listitem
sub docbook_table_item($$$$$$)
{
    my $text = shift;
    my $index_label = shift;
    my $format = shift;
    my $command = shift;
#    my $formatted_command = shift;
    my $style_stack = shift;
#    my $text_formatted = shift;
#    my $text_formatted_leading_spaces = shift;
#    my $text_formatted_trailing_spaces = shift;
    my $item_cmd = shift;

#    $formatted_command = '' if (!defined($formatted_command));

#    if (defined($text_formatted))
#    {
#        $text_item = $text_formatted_leading_spaces . $text_formatted .$text_formatted_trailing_spaces;
#    }
#    else
#    {
#        $text_item = $text;
#    }

    my $result = '';
    my $prepended = '';
    if (defined($docbook_table_stack[-1]->{'inter_item'}))
    {
        #$formatted_command = $docbook_table_stack[-1]->{'inter_item'} . $formatted_command;
        $prepended = $docbook_table_stack[-1]->{'inter_item'};
        delete $docbook_table_stack[-1]->{'inter_item'};
    }
    if ($item_cmd eq 'item')
    {
        if ($docbook_table_stack[-1]->{'varlistentry_state'} == 2)
        {
            $result .= "<listitem><para><!-- empty table line --></para></listitem>";
        }
        if ($docbook_table_stack[-1]->{'varlistentry_state'} >= 1)
        {
            $result .= '</varlistentry>';
        }
        $docbook_table_stack[-1]->{'varlistentry_state'} = 2;
        $result .= '<varlistentry>';
    }
    $result .= '<term>';
    $result .= $prepended . $text ."</term>\n";
    return $result;
}

sub docbook_table_line($$$)
{
    my $text = shift;
    my $only_inter_item_commands = shift;
    my $before_items = shift;

    $only_inter_item_commands = '' if (!defined($only_inter_item_commands));

#print STDERR 

    if ($text =~ /\S/)
    {
        if ($before_items)
        {
            return $text;
        }

        if ($only_inter_item_commands)
        {
            $docbook_table_stack[-1]->{'inter_item'} = $text;
            return '';
        }
        else
        {
            $docbook_table_stack[-1]->{'varlistentry_state'} = 1;
            return "<listitem>$text</listitem>";
        }
        #return $text;
    }
    else
    {
        return '';
    }
}

sub docbook_list_item($$$$$$$$$)
{
    my $text = shift;
    my $format = shift;
    my $command = shift;
    my $formatted_command = shift;
    my $item_nr = shift;
    my $enumerate_style = shift;
    my $number = shift;
    my $prepended = shift;
    my $prepended_formatted = shift;
    my $only_inter_item_commands = shift;
    my $before_items = shift;

    $only_inter_item_commands = '' if (!defined($only_inter_item_commands));

#my $prep_t = 'UNDEF'; $prep_t = $prepended if (defined($prepended));
#$item_nr = 0 if (!defined($item_nr));
#print STDERR "  $item_nr --> $prep_t|${text}!!!!!\n";
    #return $text if ($only_inter_item_commands and $before_items);
    return  $text if ($before_items);
    return '<listitem>' . $text . "</listitem>\n";
}

sub docbook_table_list($$$$$$$$$)
{
    my $format_command = shift;
    my $text = shift;
    my $command = shift;
    my $formatted_command = shift;
# enumerate
    my $item_nr = shift;
    my $enumerate_style = shift;
# itemize
    my $prepended = shift;
    my $prepended_formatted = shift;
# multitable
    my $columnfractions = shift;
    my $prototype_row = shift;
    my $prototype_lengths = shift;
    my $number = shift;
    
    my $result = "<$format_command>";
    if ($format_command eq 'itemize')
    {
        my $itemfunction;
        #$prepended_formatted =~ s/^\s*// if (defined($prepended_formatted));
        $prepended =~ s/^\s*// if (defined($prepended));
        #if (defined($formatted_command) and $formatted_command ne '')
        if (defined($command) and $command ne '')
        {
            #$itemfunction = $formatted_command;
            $itemfunction = $command;
            #$itemfunction .= " $prepended_formatted" if (defined($prepended_formatted) and $prepended_formatted ne '');
            $itemfunction .= " $prepended" if (defined($prepended) and $prepended ne '');
        }
        #elsif (defined($prepended_formatted))
        elsif (defined($prepended))
        {
            #$itemfunction = $prepended_formatted;
            $itemfunction = $prepended;
        }
        my $mark = '';
       $mark = " mark=\"$itemfunction\"" if (defined($itemfunction) and $itemfunction ne '');
        return docbook_add_id('itemizedlist')."${mark}>$text</itemizedlist>";
    }
    elsif ($format_command eq 'enumerate')
    {
        my $numeration='arabic';
        if (defined($enumerate_style) and $enumerate_style ne '')
        {
           if ($enumerate_style =~ /^[A-Z]/)
           {
               $numeration = 'upperalpha';
           }
           elsif ($enumerate_style =~ /^[a-z]/)
           {
               $numeration = 'loweralpha';
           }
        }
        return docbook_add_id('orderedlist') ." numeration=\"$numeration\">$text</orderedlist>";
    }
    elsif ($format_command eq 'multitable')
    {
       my $result = docbook_add_id('informaltable').'><tgroup cols="'.$number.'">';
       my $fractions;
       my $multiply = 1;
       if (defined($columnfractions) and (ref($columnfractions) eq 'ARRAY')
           and scalar(@$columnfractions))
       {
           $fractions = [ @$columnfractions ];
           $multiply = 100;
       }
       elsif (defined($prototype_lengths) and (ref($prototype_lengths) eq 'ARRAY')
           and scalar(@$prototype_lengths))
       {
           $fractions = [ @$prototype_lengths ];
       }
       
       if (defined ($fractions))
       {
           foreach my $fraction (@$fractions)
           {
               $result .= '<colspec colwidth="'.($fraction*$multiply).'*"></colspec>';
           }
       }
       $text .= "</tbody>" if ($docbook_multitable_stack[-1] == 1);
       $text .= "</thead>" if ($docbook_multitable_stack[-1] == 0);
       pop @docbook_multitable_stack;
       return $result . "$text</tgroup></informaltable>";
    }
    elsif ($format_command =~ /^(v|f)?table$/)
    {
       $result = docbook_add_id('variablelist').'>';
       if (defined($docbook_table_stack[-1]->{'inter_item'}))
       { # there is a para in case there is only a comment, to avoid
         # an empty listitem
           $text .= "<listitem><para>$docbook_table_stack[-1]->{'inter_item'}</para></listitem>";
       }
       elsif ($docbook_table_stack[-1]->{'varlistentry_state'} == 2)
       {
           $text .= "<listitem><para><!-- empty table line --></para></listitem>";
       }
       $text .= '</varlistentry>' if ($docbook_table_stack[-1]->{'varlistentry_state'} >= 1);
       pop @docbook_table_stack;
       return $result . "$text</variablelist>\n";
    }
}

sub docbook_begin_format_texi($$$)
{
    my $command = shift;
    my $line = shift;
    my $state = shift;

    push (@docbook_multitable_stack, -1) if ($command eq 'multitable');
    push (@docbook_table_stack, {'varlistentry_state' => 0}) if ($command =~ /^(v|f)?table/);
    return $line;
}

# FIXME
sub docbook_sp($$)
{
   my $number = shift;
   my $preformatted = shift;
   return "";
}

sub docbook_index_summary($$)
{
    my $alpha = shift;
    my $nonalpha = shift;
    return '';
}

sub docbook_printindex($$)
{
    my $name = shift;
    my $printindex = shift;
    return docbook_add_id('index')."></index>\n";
}

sub docbook_complex_format($$)
{
    my $name = shift;
    my $text = shift;
    return '' if ($text eq '');
    my $result = docbook_add_id($docbook_complex_format{$name}).'>' .$text."</$docbook_complex_format{$name}>";
    return $result;
}

sub docbook_format($$)
{
    my $name = shift;
    my $element = shift;
    my $text = shift;
    return '' if ($text eq '');
    return $text if ($format_map{$name} eq '');
    if ($name eq 'copying')
    {
        # FIXME is info in docbook 5.0
        return "<bookinfo>\n<legalnotice>\n$text</legalnotice>\n</bookinfo>\n";
    }
    return docbook_add_id($format_map{$name}).'>' .$text."</$format_map{$name}>";
}

sub docbook_quotation_prepend_text($$)
{
    my $command = shift;
    my $argument_text = shift;

    return undef if (!defined($argument_text) or $argument_text =~ /^$/);

    chomp($argument_text);

    return undef if (grep {lc($argument_text) eq $_} @docbook_special_quotation);
    return gdt('@b{{quotation_arg}:} ', {'quotation_arg' => $argument_text}, {'keep_texi' => 1});
}


sub docbook_quotation($$$$$)
{
    my $command = shift;
    my $text = shift;
    my $argument_text = shift;
    my $argument_text_texi = shift;
    my $authors = shift;

    $argument_text_texi = '' if (!defined($argument_text_texi));
    chomp($argument_text_texi);
    my $docbook_command = 'blockquote';
    if (grep {lc($argument_text_texi) eq $_} @docbook_special_quotation)
    {
       $docbook_command = lc($argument_text_texi);
    }
    my $attribution = '';
    if ($authors)
    {
       foreach my $author (@$authors)
       {
           $attribution .= $author->{'author_text'};
       }
       $attribution = '<attribution>' .$attribution. '</attribution>' . "\n";
    }
    return  docbook_add_id($docbook_command).'>' .$attribution . $text . "</$docbook_command>\n";
}

sub docbook_style($$$$$$$$$)
{
    my $style = shift;
    my $command = shift;
    my $text = shift;
    my $args = shift;
    my $no_close =shift;
    my $no_open = shift;
    my $line_nr = shift;
    my $state = shift;
    my $command_stack = shift;
    my $kept_line_nrs = shift;

    my $result = $text;
    if (exists($style->{'function'}))
    {
        my $function = $style->{'function'};
        $result = &$function($command, $args, $command_stack, $state, $line_nr, $kept_line_nrs);
    }
    elsif (exists($style->{'inline_attribute'}))
    {
        my $element = $style->{'inline_attribute'};
        my $attribute_text = '';
        if ($element =~ /^(\w+)(\s+.*)/)
        {
            $element = $1;
            $attribute_text = $2;
        }

        if ($no_open)
        {
            $result = "<$element";
        }
        else
        {
            $result = docbook_add_id($element);
        }
        $result .= "$attribute_text>$text</$element>";
    }
    if (exists($style->{'begin'}) and !$no_open)
    {
        $result = $style->{'begin'} . $result;
    }
    if (exists($style->{'end'}) and !$no_close)
    {
        $result .= $style->{'end'};
    }
    return $result;
}

sub docbook_raw($$$)
{
    my $style = shift;
    my $text = shift;
    my $line_nr = shift;

    if ($style eq 'verbatim' or $style eq 'verbatiminclude')
    {
        return docbook_add_id('screen').'>' . &$protect_text($text) . '</screen>';
    }
    return '' unless (grep {$style eq $_} @EXPAND);
    if ($style eq 'docbook')
    {
        chomp ($text);
        return $text;
    }
    else
    {
        main::line_warn (sprintf(__("Raw format %s is not converted"), $style), $line_nr);
        return &$protect_text($text);
    }
}

sub docbook_cartouche($$)
{
    my $text = shift;

    return $text;
}

sub docbook_anchor_label($$)
{
    my $id = shift;
    my $anchor_text = shift;
    # FIXME use docbook_node_id
    return '<anchor id="'. &$protect_text($anchor_text) . '"></anchor>';
}

sub docbook_float($$$$$)
{
    my $text = shift;
    my $float = shift;
    my $caption = shift;
    my $shortcaption = shift;

    my $label_texi = $float->{'texi'};
    return $text if (!defined($label_texi) or $label_texi eq '');

    return docbook_anchor_label('',$label_texi) . $text;
}

sub docbook_normal_text($$$$$$$;$)
{
   my $text = shift;
   my $in_raw_text = shift; # remove_texi
   my $in_preformatted = shift;
   my $in_code = shift;
   my $in_math = shift;
   my $in_simple = shift;
#print STDERR "Bug: in_raw_text in_simple $text\n" if ($in_raw_text and $in_simple);
   my $style_stack = shift;
   my $state = shift;

   #$text = uc($text) if (in_cmd($style_stack, 'sc'));
   $text = &$protect_text($text) unless($in_raw_text);
   if (! $in_code and !$in_preformatted)
   {
       if (!$in_raw_text)
       {
           $text =~ s/---/\&mdash\;/g;
           $text =~ s/--/\&ndash\;/g;
           $text =~ s/``/\&ldquo\;/g;
           $text =~ s/''/\&rdquo\;/g;
       }
       else
       {
           #FIXME really do that ? It is done by makeinfo in html
            $text =~ s/``/"/g;
            $text =~ s/''/"/g;
            # FIXME really do that in raw text?
            $text =~ s/---/\x{1F}/g;
            $text =~ s/--/-/g;
            $text =~ s/\x{1F}/--/g;
       }
   }
   return $text;
}

sub docbook_noop
{
    return '';
}

1;
