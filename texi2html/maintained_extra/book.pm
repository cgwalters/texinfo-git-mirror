# A style that tries to be analogous with a book, in HTML.
#
# This file is in the public domain. Thus it may easily be used as an 
# example for further customizations.
#
# Originally written by Patrice Dumas in 2004.
# Modified in 2007, 2008.
#
# This style is based on the scriptbasic style.

#html_default_load();
t2h_default_load_format('html');

set_default('contents', 1);

set_default('INLINE_CONTENTS', 1);
set_default('USE_TITLEPAGE_FOR_TITLE', 1);

@SECTION_BUTTONS =
    (
     'Back', 'Forward', ' ', 'Contents', 'Index', 'About'
    );

@CHAPTER_BUTTONS = @SECTION_BUTTONS;
@TOP_BUTTONS = @SECTION_BUTTONS;

@SECTION_FOOTER_BUTTONS = ('Contents', 'Index', 'About');
@MISC_BUTTONS = @SECTION_FOOTER_BUTTONS;

@NODE_FOOTER_BUTTONS = ('Back', 'Forward');

@LINKS_BUTTONS =
    (
      'Top', 'Index', 'Contents', 'About', 'Up', 'NextFile', 'PrevFile'
    );


set_default('WORDS_IN_PAGE', undef);
set_default('SHOW_MENU', 0);

$BIG_RULE = '<hr>';

#FIXME lift that constraint once it is better supported
set_default('USE_SECTIONS', 1);
set_default('USE_NODES', undef);

push @command_handler_init, \&book_initialize_variables;

sub book_print_sub_toc($$);

sub book_print_sub_toc($$)
{
    my $parent_element = shift;
    my $element = shift;
    my $result = "<li> ".&$anchor('', main::href($element, $parent_element->{'file'}), $element->{'text'}) . " </li>\n";
#print STDERR "SUB_TOC $element->{'text'}\n"; #sleep 1;
    if (exists($element->{'child'}))
    {
#print STDERR "SUB_TOC child $element->{'child'}->{'text'}\n"; 
         $result .= '<li>'.html_default_attribute_class('ul',$NO_BULLET_LIST_CLASS).">\n". book_print_sub_toc($parent_element, $element->{'child'}) ."</ul></li>\n";
    }
    if (exists($element->{'sectionnext'}))
    {
#print STDERR "SUB_TOC next($element->{'text'}) $element->{'next'}->{'text'}\n"; 
         $result .= book_print_sub_toc($parent_element, $element->{'sectionnext'});
    }
    return $result;
}

sub book_print_up_toc($)
{
    my $element = shift;

    my $result = '';
    my $current_element = $element;
    my @elements;
    while (defined($current_element->{'sectionup'}) and ($current_element->{'sectionup'} ne $current_element))
    {
        unshift (@elements, $current_element->{'sectionup'});
        $current_element = $current_element->{'sectionup'};
    }
    # this happens for example for top element
    return '' if !(@elements);
    #print $fh "<ul>" . &$anchor('', $Texi2HTML::HREF{Contents}, '[' . $Texi2HTML::NAME{Contents} . ']') . " <br>\n";
    my $elem = shift @elements;
    $result .= html_default_attribute_class('ul', $NO_BULLET_LIST_CLASS)."><li>" . &$anchor('', main::href($elem, $element->{'file'}), $elem->{'text'}) . " </li>\n";
    foreach my $elem (@elements)
    {
        $result .= '<li>'.html_default_attribute_class('ul', $NO_BULLET_LIST_CLASS)."><li>" . &$anchor('', main::href($elem, $element->{'file'}), $elem->{'text'}) . " </li>\n";
    }
    foreach my $elem (@elements)
    {
        $result .= "</ul></li>\n";
    }
    $result .= "</ul>\n";
}

$print_head_navigation = \&book_print_head_navigation;

sub book_print_head_navigation($$)
{ 
    my $fh = shift;
    my $buttons = shift;
    my $first_in_page = shift;
    my $previous_is_top = shift;
    my $element = shift;

    if (defined($element) and $first_in_page)
    {
       return book_print_up_toc($Texi2HTML::THIS_ELEMENT) . 
          HTML_DEFAULT_print_head_navigation($fh, $buttons, $first_in_page, $previous_is_top, $element);
    }
    return HTML_DEFAULT_print_head_navigation($fh, $buttons, $first_in_page, $previous_is_top, $element);
}

my $unumbered_nr;
my $previous_nr;
my $previous_file_name; 

sub book_initialize_variables()
{
   $unumbered_nr = -1;
   $previous_nr = undef;
   $previous_file_name = undef;   
}

$element_file_name = \&book_element_file_name;

sub book_element_file_name($$$)
{
    my $element = shift;
    my $type = shift;
    my $prefix = shift;

    return undef if (get_conf('NODE_FILENAMES') or !get_conf('SPLIT'));
    return undef if (!defined($element));
   
    if (defined($previous_nr) and ($element->{'doc_nr'} == $previous_nr))
    {
        return $previous_file_name;
    }
    if ($type eq 'top')
    {
        $previous_file_name = "${prefix}_top.html";
    }
    elsif (defined($element->{'plain_number'}) and ($element->{'plain_number'} ne ''))
    {
         my $number = $element->{'plain_number'};
         $number .= '.' unless ($number =~ /\.$/);
         $previous_file_name = "${prefix}_$number" . 'html';
    }
    else
    {
         $unumbered_nr++;
         $previous_file_name = "${prefix}_U." . $unumbered_nr . '.html'; 
    }
    $previous_nr = $element->{'doc_nr'};
    return $previous_file_name;
}

$heading = \&book_heading;

sub book_heading($$$$$$;$$)
{
    my $element = shift;
    my $command = shift;
    my $texi_line = shift;
    my $line = shift;
    my $in_preformatted = shift;
    my $one_section = shift;
    my $element_heading = shift;

    my $level = 3;

    if (!$element->{'node'})
    {
        $level = $element->{'level'};
    }
    else
    {
        return '' unless ($element->{'this'} and !$element->{'with_section'});
    }
    my $text = $element->{'text'};
    my $class = $element->{'tag_level'};
    $class = 'node' if ($element->{'node'});
    my $result = '';

    if (get_conf('TOC_LINKS') and $command !~ /heading/ and defined($element->{'tocid'}))
    {
         $text = &$anchor ('', "$Texi2HTML::THISDOC{'toc_file'}#$element->{'tocid'}", $text);
    }
    if (!$in_preformatted)
    {
       $result = &$heading_text("\@$class", $text, $level);
    }
    else
    {
       $result = &$heading_text_preformatted("\@$class", $text, $level);
    }
    # @top should already have a table of contents, either because there 
    # is a @contents, or setcontentsaftertitlepage is set. 
    # In any case it would just be a duplication
    # of the table of contents, better let the user decide where it should be.
    if (exists($element->{'child'}) 
        and ($element->{'tag_level'} !~ /heading/) and $element->{'tag'} ne 'top')
    {
        $result .= html_default_attribute_class('ul',$NO_BULLET_LIST_CLASS).">\n";
        $result .= "" . book_print_sub_toc($element, $element->{'child'});
        $result .= "</ul>\n";
    }
    return $result;
}

1;
