# vim: set filetype=perl: 
# 
# Convert to texinfo xml.
# 
# This file is in the public domain. Thus it may easily be used as an 
# example for further customizations.
#
# Originally written by Patrice Dumas in 2009.

use strict;

my @xml_multitable_stack = ();
my @xml_table_stack = ();

my @xml_ignored_misc_commands;
my %xml_misc_command_output;
my %xml_misc_elements_with_arg_map;
my @xml_misc_elements_with_arg;
my %def_format_xml; 
my $xml_current_section;

sub xml_default_load(;$)
{
my $from_command_line = shift;

t2h_default_set_variables_xml();
set_default('DOCTYPE', '<!DOCTYPE texinfo PUBLIC "-//GNU//DTD TexinfoML V4.12//EN" "http://www.gnu.org/software/texinfo/dtd/4.12/texinfo.dtd">');
set_default('SIMPLE_MENU', 0);
set_default('SEPARATE_DESCRIPTION', 1);
@T2H_FORMAT_EXPAND = ('xml', 'direntry');
set_default('HEADERS', 0);
set_default('INLINE_INSERTCOPYING', 0);
set_default('SHOW_MENU', 1);
set_default('SHOW_TITLE', 0);
set_default('NUMBER_SECTIONS', 0);
set_default('USE_NODES', 1);
set_default('USE_SECTIONS', 1);
set_default('SPLIT', '');

t2h_default_push_handler(\&xml_init_variables, \@command_handler_init);

$colon_command_punctuation_characters{'.'} = '&period;';
$colon_command_punctuation_characters{':'} = '&colon;';
$colon_command_punctuation_characters{'?'} = '&quest;';
$colon_command_punctuation_characters{'!'} = '&excl;';

$simple_map{'*'} = '&linebreak;';
$simple_map{' '} = '&space;';
$simple_map{"\t"} = '&space;';
$simple_map{"\n"} = '&space;';
$simple_map{'.'} = '&eosperiod;';
$simple_map{'!'} = '&eosexcl;';
$simple_map{'?'} = '&eosquest;';

%simple_map_pre = %simple_map;

# FIXME right?
$things_map{'l'} = '/l';
$things_map{'L'} = '/L';
$things_map{'enddots'} = '&enddots;';
$things_map{'dots'} = '&dots;';
# FIXME equiv, point, expansion could be ameliorated
$things_map{'equiv'} = '==';
$things_map{'point'} = '-!-';
$things_map{'expansion'} = '==&gt;'; # &rarr;?

$things_map{'minus'} = '&minus;';
$things_map{'result'} = '&rArr;';
$things_map{'bullet'} = '&bullet;';
$things_map{'copyright'} = '&copyright;';
$things_map{'registeredsymbol'} = '&registered;';
$things_map{'arrow'} = '&rarr;';
$things_map{'TeX'} = '&tex;';
$things_map{'LaTeX'} = '&latex;';

%pre_map = %things_map;

$stop_paragraph_command{'caption'} = 1;
$stop_paragraph_command{'shortcaption'} = 1;

%line_command_map = ();
foreach my $command ('contents', 'shortcontents', 'summarycontents')
{
   $line_command_map{$command} = $command;
}

%format_map = ();

$format_map{'copying'} = '';
$format_map{'titlepage'} = 'titlepage';
$format_map{'documentdescription'} = 'documentdescription';
$format_map{'group'} = 'group';
$format_map{'raggedright'} = 'raggedright';

foreach my $region ('titlepage', 'documentdescription', 'copying')
{
   $region_formats_kept{$region} = 1;
}

%style_map = ();
t2h_default_copy_style_map (\%default_style_map, \%style_map);

foreach my $style (keys(%style_map))
{
    next if grep {$style eq $_} ('asis', 'ctrl', 'w');
    if (grep {$style eq $_} ('tieaccent', 'dotless', keys(%unicode_accents)))
    {
     $style_map{$style} = { 'function' => \&xml_default_accent };
    }
    elsif (!exists($style_map{$style}->{'args'}) or (scalar(@{$style_map{$style}->{'args'}}) eq 1 and ($style_map{$style}->{'args'}->[0] eq 'code' or $style_map{$style}->{'args'}->[0] eq 'normal')))
    {
        $style_map{$style}->{'inline_attribute'} = $style;
        delete ($style_map{$style}->{'quote'});
        delete ($style_map{$style}->{'begin'});
        delete ($style_map{$style}->{'end'});
        delete ($style_map{$style}->{'function'});
    }
}

foreach my $complex_format (keys(%complex_format_map))
{
   my $style = $complex_format_map{$complex_format}->{'style'};
   delete $complex_format_map{$complex_format};
   $complex_format_map{$complex_format}->{'begin'} = "<$complex_format xml:space=\"preserve\">";
   $complex_format_map{$complex_format}->{'end'} = "</$complex_format>";
   $complex_format_map{$complex_format}->{'style'} = $style if (defined($style));
}
foreach my $menu_command('menu', 'detailmenu', 'direntry', 'menu_comment')
{
  $complex_format_map{$menu_command} = undef;
  delete $complex_format_map{$menu_command};
}

# this is not needed because normal_text isn't the same than in html
#t2h_remove_text_substitutions("'", 1, 0, 0, 1);
#t2h_remove_text_substitutions('`', 1, 0, 0, 1);

$style_map{'w'}->{'end'} = '<!-- /@w -->';
$style_map{'='}->{'function'} = \&xml_macron;
$style_map{'email'}->{'function'} = \&xml_email;
$style_map{'titlefont'}->{'function'} = \&xml_titlefont;
$style_map{'math'}->{'function'} = \&xml_math;
$style_map{'uref'}->{'function'} = \&xml_uref;
$style_map{'url'}->{'function'} = \&xml_uref;
$style_map{'t'}->{'inline_attribute'} = 'tt';
# FIXME
delete $special_accents{'ringaccent'};
$special_accents{'ogonek'} = 'aeiuAEIU';

%style_map_pre = %style_map;

$no_paragraph_commands{'cindex'} = 0;

#my @xml_ignored_misc_commands = ('bye', 'sp', 'verbatiminclude');

@xml_ignored_misc_commands = ('bye', 'sp', 'verbatiminclude', 'clickstyle', 
  'defcodeindex',
  'syncodeindex', 'paragraphindent', 'shorttitlepage', 'refill', 'noindent');

# we want to proceed all the misc commands
# makeinfo ignores clickstyle, changes setfilename. Not sure it is right.
foreach my $misc_command (keys(%misc_command))
{
    next if (grep {$misc_command eq $_} @xml_ignored_misc_commands);
    $xml_misc_command_output{$misc_command} = 1;
}

$format_map{'menu'} = 'menu';
# checked on bug-texinfo, only node is in code_style, as with makeinfo --xml
#$format_code_style{'menu'} = 1;
#$format_code_style{'menu_name'} = 1;
#$format_code_style{'menu_description'} = 1;
$format_map{'detailmenu'} = 'detailmenu';
$format_map{'direntry'} = 'direntry';
$format_map{'menu_comment'} = '';

$menu_description = \&xml_menu_description;
$menu_link = \&xml_menu_link;
$element_heading = \&xml_heading;
$heading = \&xml_heading;
$paragraph = \&xml_paragraph;
$preformatted = \&xml_preformatted;
$misc_element_label = \&xml_noop;
$element_label = \&xml_noop;
$anchor_label = \&xml_anchor_label;
$index_entry_label = \&xml_index_entry_label;
$index_entry_command = \&xml_index_entry_command;
$listoffloats = \&xml_listoffloats;
$acronym_like = \&xml_acronym_like;
$foot_line_and_ref = \&xml_foot_line_and_ref;
$image = \&xml_image;
$sp = \&xml_sp;
$quotation = \&xml_quotation;
$table_list = \&xml_table_list;
$row = \&xml_row;
$cell = \&xml_cell;
$list_item = \&xml_list_item;
$format_list_item_texi = \&xml_format_list_item_texi;
$misc_command_line = \&xml_misc_commands;
$begin_format_texi = \&xml_begin_format_texi;
$def_line = \&xml_def_line;
$def = \&xml_def;
$def_item = \&xml_def_item;
$printindex = \&xml_printindex;
$index_summary = \&xml_index_summary;
$external_ref = \&xml_external_ref;
$internal_ref = \&xml_internal_ref;
$table_item = \&xml_table_item;
$table_line = \&xml_table_line;
$float = \&xml_float;
$caption_shortcaption = \&xml_caption_shortcaption;
$caption_shortcaption_command = \&xml_caption_shortcaption_command;
$normal_text = \&xml_normal_text;
$protect_text = \&xml_default_protect_text;
$paragraph_style_command = \&xml_paragraph_style_command;
$raw = \&xml_raw;
$cartouche = \&xml_cartouche;

$print_Top = \&xml_print_Top;
$print_Top_footer = \&xml_print_Top_footer;
$print_page_head = \&xml_print_page_head;
$print_foot_navigation = \&xml_noop;
$toc_body = \&xml_noop;
$about_body = \&xml_noop;
$print_page_foot = \&xml_print_page_foot;
$end_section = \&xml_end_section;
$one_section = \&xml_one_section;

%xml_misc_elements_with_arg_map = (
  'title'     => 'booktitle',
  'subtitle'  => 'booksubtitle'
);

@xml_misc_elements_with_arg = ('author',
  'dircategory', 'settitle');
#my @xml_misc_elements_with_arg = ('author', 'shorttitlepage',
#  'vskip', 'dircategory', 'settitle');

%def_format_xml = (
  'deffn' => [ ['category', 'category'], ['function', 'name'] ],
   'defvr' => [ ['category', 'category'], ['variable', 'name'] ],
   'deftypefn' => [ ['category', 'category'], ['type', 'type'], ['function', 'name'] ], 
   'deftypeop' => [ ['category', 'category'], ['type', 'type'], ['operation', 'name'] ], 
   'deftypevr' => [ ['category', 'category'], ['type', 'type'], ['variable', 'name'] ], 
   'defcv' => [ ['category' , 'category'], ['class', 'class'], ['classvar', 'name'] ], 
   'deftypecv' => [ ['category', 'category'], ['type', 'type'], ['classvar', 'name'] ], 
   'defop' => [ ['category', 'category'], ['class', 'class'], ['operation', 'name'] ], 
   'deftp' => [ ['category', 'category'], ['datatype', 'name'] ] 
);


}

sub xml_macron($$)
{
    my $accent = shift;
    my $args = shift;
    return $args->[0] . "&macr;";
}

sub xml_email($$)
{
    my $command = shift;
    my $args = shift;
    my $mail = shift @$args;
    my $text = shift @$args;
    $mail = main::normalise_space($mail);
    my $result = "<email><emailaddress>$mail</emailaddress>";
    if (defined($text) and $text =~ /\S/)
    {
        $result .= "<emailname>".main::normalise_space($text)."</emailname>";
    }
    return $result . '</email>';
}

sub xml_uref($$)
{
    shift;
    my $args = shift;
    my $url = shift @$args;
    my $text = shift @$args;
    my $replacement = shift @$args;
    $url = main::normalise_space($url);
    $replacement = '' if (!defined($replacement));
    $replacement = main::normalise_space($replacement);
    $text = '' if (!defined($text));
    $text = main::normalise_space($text);
    my $result = "<uref><urefurl>$url</urefurl>";
    $result .= "<urefdesc>$text</urefdesc>" if ($text ne '');
    $result .= "<urefreplacement>$replacement</urefreplacement>" if ($replacement ne '');
    return $result.'</uref>';
}


sub xml_titlefont($$)
{
    shift;
    my $args = shift;
    return "<titlefont>$args->[0]</titlefont>";
}

sub xml_math($$)
{
    shift;
    my $args = shift;
    my $text = shift @$args;
    return "<math>$text</math>";
}


sub xml_menu_description($$$)
{
    my $text = shift;
    my $state = shift;
    my $element_text = shift;
    return "<menucomment>$text</menucomment>\n</menuentry>";
}

sub xml_menu_link($$$$$$$$$$)
{
    my $entry = shift;
    my $state = shift;
    my $href = shift;
    my $menunode = shift;
    my $menutitle = shift;
    my $ending = shift;
    my $has_title = shift;
    my $command_stack = shift;
    my $in_preformatted = shift;
    my $menunode_normalized = shift;

    return "<menuentry>\n<menunode>$menunode_normalized</menunode>\n<menutitle>$menutitle</menutitle>\n";
}

sub xml_print_page_head($)
{
    my $fh = shift;
    my $setfilename = '';
    $setfilename = "<setfilename>$Texi2HTML::THISDOC{'file_base_name'}.".get_conf('EXTENSION')."</setfilename>" 
        unless (defined(get_conf('setfilename')) and get_conf('setfilename') ne '');
    my $language = get_conf('documentlanguage');
    my $doctype = get_conf('DOCTYPE');
    print $fh <<EOT;
<?xml version="1.0"?>
$doctype
<texinfo xml:lang="$language">
$setfilename
EOT
}

sub xml_print_page_foot($)
{
    my $fh = shift;
    print $fh "". xml_close_section();
    print $fh <<EOT;
</texinfo>
EOT
}

sub xml_one_section($$)
{
    my $fh = shift;
    my $element = shift;
    main::print_lines($fh);
    #print $fh "". xml_footing($element);
    &$print_foot_navigation($fh);
    &$print_page_foot($fh);
}

sub xml_heading($$$$$)
{
    my $element = shift;
    my $command = shift;
    my $texi_line = shift;
    my $line = shift;
    my $in_preformatted = shift;

#print STDERR "'$command' $line";
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
        return "<${command}>$text</${command}>\n";
    }
    elsif (defined($command) and $command eq 'node')
    {
#print STDERR "node $command $node_element->{'texi'}\n";
        my $result = '';
        $result .= xml_close_section();
        $result .= "<node>\n";
        $result .= "<nodename>$element->{'text'}</nodename>\n";
        foreach my $direction('nodenext', 'nodeprev', 'nodeup')
        {
            if ($element->{$direction})
            {
                $result .= "<${direction}>$element->{$direction}->{'text'}</${direction}>\n";
            }
        }
        $result .= "</node>\n";
        return $result;
        
    }
    else
    {
        my $result = '';
        $result .= xml_close_section();
        $result .= "<".xml_element_tag($element).">\n<title>$element->{'text'}</title>\n";
        $xml_current_section = $element;
        return $result;
    }
}

sub xml_element_tag($)
{
    my $element = shift;
    my $class = $element->{'tag_level'};
    return $class;
}

sub xml_close_section()
{
    my $element = $xml_current_section;

    if (!defined($element))
    {
        return '';
    }
    my $result = '';

    $xml_current_section = undef;

    # there is a special case for a @chapter that is a child of @top
    # but should not be considered as is, since it is also toplevel.
    # @part, however may have other toplevel elements as children.
    return '' if ($element->{'child'} and (!$element->{'child'}->{'toplevel'} or $element->{'tag'} ne 'top'));
    $result .= '</'.xml_element_tag($element).">\n";

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
        $result .= '</'.xml_element_tag($current).">\n";
    }
    return $result;

    ## there is a special case for a @chapter that is a child of @top
    ## but should not be considered as is, since it is also toplevel.
    #return '' if ($element->{'child'} and !$element->{'child'}->{'toplevel'});
    #$result .= '</'.xml_element_tag($element).">\n";

    #return $result if ($element->{'sectionnext'} or $element->{'level'} <= 1);
    #my $current = $element;
    #while ($current->{'level'} != 1 and $current->{'sectionup'} and !$current->{'sectionnext'})
    #{
    #    $current = $current->{'sectionup'};
    #    $result .= '</'.xml_element_tag($current).">\n";
    #}
    #return $result;
}

sub xml_end_section($$$)
{
    my $fh = shift;
    my $end_foot_navigation = shift;
    my $element = shift;
}

sub xml_print_Top($$$)
{
    my $fh = shift;
    my $has_top_heading = shift;
    my $element = shift;
    main::print_lines($fh, $Texi2HTML::THIS_SECTION);
}

sub xml_print_Top_footer($$)
{
    my $fh = shift;
    my $end_page = shift;
    my $element = shift;
}

# FIXME warning:
#
# @samp{first para
# 
# second para}.
#
# maybe should lead to:
# <para><samp>first para  second para</samp>.</para>
#
# But it leads to
# <para><samp>first para 
# </samp></para>
# <para><samp>second para</samp>.
# </para>
sub xml_paragraph($$$$$$$$$$$$)
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

    # no para in multitables, caption and shortcaptions.
    my $top_stack = '';
    $top_stack = $command_stack_at_begin->[-1] if (scalar (@$command_stack_at_begin));
    return $text if ($top_stack eq 'multitable' or $top_stack eq 'shortcaption' or $top_stack eq 'caption' or $top_stack eq 'documentdescription');

    if ($text =~ /\S/)
    {
       return "<para>$text</para>";
    }
    return $text;
}

sub xml_preformatted($$$$$$$$$$$$)
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

sub xml_misc_commands($$$$$)
{
   my $macro = shift;
   my $line = shift;
   my $args = shift;
   my $stack = shift;
   my $state = shift;

#print STDERR "$macro $line";
#print STDERR "ARGS @$args\n" if defined ($args);
    return ($macro, $line, undef) unless($xml_misc_command_output{$macro});

    my $value_name = '';
    my $value = '';
    if ($macro eq 'set' or $macro eq 'clear')
    {
        my $value_line = $line;
        if ($value_line =~ s/^\s+([\w\-]+)//)
        {
            $value_name = $1;
            if ($macro eq 'set')
            {
                $value = $value_line;
                chomp ($value);
                $value =~ s/^\s*//;
            }
        }
    }
    my $result_text = "<${macro}></${macro}>";
    if ($macro eq 'set' or $macro eq 'clear')
    {
        $result_text = "<${macro}value name=\"$value_name\">$value</${macro}value>\n";
    }
    if ($macro eq 'c' or $macro eq 'comment' and scalar(@$args))
    {
        my $comment_line = $args->[0];
        chomp ($comment_line);
        # makeinfo remove all the leading spaces
        $comment_line =~ s/^\s//;
        $result_text = &$comment ($comment_line);
    }
    if ($macro eq 'frenchspacing')
    {
       my $value = $args->[0];
       $value =~ s/\s*//g;
       $result_text = "<${macro} var=\"$value\"></${macro}>";
    }
    if (grep {$macro eq $_} @xml_misc_elements_with_arg)
    {
       my $arg = $args->[0];
       $arg =~ s/^\s*//;
       chomp($arg);
       $result_text = "<${macro}>".main::substitute_line($arg, "\@$macro")."</${macro}>\n";
    }
    if (exists($xml_misc_elements_with_arg_map{$macro}))
    {
       my $arg = $args->[0];
       $arg =~ s/^\s*//;
       chomp($arg);
       $result_text = "<$xml_misc_elements_with_arg_map{$macro}>".main::substitute_line($arg, "\@$macro")."</$xml_misc_elements_with_arg_map{$macro}>\n";
    }
    if ($macro eq 'setfilename')
    {
       my $arg = $args->[0];
       #$arg =~ s/^\s*//;
       #$arg =~ s/\s*$//;
       #$arg = main::substitute_line($arg, "\@$macro");
       if ($arg =~ /\S/)
       {
           $arg = get_conf('setfilename');
           $arg =~ s/\.[^\.]*$//;
           $result_text = "<${macro}>${arg}.xml</${macro}>\n";
       }
    }
    return ($macro, $line, $result_text);
}


sub xml_anchor_label($$)
{
    my $id = shift;
    my $anchor_text = shift;
    return '<anchor name="'. &$protect_text($anchor_text) . '"></anchor>';
}

sub xml_index_entry_command($$$$$)
{               
   my $command = shift;
   my $index_name = shift;
   my $label = shift;
   my $entry_texi = shift;
   my $entry_formatted = shift;

   return $label if (defined($label) and $label ne '');
   return xml_index_entry_label('','','',$main::index_prefix_to_name{$index_name}, '', '', $entry_formatted, {});
}

sub xml_index_entry_label($$$$$$$$$)
{   
    my $identifier = shift;
    my $preformatted = shift;
    my $formatted_entry = shift;
    my $index_name = shift;
    my $index_command = shift;
    my $texi_entry = shift;
    my $formatted_entry_reference = shift;
    my $in_region_not_in_output = shift;
    my $index_entry_ref = shift;
    

    return "<indexterm index=\"${index_name}\">${formatted_entry_reference}</indexterm>";
}

sub xml_listoffloats($$$)
{
    my $style_texi = shift;
    my $style = shift;
    my $float_entries = shift;
    # FIXME style, style_texi? Protected?
    return "<listoffloats type=\"$style\"></listoffloats>";
}

sub xml_acronym_like($$$$$$)
{
    my $command = shift;
    my $acronym_texi = shift;
    my $acronym_text = shift;
    my $with_explanation = shift;
    my $explanation_lines = shift;
    my $explanation_text = shift;
    my $explanation_simply_formatted = shift;

    $command = 'abbrev' if ($command eq 'abbr');
    my $opening = "<${command}><${command}word>$acronym_text</${command}word>";
    if ($with_explanation)
    {
        $opening .= "<${command}desc>$explanation_text</${command}desc>";
    }
    return $opening . "</${command}>";
}

sub xml_foot_line_and_ref($$$$$$$)
{
    my $number_in_doc = shift;
    my $number_in_page = shift;
    my $footnote_id = shift;
    my $place_id = shift;
    my $document_file = shift;
    my $footnote_file = shift;
    my $lines = shift;
    my $state = shift;

    my $result = '<footnote>';
    foreach my $line (@$lines)
    {
       $result .= $line;
    }
    return ([], $result . '</footnote>');
}

sub xml_image($$$$$$$$$$$$$)
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

    $alt = '' if (!defined($alt));
    # dirty hack to avoid " that can be here because of a @verb 
    $alt =~ s/"/&quot;/g;

    $width = '' if (!defined($width));
    $height = '' if (!defined($height));

    my $tag = 'inlineimage';
    $tag = 'image' if ($preformatted or !$in_paragraph);

    return "<$tag width=\"$width\" height=\"$height\" name=\"". &$protect_text($base)."\" extension=\"$extension\"><alttext>$alt</alttext></$tag>";
}

sub xml_sp($$)
{
   my $number = shift;
   my $preformatted = shift;
   return "<sp lines=\"$number\"></sp>\n";
}

sub xml_quotation($$$$$)
{
    my $command = shift;
    my $text = shift;
    my $argument_text = shift;
    my $argument_text_texi = shift;
    my $authors = shift;
    return "<$command>\n" . $text . "</$command>\n";
}

sub xml_format_list_item_texi($$$$)
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

sub xml_list_item($$$$$$$$$)
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

    return '<item>' . $text . "</item>\n";
}

sub xml_init_variables()
{
   @xml_multitable_stack = ();
   @xml_table_stack = ();
   $xml_current_section = undef;
}

# row in multitable
sub xml_row($$;$$)
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
         if ($xml_multitable_stack[-1] != 0)
         {
             $result .= "<thead>";
             $result = "</tbody>" . $result if ($xml_multitable_stack[-1] == 1);
             $xml_multitable_stack[-1] = 0;
         }
    }
    elsif ($xml_multitable_stack[-1] != 1)
    {
         $result .= "<tbody>";
         $result = "</thead>" . $result if ($xml_multitable_stack[-1] == 0);
         $xml_multitable_stack[-1] = 1;
    }
    $result .= "<row>$text</row>";
    
    return $result;
}

# cell in multitable
sub xml_cell($$;$$)
{
    my $text = shift;
    my $row_macro = shift;
    my $columnfractions = shift;
    my $prototype_row = shift;
    my $prototype_lengths = shift;
    my $column_number = shift;

    return "<entry>" . $text . '</entry>';
}

sub xml_table_list($$$$$$$$$)
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
        $prepended_formatted =~ s/^\s*// if (defined($prepended_formatted));
        if (defined($formatted_command) and $formatted_command ne '')
        {
            $itemfunction = $formatted_command;
            $itemfunction .= " $prepended_formatted" if (defined($prepended_formatted) and $prepended_formatted ne '');
        }
        elsif (defined($prepended_formatted))
        {
            $itemfunction = $prepended_formatted;
        }
        $itemfunction = "&bullet;" if (!defined($itemfunction) or 
            $itemfunction eq '');
        $result .=  "<itemfunction>$itemfunction</itemfunction>";
    }
    elsif ($format_command eq 'enumerate')
    {
        $result = "<$format_command first=\"$enumerate_style\">";
    }
    elsif ($format_command eq 'multitable')
    {
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
               $result .= "<columnfraction>".($fraction*$multiply)."</columnfraction>\n";
           }
       }
       $text .= "</tbody>" if ($xml_multitable_stack[-1] == 1);
       $text .= "</thead>" if ($xml_multitable_stack[-1] == 0);
       pop @xml_multitable_stack;
    }
    elsif ($format_command =~ /^(v|f)?table$/)
    {
       $result = '<table>';
       $text .= '</tableitem>' if ($xml_table_stack[-1] == 1);
       pop @xml_table_stack;
       return $result . "$text</table>\n";
    }
    return $result . "$text</$format_command>\n";
}

sub xml_begin_format_texi($$$)
{
    my $command = shift;
    my $line = shift;
    my $state = shift;

    push (@xml_multitable_stack, -1) if ($command eq 'multitable');
    push (@xml_table_stack, 0) if ($command =~ /^(v|f)?table/);
    return $line;
}

sub xml_def_line($$$$$$$$$$$$$$$)
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

   my $result = "<definitionterm><indexterm index=\""
    .$main::index_prefix_to_name{$style}."\">$class_name</indexterm>";

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

   foreach my $mandatory_arg (@{$def_format_xml{$command}})
   {
       my $elem = $mandatory_arg->[0];
       $result .= "<def$elem>$arguments{$mandatory_arg->[1]}</def$elem>";
   }

   my $params = '';
   my @types = @$arguments_type_array;
   foreach my $arg (@$arguments_array)
   {
       my $type = shift @types;
       if (grep {$_ eq $type} ('param', 'paramtype', 'delimiter'))
       {
            $result .= "<def$type>$arg</def$type>";
       }
   }

   $result .= "</definitionterm>\n";
   return $result;
}

# FIXME 
# @deffn 
# @c comment
# @end deffn
# leads to the creation of a <definitionitem> with a comment within, 
# while there should be no definitionitem 
sub xml_def_item($$)
{
    my $text = shift;
    my $only_inter_item_commands = shift;

    if ($text =~ /\S/)
    {
       return '<definitionitem>' . $text . '</definitionitem>' unless $only_inter_item_commands;
       return $text;
    }
    return '';
}

sub xml_def($)
{
   my $text = shift;
   return '<definition>'.$text.'</definition>';
}

sub xml_index_summary($$)
{
    my $alpha = shift;
    my $nonalpha = shift;
    return '';
}

sub xml_printindex($$)
{
    my $name = shift;
    my $printindex = shift;
    return "<printindex>$name</printindex>\n";
}

sub xml_any_ref($$)
{
    my $type = shift;
    my $args = shift;
    my $result = '';
    if ($type eq 'pxref')
    {
        $result = gdt('see ',{'duplicate'=>1});
    }
    elsif ($type eq 'xref' or $type eq 'inforef')
    {
        $result = gdt('See ',{'duplicate'=>1});
    }
    if ($type eq 'inforef')
    {
        $result .= "<inforef><inforefnodename>$args->[0]</inforefnodename>";
        $result .= "<inforefrefname>$args->[1]</inforefrefname>" if ($args->[1] ne '');
        $result .= "<inforefinfoname>$args->[2]</inforefinfoname></inforef>"
    }
    else
    {
        $result .= "<xref><xrefnodename>$args->[0]</xrefnodename>";
        $result .= "<xrefinfoname>$args->[1]</xrefinfoname>" if ($args->[1] ne '');
        $result .= "<xrefprinteddesc>$args->[2]</xrefprinteddesc>" if ($args->[2] ne '');
        $result .= "<xrefinfofile>$args->[3]</xrefinfofile>" if ($args->[3] ne '');
        $result .= "<xrefprintedname>$args->[4]</xrefprintedname>" if ($args->[4] ne '');
        $result .= '</xref>';
    }
    return $result;
}

sub xml_external_ref($$$$$$$$$)
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
    
    return xml_any_ref ($type, $formatted_args);
}

sub xml_internal_ref($$$$$)
{
    my $type = shift;
    my $href = shift;
    my $short_name = shift;
    my $name = shift;
    my $is_section = shift;
    my $args_texi = shift;
    my $formatted_args = shift;

    return xml_any_ref ($type, $formatted_args);
}

sub xml_table_item($$$$$$$)
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
    my $formatted_index_entry = shift;


#    $formatted_command = '' if (!defined($formatted_command));
#
#    if (defined($text_formatted))
#    {
#        $text_item = $text_formatted_leading_spaces . $text_formatted .$text_formatted_trailing_spaces;
#    }
#    else
#    {
#        $text_item = $text;
#    }

    my $result = '';
    if ($item_cmd eq 'item')
    {
        $result .= '</tableitem>' if ($xml_table_stack[-1] == 1);
        $xml_table_stack[-1] = 1;
        $result .= '<tableitem>';
    }
    $result .= '<tableterm>';
    #print STDERR "$text | $format | $command | $formatted_command | $text_formatted | $item_cmd \n";
    my $indexterm = '';
#print STDERR "FFFFFFFFFFFFFFFFf   `$index_label' `$text'\n";
    if ($format =~ /^(v|f)/)
    {
#        my $index_prefix = $1;
#        $indexterm = $text;
#        $indexterm =~ s/^\s*//;
#        $result .= "<indexterm index=\"$main::index_prefix_to_name{$index_prefix}\">$formatted_index_entry</indexterm>";
        $result .= "$index_label";
    }
    $result .= $text ."</tableterm>\n";
    return $result;
}

sub xml_table_line($)
{
    my $text = shift;
    my $only_inter_item_commands = shift;
    my $before_items = shift;

    if ($text =~ /\S/)
    {
        return "<item>$text</item>" unless $only_inter_item_commands;
        return $text;
    }
    else
    {
        return '';
    }
}

sub xml_caption_shortcaption($)
{
    my $float = shift;
    my $caption_lines;
    my $shortcaption_lines;
    if (defined($float->{'caption_texi'}))
    {
        @$caption_lines = @{$float->{'caption_texi'}};
    }
    if (defined($float->{'shortcaption_texi'}))
    {
        @$shortcaption_lines = @{$float->{'shortcaption_texi'}};
    }
    return ($caption_lines, $shortcaption_lines);
}

sub xml_caption_shortcaption_command($$$)
{
   my $command = shift;
   my $text = shift;
   my $texi_lines = shift;
   my $float_element = shift;

   if ($text =~ /\S/)
   {
      return "<$command>$text</$command>";
   }
   return '';
}

sub xml_float($$$$$)
{
    my $text = shift;
    my $float = shift;
    my $caption = shift;
    my $shortcaption = shift;

    # FIXME don't use the texi, but a normalized node name
    my $label_texi = $float->{'texi'};
    $label_texi = '' if (!defined($label_texi));
    my $result = "<float name=\"$label_texi\">\n";
    my $style = $float->{'style'};
    $style = '' if (!defined($style));
    $result .= "<floattype>$style</floattype>\n";
    $result .= "<floatpos></floatpos>\n";
    $result .= $text;
    return $result."</float>\n";
}

sub xml_normal_text($$$$$$$;$)
{
   my $text = shift;
   my $in_raw_text = shift;
   my $in_preformatted = shift;
   my $in_code = shift;
   my $in_math = shift;
   my $in_simple = shift;
#print STDERR "Bug: in_raw_text in_simple $text\n" if ($in_raw_text and $in_simple);
   my $style_stack = shift;
   my $state = shift;

   $text = &$protect_text($text) unless($in_raw_text);

   if (! $in_code and !$in_preformatted and !$in_raw_text)
   {
       $text =~ s/---/\&mdash\;/g;
       $text =~ s/--/\&ndash\;/g;
       $text =~ s/``/\&ldquo\;/g;
       $text =~ s/''/\&rdquo\;/g;
   }
   return $text;
}

sub xml_paragraph_style_command($$)
{
    my $format = shift;
    my $text = shift;
    return "<$format>$text</$format>" if ($format eq 'center');
    return $text;
}

sub xml_raw($$)
{
    my $style = shift;
    my $text = shift;

    if ($style eq 'verbatim' or $style eq 'verbatiminclude')
    {
        return '<verbatim xml:space="preserve">' . &$protect_text($text) . '</verbatim>';
    }
    return '' unless (grep {$style eq $_} @EXPAND);
    if ($style eq 'xml')
    {
        chomp ($text);
        return $text;
    }
    else
    {
        main::msg_warn ("Raw style $style not handled", $Texi2HTML::THISDOC{'line_nr'});
        return &$protect_text($text);
    }
}

sub xml_cartouche($$)
{
    my $text = shift;

    return "<cartouche>$text</cartouche>";
}

sub xml_noop
{
    return '';
}

1;
