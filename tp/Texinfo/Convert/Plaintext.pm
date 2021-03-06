# Plaintext.pm: output tree as text with filling.
#
# Copyright 2010, 2011, 2012 Free Software Foundation, Inc.
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
# Original author: Patrice Dumas <pertusus@free.fr>

package Texinfo::Convert::Plaintext;

use 5.00405;
use strict;

use Texinfo::Convert::Converter;
use Texinfo::Common;
use Texinfo::Convert::Texinfo;
use Texinfo::Convert::Text;
use Texinfo::Convert::Paragraph;
use Texinfo::Convert::Line;
use Texinfo::Convert::UnFilled;

use Carp qw(cluck);

require Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);
@ISA = qw(Exporter Texinfo::Convert::Converter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration       use Texinfo::Convert::Plaintext ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
%EXPORT_TAGS = ( 'all' => [ qw(
  convert
  output
) ] );

@EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

@EXPORT = qw(
);

$VERSION = '0.01';

# misc commands that are of use for formatting.
my %formatting_misc_commands = %Texinfo::Convert::Text::formatting_misc_commands;

my $NO_NUMBER_FOOTNOTE_SYMBOL = '*';

my @informative_global_commands = ('paragraphindent', 'firstparagraphindent',
'frenchspacing', 'documentencoding', 'footnotestyle', 'documentlanguage',
'contents', 'shortcontents', 'summarycontents', 'setcontentsaftertitlepage',
'setshortcontentsaftertitlepage', 'deftypefnnewline');

my %informative_commands;
foreach my $informative_command (@informative_global_commands) {
  $informative_commands{$informative_command} = 1;
}

my %no_brace_commands = %Texinfo::Common::no_brace_commands;
my %brace_no_arg_commands;
foreach my $command (keys (%Texinfo::Common::brace_commands)) {
  $brace_no_arg_commands{$command} = 1 
    if ($Texinfo::Common::brace_commands{$command} == 0);
}
my %accent_commands = %Texinfo::Common::accent_commands;
my %misc_commands = %Texinfo::Common::misc_commands;
my %sectioning_commands = %Texinfo::Common::sectioning_commands;
my %def_commands = %Texinfo::Common::def_commands;
my %ref_commands = %Texinfo::Common::ref_commands;
my %block_commands = %Texinfo::Common::block_commands;
my %menu_commands = %Texinfo::Common::menu_commands;
my %root_commands = %Texinfo::Common::root_commands;
my %preformatted_commands = %Texinfo::Common::preformatted_commands;
my %explained_commands = %Texinfo::Common::explained_commands;
my %inline_format_commands = %Texinfo::Common::inline_format_commands;
my %item_container_commands = %Texinfo::Common::item_container_commands;
my %raw_commands = %Texinfo::Common::raw_commands;
my %format_raw_commands = %Texinfo::Common::format_raw_commands;
my %code_style_commands       = %Texinfo::Common::code_style_commands;
my %preformatted_code_commands = %Texinfo::Common::preformatted_code_commands;
my %default_index_commands = %Texinfo::Common::default_index_commands;
my %letter_no_arg_commands = %Texinfo::Common::letter_no_arg_commands;

foreach my $kept_command(keys (%informative_commands),
  keys (%default_index_commands),
  'verbatiminclude', 'insertcopying', 
  'listoffloats', 'printindex', ) {
  $formatting_misc_commands{$kept_command} = 1;
}

foreach my $def_command (keys(%def_commands)) {
  $formatting_misc_commands{$def_command} = 1 if ($misc_commands{$def_command});
}

# There are 5 stacks that define the context.
# context:   relevant for alignement of text.  Set in math, footnote, 
#            listoffloats, flush_commands, preformatted_context_commands 
#            (preformatted + menu + verbatim), and raw commands if 
#            on top level.
# format_context: used for the count of paragraphs and for the indentation.
#            Set in footnote, for all commands relevant for indenting, like
#            @*table, @itemize, @enumerate, preformatted commands, 
#            @*quotation, @def*, and also menu commands, @flushleft, 
#            @flushright, @float, in multitable cell and raw commands if at
#            toplevel.
# text_element_context: for the max columns and the counter in the line
#            position (although the counter in the line is taken over by 
#            the formatter once a formatter is opened).
#            Set in footnote and in multitable cells.
# formatters: a formatter environment has stacks for formatting context.
#            Also holds a container, an objects that does the counting 
#            of columns, actual indentation.  In general, it is better not 
#            to have formatters in parallel, but it may happen.
# count_context: holds the bytes count, the lines count and the location
#            of the commands that have their byte count or llines count
#            recorded.  It is set for out of document formatting to avoid
#            counting some converted text, but it is also set when it has
#            to be modified afterwards, for aligned commands or multitable
#            cells for example.

# formatters have their own stack
# in container
# 'upper_case'
# 'var'
# 'code'
# 
# paragraph number incremented with paragraphs, center, listoffloats
# and block commands except: html and such, group, raggedright, menu*, float

my %default_preformatted_context_commands = (%preformatted_commands,
                                             %format_raw_commands);
foreach my $preformatted_command ('verbatim', keys(%menu_commands)) {
  $default_preformatted_context_commands{$preformatted_command} = 1;
}

my %ignored_misc_commands;
foreach my $misc_command (keys(%misc_commands)) {
  $ignored_misc_commands{$misc_command} = 1 
    unless ($formatting_misc_commands{$misc_command});
}

my %ignored_commands = %ignored_misc_commands;
foreach my $ignored_brace_commands ('caption', 'shortcaption', 
  'hyphenation') {
  $ignored_commands{$ignored_brace_commands} = 1;
}

my %item_indent_format_length = ('enumerate' => 2,
    'itemize' => 3,
    'table' => 0,
    'vtable' => 0,
    'ftable' => 0,
 );

my $indent_length = 5;

my %indented_commands;
foreach my $indented_command (keys (%item_indent_format_length), 
           keys (%preformatted_commands), 'quotation', 'smallquotation', 
           keys(%def_commands)) {
  $indented_commands{$indented_command} = 1 
    if exists($block_commands{$indented_command});
}

my %default_format_context_commands = %indented_commands;

foreach my $non_indented('format', 'smallformat') {
  delete $indented_commands{$non_indented};
}

foreach my $format_context_command (keys(%menu_commands), 'verbatim',
 'flushleft', 'flushright', 'multitable', 'float') {
  $default_format_context_commands{$format_context_command} = 1;
}

my %flush_commands = (
  'flushleft'  => 1,
  'flushright' => 1
);

# commands that leads to advancing the paragraph number.  This is mostly
# used to determine the first line, in fact.
my %advance_paragraph_count_commands;
foreach my $command (keys(%block_commands)) {
  next if ($menu_commands{$command} 
            or $block_commands{$command} eq 'raw');
  $advance_paragraph_count_commands{$command} = 1;
}

# group and raggedright do more than not advancing para, they should also
# be transparent with respect to paragraph number counting.
foreach my $not_advancing_para ('group', 'raggedright',
  'titlepage', 'copying', 'documentdescription', 'float') {
  delete $advance_paragraph_count_commands{$not_advancing_para};
}

foreach my $advancing_para('center', 'verbatim', 'listoffloats') {
  $advance_paragraph_count_commands{$advancing_para} = 1;
}

foreach my $ignored_block_commands ('ignore', 'macro', 'rmacro', 'copying',
  'documentdescription', 'titlepage', 'direntry') {
  $ignored_commands{$ignored_block_commands} = 1;
}

my %punctuation_no_arg_commands;
foreach my $punctuation_command('enddots', 'exclamdown', 'questiondown') {
  $punctuation_no_arg_commands{$punctuation_command} = 1;
}

my %upper_case_commands = (
 'sc' => 1,
 'var' => 1
);

my %ignored_types;
foreach my $type ('empty_line_after_command', 'preamble',
            'preamble_before_setfilename',
            'empty_spaces_after_command', 'spaces_at_end',
            'empty_spaces_before_argument', 'empty_spaces_before_paragraph',
            'empty_spaces_after_close_brace', 
            'empty_space_at_end_def_bracketed') {
  #$ignored_types{$type} = 1;
  $ignored_types{$type} = 1;
}

# All those commands run with the text.
my %style_map = (
  'strong' => '*',
  'dfn'    => '"',
  'emph'   => '_',
);

foreach my $command (keys(%style_map)) {
  $style_map{$command} = [$style_map{$command}, $style_map{$command}];
}

# math  is special
my @asis_commands = ('asis', 'w', 'b', 'ctrl', 'i', 'sc', 't', 'r',
  'slanted', 'sansserif', 'var', 'verb', 'clicksequence',
  'headitemfont', 'dmn');

foreach my $asis_command (@asis_commands) {
  $style_map{$asis_command} = ['', ''];
}

my @quoted_commands = ('cite', 'code', 'command', 'env', 'file', 'kbd',
  'option', 'samp');

# Quotes are reset in converter_initialize and unicode quotes are used 
# if @documentencoding utf-8 is used.
foreach my $quoted_command (@quoted_commands) {
  $style_map{$quoted_command} = ['`', "'"];
}

$style_map{'key'} = ['<', '>'];
$style_map{'indicateurl'} = ['<', '>'];

# in those commands, there is no addition of double space after a dot.
# math is special
my %no_punctation_munging_commands;
foreach my $command ('var', 'cite', 'dmn', keys(%code_style_commands)) {
  $no_punctation_munging_commands{$command} = 1;
}

my %defaults = (
  'ENABLE_ENCODING'      => 1,
# this default is for Info, but also when doing Texinfo fragments.  So this 
# has to be explicitly set to 0 when doing real plaintext.
  'SHOW_MENU'            => 1,
# not used for plaintext, since default is '-' for plaintext.
  'EXTENSION'            => 'info',
  'USE_SETFILENAME_EXTENSION' => 1,

  'encoding_name'        => undef,
  'perl_encoding'        => undef,
  'OUTFILE'              => undef,
  'SUBDIR'               => undef,
  'documentlanguage'     => undef,

  'output_format'        => '',
);

sub push_top_formatter($$)
{
  my $self = shift;
  my $top_context = shift;
  push @{$self->{'context'}}, $top_context;
  push @{$self->{'format_context'}}, {
                                     'cmdname' => '_top_format',
                                     'indent_level' => 0,
                                     'paragraph_count' => 0,
                                   };
  push @{$self->{'text_element_context'}}, {
                                     'max' => $self->{'fillcolumn'}
                                   };
  # This is not really meant to be used, as contents should open 
  # their own formatters, however it happens that there is some text
  # outside any content that needs to be formatted, as @sp for example.
  push @{$self->{'formatters'}}, $self->new_formatter('line');
  $self->{'formatters'}->[-1]->{'_top_formatter'} = 1;
}


my %contents_commands = (
 'contents' => 1,
 'shortcontents' => 1,
 'summarycontents' => 1,
);

sub converter_defaults($)
{
  return %defaults;
}

sub converter_global_commands($)
{
  return @informative_global_commands;
}

sub converter_initialize($)
{
  my $self = shift;

  $self->{'context'} = [];
  $self->{'format_context'} = [];
  $self->{'empty_lines_count'} = undef;
  $self->push_top_formatter('_Root_context');
  push @{$self->{'count_context'}}, {'lines' => 0, 'bytes' => 0,
                                     'locations' => []};

  %{$self->{'ignored_types'}} = %ignored_types;
  %{$self->{'ignored_commands'}} = %ignored_commands;
  # this is dynamic because raw formats may either be full commands if
  # isolated, or simple text if in a paragraph
  %{$self->{'format_context_commands'}} = %default_format_context_commands;
  %{$self->{'preformatted_context_commands'}} 
     = %default_preformatted_context_commands;
  $self->{'footnote_index'} = 0;
  $self->{'pending_footnotes'} = [];

  foreach my $format (keys(%format_raw_commands)) {
    $self->{'ignored_commands'}->{$format} = 1 
       unless ($self->{'expanded_formats_hash'}->{$format});
  }

  %{$self->{'style_map'}} = %style_map;
  if ($self->get_conf('ENABLE_ENCODING') and $self->{'encoding_name'} 
      and $self->{'encoding_name'} eq 'utf-8') {
    foreach my $quoted_command (@quoted_commands) {
      $self->{'style_map'}->{$quoted_command} = ["\x{2018}", "\x{2019}"];
    }
  }

  return $self;
}

sub _convert_node($$)
{
  my $self = shift;
  my $element = shift;

  my $result = '';

  print STDERR "NEW NODE\n" if ($self->get_conf('DEBUG'));
  die "Too much count_context\n" if (scalar(@{$self->{'count_context'}}) != 1);

  $self->{'count_context'}->[-1]->{'lines'} = 0;
  $result .= $self->_convert($element);

  print STDERR "END NODE ($self->{'count_context'}->[-1]->{'lines'},$self->{'count_context'}->[-1]->{'bytes'})\n" if ($self->get_conf('DEBUG'));

  $result .= $self->_footnotes($element);

  print STDERR "AFTER FOOTNOTES ($self->{'count_context'}->[-1]->{'lines'},$self->{'count_context'}->[-1]->{'bytes'})\n" if ($self->get_conf('DEBUG'));

  return $result;
}

sub convert($$)
{
  my $self = shift;
  my $root = shift;

  my $result = '';

  my $elements = Texinfo::Structuring::split_by_node($root);
  $self->{'empty_lines_count'} = 1;
  if (!defined($elements)) {
    $result = $self->_convert($root);
    my $footnotes = $self->_footnotes();
    $result .= $footnotes;
  } else {
    foreach my $node (@$elements) {
      my $node_text = $self->_convert_node($node);
      $result .= $node_text;
    }
  }

  return $result;
}

sub output($$)
{
  my $self = shift;
  my $root = shift;

  my $outfile = '-';
  $self->set_conf('OUTFILE', '-');
  $self->_set_outfile();
  if (defined($self->{'output_file'})) {
    $outfile = $self->{'output_file'};
  }
  
  my $fh = $self->Texinfo::Common::open_out ($outfile);
  if (!$fh) {
    $self->document_error(sprintf($self->__("Could not open %s for writing: %s"),
                                  $outfile, $!));
    return undef;
  }
  #$self->{'fh'} = $fh;
  my $result = $self->convert($root);
  if (defined($result)) {
    print $fh $result;
    return $self;
  } else {
    return undef;
  }
}

sub _process_text($$$)
{
  my $self = shift;
  my $command = shift;
  my $context = shift;
  my $text = $command->{'text'};


  my $lower_case_text;
  if ($context->{'upper_case'}) {
    $lower_case_text = $text;
    $text = uc($text);
  }
  # Even if in upper case, in code style or @var always end a sentence.
  if ($context->{'code'} or $context->{'var'}) {
    $lower_case_text = lc($text);
  }
  if ($self->get_conf('ENABLE_ENCODING') and $self->{'encoding_name'} 
      and $self->{'encoding_name'} eq 'utf-8') {
    if (defined($lower_case_text)) {
      $lower_case_text 
        = Texinfo::Convert::Unicode::unicode_text($lower_case_text, $context->{'code'});
    }
    return (Texinfo::Convert::Unicode::unicode_text($text, $context->{'code'}),
            $lower_case_text);
  } elsif (!$context->{'code'}) {
    $text =~ s/---/\x{1F}/g;
    $text =~ s/--/-/g;
    $text =~ s/\x{1F}/--/g;
    $text =~ s/``/"/g;
    $text =~ s/\'\'/"/g;
    if (defined($lower_case_text)) {
      $lower_case_text =~ s/---/\x{1F}/g;
      $lower_case_text =~ s/--/-/g;
      $lower_case_text =~ s/\x{1F}/--/g;
      $lower_case_text =~ s/``/"/g;
      $lower_case_text =~ s/\'\'/"/g;
    }
  }
  return ($text, $lower_case_text);
}

sub new_formatter($$;$)
{
  my $self = shift;
  my $type = shift;
  my $conf = shift;

  my $first_indent_length = $conf->{'first_indent_length'};
  delete $conf->{'first_indent_length'};
  
  my $container;
  my $container_conf = {
         'max'               => $self->{'text_element_context'}->[-1]->{'max'},
         'indent_level'      => $self->{'format_context'}->[-1]->{'indent_level'}, 
  };
  $container_conf->{'frenchspacing'} = 1 
    if ($self->get_conf('frenchspacing') eq 'on');
  $container_conf->{'counter'} = $self->{'text_element_context'}->[-1]->{'counter'}
    if (defined($self->{'text_element_context'}->[-1]->{'counter'}));
  $container_conf->{'DEBUG'} = 1 if ($self->get_conf('DEBUG'));
  if ($conf) {
    foreach my $key (keys(%$conf)) {
      $container_conf->{$key} = $conf->{$key};
    }
  }
  my $indent = $container_conf->{'indent_length'};
  $indent = $indent_length*$container_conf->{'indent_level'}
    if (!defined($indent));

  if ($first_indent_length) {
    $container_conf->{'indent_length'} = $first_indent_length;
    $container_conf->{'indent_length_next'} = $indent;
  } else {
    $container_conf->{'indent_length'} = $indent;
  }
    
  if ($type eq 'line') {
    $container = Texinfo::Convert::Line->new($container_conf);
  } elsif ($type eq 'paragraph') {
    $container = Texinfo::Convert::Paragraph->new($container_conf);
  } elsif ($type eq 'unfilled') {
    $container = Texinfo::Convert::UnFilled->new($container_conf);
  } else {
    die "Unknown container type $type\n";
  }

  if ($flush_commands{$self->{'context'}->[-1]}) {
    $container->set_space_protection(undef, 1, 1);
  }

  my $formatter = {'container' => $container, 'upper_case' => 0,
                   'code' => 0, 'w' => 0, 'type' => $type,
                   'frenchspacing_stack' => [$self->get_conf('frenchspacing')]};

  if ($type eq 'unfilled') {
    foreach my $context (reverse(@{$self->{'context'}})) {
      if ($menu_commands{$context}) {
        last;
      } elsif ($preformatted_code_commands{$context}
               or $format_raw_commands{$context}) {
        $formatter->{'code'} = 1;
        last;
      }
    }
  }
  print STDERR "NEW FORMATTER($type)\n" if ($self->get_conf('DEBUG'));
  return $formatter;
}

sub convert_line($$;$)
{
  my $self = shift;
  my $converted = shift;
  my $conf = shift;
  my $formatter = $self->new_formatter('line', $conf);
  push @{$self->{'formatters'}}, $formatter;
  my $text = $self->_convert($converted);
  $text .= $self->_count_added($formatter->{'container'},
                               $formatter->{'container'}->end());
  pop @{$self->{'formatters'}};
  return $text;
}

sub convert_unfilled($$;$)
{
  my $self = shift;
  my $converted = shift;
  my $conf = shift;
  my $formatter = $self->new_formatter('unfilled', $conf);
  $formatter->{'code'} = 1;
  push @{$self->{'formatters'}}, $formatter;
  my $result = $self->_convert($converted);
  $result .= $self->_count_added($formatter->{'container'},
                                 $formatter->{'container'}->end());
  pop @{$self->{'formatters'}};
  return $result;
}

sub count_bytes($$) 
{
  my $self = shift;
  my $string = shift;

  return Texinfo::Common::count_bytes($self, $string);
}

sub _add_text_count($$)
{
  my $self = shift;
  my $text = shift;
  $self->{'count_context'}->[-1]->{'bytes'} += $self->count_bytes($text);
}

sub _add_lines_count($$)
{
  my $self = shift;
  my $lines_count = shift;
  $self->{'count_context'}->[-1]->{'lines'} += $lines_count;
}

sub _add_location($$)
{
  my $self = shift;
  my $root = shift;
  my $location = { 'lines' => $self->{'count_context'}->[-1]->{'lines'} };
  push @{$self->{'count_context'}->[-1]->{'locations'}}, $location;
  if (!($root->{'extra'} and $root->{'extra'}->{'index_entry'})) {
    $location->{'bytes'}
      = $self->{'count_context'}->[-1]->{'bytes'};
    $location->{'root'} = $root;
  } else {
    $location->{'index_entry'} = $root;
  }
  return $location;
}

sub _count_added($$$)
{
  my $self = shift;
  my $container = shift;
  my $text = shift;

  $self->_add_lines_count($container->end_line_count());
  $self->_add_text_count($text);
  return $text;
}

sub _update_locations_counts($$)
{
  my $self = shift;
  my $locations = shift;
  foreach my $location (@$locations) {
    $location->{'bytes'} += $self->{'count_context'}->[-1]->{'bytes'}
       if (defined($location->{'bytes'}));
    $location->{'lines'} += $self->{'count_context'}->[-1]->{'lines'}
      if (defined($location->{'lines'}));
  }
}

sub _add_newline_if_needed($) {
  my $self = shift;
  if (defined($self->{'empty_lines_count'}) 
       and $self->{'empty_lines_count'} == 0) {
    $self->_add_text_count("\n");
    $self->_add_lines_count(1);
    $self->{'empty_lines_count'} = 1;
    return "\n";
  }
  return '';
}

my $footnote_indent = 3;
sub _footnotes($;$)
{
  my $self = shift;
  my $element = shift;

  $element = undef if ($element and $element->{'extra'}->{'no_node'});

  my $result = '';
  if (scalar(@{$self->{'pending_footnotes'}})) {
    $result .= $self->_add_newline_if_needed();
    print STDERR "FOOTNOTES ".scalar(@{$self->{'pending_footnotes'}})."\n"
        if ($self->get_conf('DEBUG'));
    if ($self->get_conf('footnotestyle') eq 'end' or !defined($element)) {
      my $footnotes_header = "   ---------- Footnotes ----------\n\n";
      $result .= $footnotes_header;
      $self->_add_text_count($footnotes_header);
      $self->_add_lines_count(2);
      $self->{'empty_lines_count'} = 1;
    } else {

      my $node_contents = [@{$element->{'extra'}->{'node'}->{'extra'}->{'node_content'}},
                                     {'text' => '-Footnotes'}];
      my $normalized
        = Texinfo::Convert::NodeNameNormalization::normalize_node(
                                                {'contents' => $node_contents});
      my $footnotes_node = {
        'cmdname' => 'node',
        'node_up' => $element->{'extra'}->{'node'},
        'extra' => {'node_content' => $node_contents,
                    'normalized' => $normalized}
      };
      $result .= $self->_node($footnotes_node);
      $self->{'node'} = $footnotes_node;
      $self->{'count_context'}->[-1]->{'lines'} = 3;
    }
    while (@{$self->{'pending_footnotes'}}) {
      my $footnote = shift (@{$self->{'pending_footnotes'}});

      # If nested within another footnote and footnotestyle is separate,
      # the element here will be the parent element and not the footnote
      # element, while the pxref will point to the name with the 
      # footnote node taken into account.  Not really problematic as
      # nested footnotes are not right.
      if ($element) {
        my $node_contents = [@{$element->{'extra'}->{'node'}->{'extra'}->{'node_content'}},
                    {'text' => "-Footnote-$footnote->{'number'}"}];
        my $normalized 
          = Texinfo::Convert::NodeNameNormalization::normalize_node({'contents' => $node_contents});
        $self->_add_location({'cmdname' => 'anchor',
                        'extra' => {'node_content' => $node_contents,
                                    'normalized' => $normalized}
                       });
      }
      # this pushes on 'context', 'format_context' and 'formatters'
      $self->push_top_formatter('footnote');
      my $formatted_footnote_number;
      if ($self->get_conf('NUMBER_FOOTNOTES')) {
        $formatted_footnote_number = $footnote->{'number'};
      } else {
        $formatted_footnote_number = $NO_NUMBER_FOOTNOTE_SYMBOL;
      }
      my $footnote_text = ' ' x $footnote_indent 
               . "($formatted_footnote_number) ";
      $result .= $footnote_text;
      $self->{'text_element_context'}->[-1]->{'counter'} += 
         Texinfo::Convert::Unicode::string_width($footnote_text);
      $self->_add_text_count($footnote_text);
      $self->{'empty_lines_count'} = 0;

      $result .= $self->_convert($footnote->{'root'}->{'args'}->[0]); 
      $result .= $self->_add_newline_if_needed();
      
      my $old_context = pop @{$self->{'context'}};
      die if ($old_context ne 'footnote');
      pop @{$self->{'format_context'}};
      pop @{$self->{'formatters'}};
      pop @{$self->{'text_element_context'}};
    }
  }
  $self->{'footnote_index'} = 0;

  return $result;
}

sub _align_lines($$$$$)
{
  my $self = shift;
  my $text = shift;
  my $max_column = shift;
  my $direction = shift;
  my $locations = shift;

  my $result = '';

  my $updated_locations = {};
  if ($locations and @$locations) {
    foreach my $location (@$locations) {
      next unless (defined($location->{'bytes'}));
      #print STDERR "L anchor $location->{'root'}->{'extra'}->{'normalized'}: $location->{'lines'} ($location->{'bytes'})\n";
      push @{$updated_locations->{$location->{'lines'}}}, $location;
    }
  }

  my $bytes_count = 0;
  my $delta_bytes = 0;
  my $line_index = 0;
  foreach my $line (split /^/, $text) {
    my $line_bytes_begin = 0;
    my $line_bytes_end = 0;
    my $chomped = chomp($line);
    # for debugging.
    my $orig_line = $line;
    $line_bytes_end -= $self->count_bytes($chomped);
    $line =~ s/^(\s*)//;
    $line_bytes_begin -= $self->count_bytes($1);
    $line =~ s/(\s*)$//;
    $line_bytes_end -= $self->count_bytes($1);
    my $line_width = Texinfo::Convert::Unicode::string_width($line);
    if ($line_width == 0) {
      $result .= "\n";
      $line_bytes_end += $self->count_bytes("\n");
      $bytes_count += $self->count_bytes("\n");
    } else {
      my $spaces_prepended;
      if ($line_width > $max_column) {
        $spaces_prepended = 0;
      } elsif ($direction eq 'center') {
        $spaces_prepended = (($max_column -1 - $line_width) /2);
      } else {
        $spaces_prepended = ($max_column -1 - $line_width);
      }
      $result .= ' ' x$spaces_prepended . $line ."\n";
      $line_bytes_begin += $self->count_bytes(' ' x$spaces_prepended);
      $line_bytes_end += $self->count_bytes("\n");
      if ($updated_locations->{$line_index}) {
        foreach my $location (@{$updated_locations->{$line_index}}) {
          $location->{'bytes'} += $line_bytes_begin + $delta_bytes;
          #print STDERR "UPDATE ALIGN: $location->{'root'}->{'extra'}->{'normalized'}: ($location->{'bytes'})\n";
        }
      }
      $bytes_count += $line_bytes_begin + $line_bytes_end 
                      + $self->count_bytes($line);
    }
    $delta_bytes += $line_bytes_begin + $line_bytes_end;
    #print STDERR "ALIGN $orig_line ($line_index. lbb $line_bytes_begin, lbe $line_bytes_end, delta $delta_bytes, bytes_count $bytes_count)\n";
    $line_index++;
  }
  return ($result, $bytes_count);
}

sub _align_environment($$$$)
{
  my $self = shift;
  my $result = shift;
  my $max = shift;
  my $align = shift;

  my $counts = pop @{$self->{'count_context'}};
  my $bytes_count;
  ($result, $bytes_count) = $self->_align_lines($result, $max,
                      $align, $counts->{'locations'});
  $self->_update_locations_counts($counts->{'locations'});
  $self->{'count_context'}->[-1]->{'bytes'} += $bytes_count;
  $self->{'count_context'}->[-1]->{'lines'} += $counts->{'lines'};
  push @{$self->{'count_context'}->[-1]->{'locations'}},
                       @{$counts->{'locations'}};
  return $result;
}

sub _contents($$$)
{
  my $self = shift;
  my $section_root = shift;
  my $contents_or_shortcontents = shift;

  my $contents = 1 if ($contents_or_shortcontents eq 'contents');

  #my $section = $section_root->{'section_childs'}->[0];
  my $root_level = $section_root->{'section_childs'}->[0]->{'level'};
  foreach my $top_section(@{$section_root->{'section_childs'}}) {
    $root_level = $top_section->{'level'} 
      if ($top_section->{'level'} < $root_level);
  }

  my $result = '';
  my $lines_count = 0;
  # This is done like that because the tree may not be well formed if
  # there is a @part after a @chapter for example.
  foreach my $top_section (@{$section_root->{'section_childs'}}) {
    my $section = $top_section;
 SECTION:
    while ($section) {# and $section ne $section_root) {
      push @{$self->{'count_context'}}, {'lines' => 0, 'bytes' => 0};
      my $section_title_tree;
      if (defined($section->{'number'}) 
          and ($self->get_conf('NUMBER_SECTIONS')
               or !defined($self->get_conf('NUMBER_SECTIONS')))) {
        if ($section->{'cmdname'} eq 'appendix' and $section->{'level'} == 1) {
          $section_title_tree = $self->gdt('Appendix {number} {section_title}',
                           {'number' => {'text' => $section->{'number'}},
                            'section_title' 
                              => {'contents' => $section->{'extra'}->{'misc_content'}}});
        } else {
          $section_title_tree = $self->gdt('{number} {section_title}',
                           {'number' => {'text' => $section->{'number'}},
                            'section_title' 
                              => {'contents' => $section->{'extra'}->{'misc_content'}}});
        }
      } else {
        $section_title_tree = {'contents' => $section->{'extra'}->{'misc_content'}};
      }
      my $section_title = $self->convert_line(
            {'contents' => [$section_title_tree],
             'type' => 'frenchspacing'});
      pop @{$self->{'count_context'}};
      my $text = $section_title;
      chomp ($text);
      $text .= "\n";
      $result .= (' ' x (2*($section->{'level'} - ($root_level+1)))) . $text;
      $lines_count++;
      if ($section->{'section_childs'} 
          and ($contents or $section->{'level'} < $root_level+1)) {
        $section = $section->{'section_childs'}->[0];
      } elsif ($section->{'section_next'}) {
        last if ($section eq $top_section);
        $section = $section->{'section_next'};
      } else {
        last if ($section eq $top_section);
        while ($section->{'section_up'}) {
          $section = $section->{'section_up'};
          last SECTION if ($section eq $top_section);
          if ($section->{'section_next'}) {
            $section = $section->{'section_next'};
            last;
          }
        }
      }
    }
  }
  return ($result, $lines_count);
}

sub _menu($$)
{
  my $self = shift;
  my $menu_command = shift;

  if ($menu_command->{'cmdname'} eq 'menu') {
    my $result = "* Menu:\n\n";
    $self->_add_text_count($result);
    $self->_add_lines_count(2);
    return $result;
  } else {
    return '';
  }
}

sub _printindex($$)
{
  my $self = shift;
  my $printindex = shift;
  return ('');
}

sub _node($$)
{
  my $self = shift;
  my $node = shift;

  return '';
}

# no error in plaintext
sub _error_outside_of_any_node($$)
{
  my $self = shift;
  my $root = shift;
}

sub _anchor($$)
{
  my $self = shift;
  my $anchor = shift;

  if (!($self->{'multiple_pass'} or $self->{'in_copying_header'})) {
    $self->_add_location($anchor); 
    $self->_error_outside_of_any_node($anchor);
  }
  return '';
}

my $listoffloat_entry_length = 41;
my $listoffloat_append = '...';

sub ensure_end_of_line($$)
{
  my $self = shift;
  my $text = shift;
  my $chomped = chomp ($text);
  if ($chomped) {
    $self->{'count_context'}->[-1]->{'bytes'} -= $self->count_bytes($chomped);
    $self->{'count_context'}->[-1]->{'lines'} -= 1;
  }
  $text .= "\n";
  $self->_add_text_count("\n");
  $self->_add_lines_count(1);
  return $text;
}

sub _image_text($$$)
{
  my $self = shift;
  my $root = shift;
  my $basefile = shift;

  my $txt_file = $self->Texinfo::Common::locate_include_file ($basefile.'.txt');
  if (!defined($txt_file)) {
    return undef;
  } else {
    my $filehandle = do { local *FH };
    if (open ($filehandle, $txt_file)) {
      binmode($filehandle, ":encoding($self->{'perl_encoding'})")
                if (defined($self->{'perl_encoding'}));
      my $result = '';
      while (<$filehandle>) {
        $result .= $_;
      }
      # remove last end of line
      chomp ($result);
      if (!close ($filehandle)) {
        $self->document_warn(sprintf($self->__("Error on closing image text file %s: %s"),
                                     $txt_file, $!));
      }
      return $result;
    } else {
      $self->line_warn(sprintf($self->__("\@image file `%s' unreadable: %s"), 
                               $txt_file, $!), $root->{'line_nr'});
    }
  }
  return undef;
}

sub _image_formatted_text($$$$$)
{
  my $self = shift;
  my $root = shift;
  my $basefile = shift;
  my $text = shift;
  my $text_result = shift;

  my $result;
  if (defined($text)) {
    $result = $text_result;
  } elsif (defined($root->{'extra'}->{'brace_command_contents'}->[3])) {
    my $alt = Texinfo::Convert::Text::convert(
      {'contents' => $root->{'extra'}->{'brace_command_contents'}->[3]},
      {Texinfo::Common::_convert_text_options($self)});
    if (!$self->{'formatters'}->[-1]->{'_top_formatter'}) {
      $result = '['.$alt.']';
    } else {
      $result = $alt;
    }
  } else {
    $result = '['.$basefile.']';
  }
  return $result;
}

sub _image($$)
{
  my $self = shift;
  my $root = shift;

  if (defined($root->{'extra'}->{'brace_command_contents'}->[0])) {
    my $basefile = Texinfo::Convert::Text::convert(
     {'contents' => $root->{'extra'}->{'brace_command_contents'}->[0]},
     {'code' => 1, Texinfo::Common::_convert_text_options($self)});
    my $text = $self->_image_text($root, $basefile);
    my $text_result;
    if (defined($text)) {
      if (!$self->{'formatters'}->[-1]->{'_top_formatter'}) {
        $text_result = '['.$text.']';
      } else {
        $text_result = $text;
      }
    }
    my $result = $self->_image_formatted_text($root, $basefile, $text,
                                              $text_result);
    my $lines_count = ($result =~ tr/\n/\n/);
    return ($result, $lines_count);
  }
  return ('', 0);
}

sub _convert($$);

sub _convert($$)
{
  my $self = shift;
  my $root = shift;

  my $formatter = $self->{'formatters'}->[-1];

  if ($self->get_conf('DEBUG')) {
    my $is_top_formatter = 0;
    $is_top_formatter = 1 if ($formatter->{'_top_formatter'});
    my $empty_lines_count = '';
    $empty_lines_count = $self->{'empty_lines_count'} 
      if defined($self->{'empty_lines_count'});
    print STDERR "ROOT:$root (".join('|',@{$self->{'context'}})."), formatters ".scalar(@{$self->{'formatters'}}) . " ->";
    print STDERR " cmd: $root->{'cmdname'}," if ($root->{'cmdname'});
    print STDERR " type: $root->{'type'}" if ($root->{'type'});
    my $text = $root->{'text'}; 
    if (defined($text)) {
      $text =~ s/\n/\\n/;
      print STDERR " text: $text";
    }
    print STDERR "\n";
   
    print STDERR " empty_lines $empty_lines_count,top_fmter $is_top_formatter,format_ctxt $self->{'format_context'}->[-1]->{'cmdname'},para_cnt $self->{'format_context'}->[-1]->{'paragraph_count'},indent_lvl $self->{'format_context'}->[-1]->{'indent_level'},"
      .(defined($self->{'text_element_context'}->[-1]->{'counter'}) ? "counter $self->{'text_element_context'}->[-1]->{'counter'}," : '') 
       ."max $self->{'text_element_context'}->[-1]->{'max'}\n";
    #print STDERR "  Special def_command: $root->{'extra'}->{'def_command'}\n"
    #  if (defined($root->{'extra'}) and $root->{'extra'}->{'def_command'});
    if ($formatter) {
      print STDERR "  Container:($formatter->{'code'},$formatter->{'upper_case'},$formatter->{'frenchspacing_stack'}->[-1]) ";
      $formatter->{'container'}->dump();
    }
  }

  if (($root->{'type'} and $self->{'ignored_types'}->{$root->{'type'}}
       and ($root->{'type'} ne 'empty_spaces_before_paragraph'
            or $self->get_conf('paragraphindent') ne 'asis'))
       or ($root->{'cmdname'} 
            and ($self->{'ignored_commands'}->{$root->{'cmdname'}}
                 or ($inline_format_commands{$root->{'cmdname'}}
                     and (!$root->{'extra'}->{'format'}
                          or !$self->{'expanded_formats_hash'}->{$root->{'extra'}->{'format'}}))))) {
    print STDERR "IGNORED\n" if ($self->get_conf('DEBUG'));
    return '';
  }
  my $result = '';

  # First handle empty lines. This has to be done before the handling
  # of text below to be sure that an empty line is always processed
  # especially
  if ($root->{'type'} and ($root->{'type'} eq 'empty_line' 
                           or $root->{'type'} eq 'after_description_line')) {
    if ($self->get_conf('DEBUG')) {
      my $count = $self->{'empty_lines_count'};
      $count = '' if (!defined($count));
      print STDERR "EMPTY_LINE ($count)\n";
    }
    delete $self->{'text_element_context'}->[-1]->{'counter'};
    $self->{'empty_lines_count'}++;
    if ($self->{'empty_lines_count'} <= 1
        or $self->{'preformatted_context_commands'}->{$self->{'context'}->[-1]}) {
      $result = "\n";
      $self->_add_text_count($result);
      $self->_add_lines_count(1);
      return $result;
    } else {
      return '';
    }
  }

  # process text
  if (defined($root->{'text'})) {
    if (!$formatter->{'_top_formatter'}) {
      if ($root->{'type'} and ($root->{'type'} eq 'raw' 
                               or $root->{'type'} eq 'last_raw_newline')) {
        $result = $self->_count_added($formatter->{'container'},
                    $formatter->{'container'}->add_next($root->{'text'}));
      } elsif ($root->{'type'} and ($root->{'type'} eq 'underlying_text')) {
        $formatter->{'container'}->add_underlying_text($root->{'text'});
      } else {
        my ($text, $lower_case_text) = $self->_process_text($root, $formatter);
        $result = $self->_count_added($formatter->{'container'},
                    $formatter->{'container'}->add_text($text, $lower_case_text));
      }
      return $result;
    # the following is only possible if paragraphindent is set to asis
    } elsif ($root->{'type'} and $root->{'type'} eq 'empty_spaces_before_paragraph') {
      $self->_add_text_count($root->{'text'});
      return $root->{'text'};
    # ignore text outside of any format, but warn if ignored text not empty
    } elsif ($root->{'text'} =~ /\S/) {
      warn "BUG: ignored text not empty `$root->{'text'}'\n";
      return '';
    }
  }

  if ($root->{'extra'}) {
    if ($root->{'extra'}->{'invalid_nesting'}) {
      print STDERR "INVALID_NESTING\n" if ($self->get_conf('DEBUG'));
      return '';
    } elsif ($root->{'extra'}->{'missing_argument'} 
             and (!$root->{'contents'} or !@{$root->{'contents'}})) {
      print STDERR "MISSING_ARGUMENT\n" if ($self->get_conf('DEBUG'));
      return '';
    }
  }

  if ($root->{'extra'} and $root->{'extra'}->{'index_entry'}
      and !$self->{'multiple_pass'} and !$self->{'in_copying_header'}) {
    my $location = $self->_add_location($root);
    # remove a 'lines' from $location if at the very end of a node
    # since it will lead to the next node otherwise.
    if ($root->{'cmdname'} and $root->{'cmdname'} =~ /index/) {
      my $following_not_empty;
      my @parents = @{$self->{'current_roots'}};
      my @parent_contents = @{$self->{'current_contents'}};
      while (@parents) {
        my $parent = pop @parents;
        my $parent_content = pop @parent_contents;
        if ($parent->{'type'} and $parent->{'type'} eq 'paragraph') {
          $following_not_empty = 1;
          last;
        }
        foreach my $following_content (@$parent_content) {
          unless (($following_content->{'type'} 
                and ($following_content->{'type'} eq 'empty_line'
                    or $ignored_types{$following_content->{'type'}}))
              or ($following_content->{'cmdname'} 
                  and ($following_content->{'cmdname'} eq 'c'  
                       or $following_content->{'cmdname'} eq 'comment'))) {
            $following_not_empty = 1;
            last;
          }
        }
        last if $following_not_empty;
        if ($parent->{'cmdname'} and $root_commands{$parent->{'cmdname'}}) {
          last;
        }
      }
      if (! $following_not_empty) {
        print STDERR "INDEX ENTRY $root->{'cmdname'} followed by empty lines\n"
            if ($self->get_conf('DEBUG'));
        $location->{'lines'}--;
      }
    }
    # this covers the special case for index entry not associated with a 
    # node but seen.  this will be an index entry in @copying, 
    # in @insertcopying.
    # This also covers the case of an index entry in a node added by a 
    # @footnote with footnotestyle separate.
    if ($self->{'node'}) {
      $location->{'node'} = $self->{'node'};
    }
    $self->{'index_entries_line_location'}->{$root} = $location;
    print STDERR "INDEX ENTRY lines_count $location->{'lines'}, index_entry $location->{'index_entry'}\n" 
       if ($self->get_conf('DEBUG'));
  }

  my $cell;
  my $preformatted;
  if ($root->{'cmdname'}) {
    my $unknown_command;
    my $command = $root->{'cmdname'};
    if (defined($no_brace_commands{$command})) {
      if ($command eq ':') {
        $formatter->{'container'}->inhibit_end_sentence();
        return '';
      } elsif ($command eq '*') {
        $result = $self->_count_added($formatter->{'container'},
                              $formatter->{'container'}->add_pending_word());
        $result .= $self->_count_added($formatter->{'container'},
                              $formatter->{'container'}->end_line());
      } elsif ($command eq '.' or $command eq '?' or $command eq '!') {
        $result .= $self->_count_added($formatter->{'container'},
            $formatter->{'container'}->add_next($command, undef, 1));
      } elsif ($command eq ' ' or $command eq "\n" or $command eq "\t") {
        $result .= $self->_count_added($formatter->{'container'}, 
            $formatter->{'container'}->add_next($no_brace_commands{$command}));
      } else {
        $result .= $self->_count_added($formatter->{'container'}, 
            $formatter->{'container'}->add_text($no_brace_commands{$command}));
      }
      return $result;
    } elsif ($root->{'cmdname'} eq 'today') {
      my $today = $self->Texinfo::Common::expand_today();
      unshift @{$self->{'current_contents'}->[-1]}, $today;
    } elsif (exists($brace_no_arg_commands{$root->{'cmdname'}})) {
      my $text;
      my %text_options = Texinfo::Common::_convert_text_options($self);
      
      $text = Texinfo::Convert::Text::brace_no_arg_command($root, 
                            {%text_options, 
                             'sc' => $formatter->{'upper_case'}});
      my $lower_case_text;
      # always double spacing, so set underlying text lower case.
      if ($formatter->{'var'} or $formatter->{'code'}) {
        $lower_case_text = Texinfo::Convert::Text::brace_no_arg_command($root,
                             {%text_options,
                              'lc' => 1});
      } elsif ($formatter->{'upper_case'}) {
        $lower_case_text = Texinfo::Convert::Text::brace_no_arg_command($root,
                             {%text_options
                              });
      }
      if ($punctuation_no_arg_commands{$command}) {
        $result .= $self->_count_added($formatter->{'container'},
                    $formatter->{'container'}->add_next($text, undef, 1));
      } elsif ($command eq 'tie') {
        $formatter->{'w'}++;
        $result .= $self->_count_added($formatter->{'container'},
            $formatter->{'container'}->set_space_protection(1,1))
          if ($formatter->{'w'} == 1);
        $result .= $self->_count_added($formatter->{'container'}, 
                       $formatter->{'container'}->add_text($text,
                                                           $lower_case_text)); 
        $formatter->{'w'}--;
        $result .= $self->_count_added($formatter->{'container'},
            $formatter->{'container'}->set_space_protection(0,0))
          if ($formatter->{'w'} == 0);
      } else {
        # This is to have @TeX{}, for example, be considered as tex
        # as underlying text in order not to prevent end sentences.
        if (!$letter_no_arg_commands{$command}) {
          $lower_case_text = lc($text);
        }
        $result .= $self->_count_added($formatter->{'container'}, 
                       $formatter->{'container'}->add_text($text,
                                                           $lower_case_text)); 
        if ($command eq 'dots') {
          $formatter->{'container'}->inhibit_end_sentence();
        }
      }
      return $result;
    # commands with braces
    } elsif ($accent_commands{$root->{'cmdname'}}) {
      my $encoding;
      if ($self->get_conf('ENABLE_ENCODING')) {
        $encoding = $self->{'encoding_name'};
      }
      my $sc;
      if ($formatter->{'upper_case'}) {
        $sc = 1;
      }
      my $accented_text 
         = Texinfo::Convert::Text::text_accents($root, $encoding, $sc);
      my $accented_text_lower_case;
      if ($formatter->{'var'} or $formatter->{'code'}) {
        $accented_text_lower_case
         = Texinfo::Convert::Text::text_accents($root, $encoding, -1);
      } elsif ($formatter->{'upper_case'}) {
        $accented_text_lower_case
         = Texinfo::Convert::Text::text_accents($root, $encoding);
      }
      $result .= $self->_count_added($formatter->{'container'},
         $formatter->{'container'}->add_text($accented_text, 
                                             $accented_text_lower_case));
      # in case the text added ends with punctuation.  
      # If the text is empty (likely because of an error) previous 
      # punctuation will be cancelled, we don't want that.
      $formatter->{'container'}->inhibit_end_sentence()
        if ($accented_text ne '');
      return $result;
    } elsif ($self->{'style_map'}->{$command} 
         or ($root->{'type'} and $root->{'type'} eq 'definfoenclose_command')) {
      $formatter->{'code'}++
        if ($code_style_commands{$command});
      if ($no_punctation_munging_commands{$command}) {
        push @{$formatter->{'frenchspacing_stack'}}, 'on';
        $formatter->{'container'}->set_space_protection(undef,
          undef,undef,1);
      }
      if ($upper_case_commands{$command}) {
        $formatter->{'upper_case'}++;
        $formatter->{'var'}++ if ($command eq 'var');
      }
      if ($command eq 'w') {
        $formatter->{'w'}++;
        $result .= $self->_count_added($formatter->{'container'},
            $formatter->{'container'}->set_space_protection(1,1))
          if ($formatter->{'w'} == 1);
      }
      my ($text_before, $text_after);
      if ($root->{'type'} and $root->{'type'} eq 'definfoenclose_command') {
        $text_before = $root->{'extra'}->{'begin'};
        $text_after = $root->{'extra'}->{'end'};
      } else {
        $text_before = $self->{'style_map'}->{$command}->[0];
        $text_after = $self->{'style_map'}->{$command}->[1];
      }
      $result .= $self->_count_added($formatter->{'container'},
               $formatter->{'container'}->add_next($text_before, 
                                                   undef, undef, 1))
         if ($text_before ne '');
      if ($root->{'args'}) {
        $result .= $self->_convert($root->{'args'}->[0]);
        if ($root->{'cmdname'} eq 'strong' 
             and scalar (@{$root->{'args'}->[0]->{'contents'}})
             and $root->{'args'}->[0]->{'contents'}->[0]->{'text'}
             and $root->{'args'}->[0]->{'contents'}->[0]->{'text'} =~ /^Note\b/i
             and $self->{'output_format'}
             and $self->{'output_format'} eq 'info') {
          $self->line_warn($self->__("\@strong{Note...} produces a spurious cross-reference in Info; reword to avoid that"), $root->{'line_nr'});
        }
      }
      $result .= $self->_count_added($formatter->{'container'},
               $formatter->{'container'}->add_next($text_after,
                                                   undef, undef, 1))
         if ($text_after ne '');
      if ($command eq 'w') {
        $formatter->{'w'}--;
        $result .= $self->_count_added($formatter->{'container'},
            $formatter->{'container'}->set_space_protection(0,0))
          if ($formatter->{'w'} == 0);
      }
      if ($code_style_commands{$command}) {
        $formatter->{'code'}--;
      }
      if ($no_punctation_munging_commands{$command}) {
        pop @{$formatter->{'frenchspacing_stack'}};
        my $frenchspacing = 0;
        $frenchspacing = 1 if ($formatter->{'frenchspacing_stack'}->[-1] eq 'on');
        $formatter->{'container'}->set_space_protection(undef,
          undef, undef, $frenchspacing);
      }
      if ($upper_case_commands{$command}) {
        $formatter->{'upper_case'}--;
        $formatter->{'var'}-- if ($command eq 'var');
      }
      return $result;
    } elsif ($root->{'cmdname'} eq 'image') {
      $result = $self->_count_added($formatter->{'container'},
                   $formatter->{'container'}->add_pending_word(1));
      my ($image, $lines_count) = $self->_image($root);
      $self->_add_lines_count($lines_count);
      $self->_add_text_count($image);
      if ($image ne '' and $formatter->{'type'} ne 'paragraph') {
        $self->{'empty_lines_count'} = 0;
      }
      $result .= $image; 
      return $result;
    } elsif ($root->{'cmdname'} eq 'email') {
      # nothing is output for email, instead the command is substituted.
      my @email_contents;
      if ($root->{'extra'} and $root->{'extra'}->{'brace_command_contents'}) {
        my $name;
        my $email;
        if (scalar (@{$root->{'extra'}->{'brace_command_contents'}}) == 2
            and defined($root->{'extra'}->{'brace_command_contents'}->[-1])) {
          $name = $root->{'extra'}->{'brace_command_contents'}->[1];
        }
        if (defined($root->{'extra'}->{'brace_command_contents'}->[0])) {
          $email = $root->{'extra'}->{'brace_command_contents'}->[0];
        }
        my $prepended;
        if ($name and $email) {
          $prepended = $self->gdt('{name} @indicateurl{{email}}', 
                           {'name' => $name, 'email' => $email});
        } elsif ($email) {
          $prepended = $self->gdt('@indicateurl{{email}}', 
                           {'email' => $email});
        } elsif ($name) {
          $prepended = {'contents' => $name};
        } else {
          return '';
        }
        unshift @{$self->{'current_contents'}->[-1]}, $prepended;
      }
      return '';
    } elsif ($command eq 'uref' or $command eq 'url') {
      if ($root->{'extra'} and $root->{'extra'}->{'brace_command_contents'}) {
        if (scalar(@{$root->{'extra'}->{'brace_command_contents'}}) == 3
             and defined($root->{'extra'}->{'brace_command_contents'}->[2])) {
          unshift @{$self->{'current_contents'}->[-1]}, 
            {'contents' => $root->{'extra'}->{'brace_command_contents'}->[2]};
        } elsif (defined($root->{'extra'}->{'brace_command_contents'}->[0])) {
          # no mangling of --- and similar in url.
          my $url = {'type' => 'code',
              'contents' => $root->{'extra'}->{'brace_command_contents'}->[0]};
          if (scalar(@{$root->{'extra'}->{'brace_command_contents'}}) == 2
             and defined($root->{'extra'}->{'brace_command_contents'}->[1])) {
            my $prepended = $self->gdt('{text} ({url})', 
                 {'text' => $root->{'extra'}->{'brace_command_contents'}->[1],
                  'url' => $url });
            unshift @{$self->{'current_contents'}->[-1]}, $prepended;
          } else {
            my $prepended = $self->gdt('@code{{url}}', 
                                        {'url' => $url});
            unshift @{$self->{'current_contents'}->[-1]}, $prepended
          }
        } elsif (scalar(@{$root->{'extra'}->{'brace_command_contents'}}) == 2
                 and defined($root->{'extra'}->{'brace_command_contents'}->[1])) {
          unshift @{$self->{'current_contents'}->[-1]}, 
            {'contents' => $root->{'extra'}->{'brace_command_contents'}->[1]};
        }
      }
      return '';
    } elsif ($command eq 'footnote') {
      $self->{'footnote_index'}++ unless ($self->{'multiple_pass'});
      my $formatted_footnote_number;
      if ($self->get_conf('NUMBER_FOOTNOTES')) {
        $formatted_footnote_number = $self->{'footnote_index'};
      } else {
        $formatted_footnote_number = $NO_NUMBER_FOOTNOTE_SYMBOL;
      }
      push @{$self->{'pending_footnotes'}}, {'root' => $root, 
                                    'number' => $self->{'footnote_index'}}
          unless ($self->{'multiple_pass'});
      if (!$self->{'in_copying_header'}) {
        $self->_error_outside_of_any_node($root);
      }
      $result .= $self->_count_added($formatter->{'container'},
           $formatter->{'container'}->add_next("($formatted_footnote_number)", 
                                                  undef, undef, 1));
      if ($self->get_conf('footnotestyle') eq 'separate' and $self->{'node'}) {
        $result .= $self->_convert({'contents' => 
         [{'text' => ' ('},
          {'cmdname' => 'pxref',
           'extra' => {'brace_command_contents' => 
          [[@{$self->{'node'}->{'extra'}->{'node_content'}},
                   {'text' => "-Footnote-$self->{'footnote_index'}"}]]}},
          {'text' => ')'}],
          });
      }
      return $result;
    } elsif ($command eq 'anchor') {
      $result = $self->_count_added($formatter->{'container'},
                   $formatter->{'container'}->add_pending_word());
      $result .= $self->_anchor($root);
      return $result;
    } elsif ($ref_commands{$command}) {
      if ($root->{'extra'} and $root->{'extra'}->{'brace_command_contents'}
          and scalar(@{$root->{'extra'}->{'brace_command_contents'}})) {
        my @args = @{$root->{'extra'}->{'brace_command_contents'}};
        $args[0] = [{'text' => ''}] if (!defined($args[0]));

        # normalize node name, to get a ref with the right formatting
        # NOTE as a consequence, the line numbers appearing in case of errors
        # correspond to the node lines numbers, and not the @ref.
        my $node_content;
        if ($root->{'extra'}
            and $root->{'extra'}->{'label'}) {
          $node_content = $root->{'extra'}->{'label'}->{'extra'}->{'node_content'};
        } else { 
          $node_content = $args[0];
        }

        # if it a reference to a float with a label, $arg[1] is
        # set to '$type $number' or '$number' if there is no type.
        if (! defined($args[1]) 
            and $root->{'extra'}
            and $root->{'extra'}->{'label'}
            and $root->{'extra'}->{'label'}->{'cmdname'}
            and $root->{'extra'}->{'label'}->{'cmdname'} eq 'float') {
          my $float = $root->{'extra'}->{'label'};

          my $name = $self->_float_type_number($float);;
          $args[1] = $name->{'contents'};
        }
        if ($command eq 'inforef' and scalar(@args) == 3) {
          $args[3] = $args[2];
          $args[2] = undef;
        }
        my @contents;
        if ($command eq 'xref') {
          $contents[0] = {'text' => '*Note '};
        } else {
          $contents[0] = {'text' => '*note '};
        }
        my $name;
        if (defined($args[1])) {
          $name = $args[1];
        } elsif (defined($args[2])) {
          $name = $args[2];
        }
        my $file;
        if (defined($args[3])) {
          $file = [{'text' => '('},
                   {'type' => 'code',
                    'contents' => $args[3]},
                   {'text' => ')'},];
        } elsif (defined($args[4])) {
          # add a () such that the node is considered to be external, 
          # even though the manual name is not known.
          $file = [{'text' => '()'}];
        }
         
        if ($name) {
          push @contents, (@$name, {'text' => ': '});
          if ($file) {
            push @contents, @$file;
          }
          # node name
          push @contents, ({'type' => 'code',
                            'contents' => $node_content});
        } else {
          if ($file) {
            push @contents, @$file;
          }
          push @contents, ({'type' => 'code',
                            'contents' => [@{$node_content}, {'text' => '::'}]});
        }
        $result = $self->_convert({'contents' => \@contents});
        # we could use $formatter, but in case it was changed in _convert 
        # we play it safe.
        my $pending = $result 
            .$self->{'formatters'}->[-1]->{'container'}->get_pending();

        # If command is @xref, the punctuation must always follow the
        # command, for other commands it may be in the argument, hence the
        # use of $pending.
        if ($command eq 'xref' or ($pending !~ /[\.,]$/ and $pending !~ /::$/)) {
          my $next = $self->{'current_contents'}->[-1]->[0];
          if (!($next and $next->{'text'} and $next->{'text'} =~ /^[\.,]/)) {
            if ($command eq 'xref') {
              if ($next and defined($next->{'text'}) and $next->{'text'} =~ /\S/) {
                my $text = $next->{'text'};
                $text =~ s/^\s*//;
                my $char = substr($text, 0, 1);
                $self->line_warn(sprintf($self->__("`.' or `,' must follow \@xref, not %s"), $char), $root->{'line_nr'});
              } else {
                $self->line_warn($self->__("`.' or `,' must follow \@xref"), $root->{'line_nr'});
              }
            }
            my @added = ({'text' => '.'});
            # the added dot do not end a sentence for pxref or ref.
            push @added, {'cmdname' => ':'} if ($command ne 'xref');
            unshift @{$self->{'current_contents'}->[-1]}, @added;
          }
        }
        return $result;
      }
      return '';
    } elsif ($explained_commands{$command}) {
      if ($root->{'extra'} and $root->{'extra'}->{'brace_command_contents'}
          and defined($root->{'extra'}->{'brace_command_contents'}->[0])) {
        # in abbr spaces never end a sentence.
        my $argument;
        if ($command eq 'abbr') {
          $argument = {'type' => 'frenchspacing',
                     'contents' => $root->{'extra'}->{'brace_command_contents'}->[0]};
        } else {
          $argument = {'contents' => $root->{'extra'}->{'brace_command_contents'}->[0]};
        }
        if (scalar (@{$root->{'extra'}->{'brace_command_contents'}}) == 2
           and defined($root->{'extra'}->{'brace_command_contents'}->[-1])) {
          my $prepended = $self->gdt('{abbr_or_acronym} ({explanation})', 
                           {'abbr_or_acronym' => $argument, 
                            'explanation' => 
                             $root->{'extra'}->{'brace_command_contents'}->[-1]});
          #print STDERR "".Data::Dumper->Dump([$prepended])."\n";
          unshift @{$self->{'current_contents'}->[-1]}, $prepended;
        } else {
          # FIXME The underlying_text added is very ugly.  It leads to 'a'
          # being prepended in the underlying word after the abbr or acronym,
          # the intended effect being that a following period is always
          # interpreted as ending a sentence.
          unshift @{$self->{'current_contents'}->[-1]}, ($argument,
                    {'type' => 'underlying_text', 'text' => 'a'});
        }
      }
      return '';
    } elsif ($inline_format_commands{$command}) {
      if (scalar (@{$root->{'extra'}->{'brace_command_contents'}}) == 2
         and defined($root->{'extra'}->{'brace_command_contents'}->[-1])) {
        my $argument;
        if ($command eq 'inlineraw') {
          $argument->{'type'} = 'code';
        }
        $argument->{'contents'} 
            = $root->{'extra'}->{'brace_command_contents'}->[-1];
        unshift @{$self->{'current_contents'}->[-1]}, ($argument);
      }
      return '';
    } elsif ($command eq 'math') {
      push @{$self->{'context'}}, 'math';
      if ($root->{'args'}) {
        $result .= $self->_convert({'type' => 'frenchspacing',
             'contents' => [{'type' => 'code',
                            'contents' => [$root->{'args'}->[0]]}]});
      }
      my $old_context = pop @{$self->{'context'}};
      die if ($old_context ne 'math');
      return $result;
    } elsif ($command eq 'titlefont') {
      push @{$self->{'count_context'}}, {'lines' => 0, 'bytes' => 0};
      $result = $self->convert_line ({'type' => 'frenchspacing',
               'contents' => [$root->{'args'}->[0]]});
      pop @{$self->{'count_context'}};
      $result = Texinfo::Convert::Text::heading({'level' => 0, 
        'cmdname' => 'titlefont'}, $result, $self, 
        $self->get_conf('NUMBER_SECTIONS'));
      $self->{'empty_lines_count'} = 0 unless ($result eq '');
      $self->_add_text_count($result);
      $self->_add_lines_count(2);
      return $result;
    } elsif ($command eq 'value') {
      my $expansion = $self->gdt('@{No value for `{value}\'@}', 
                                    {'value' => $root->{'type'}});
      if ($formatter->{'_top_formatter'}) {
        $expansion = {'type' => 'paragraph',
                      'contents' => [$expansion]};
      }
      $result .= $self->_convert($expansion);
      #  unshift @{$self->{'current_contents'}->[-1]}, $expansion;
      #return '';
      return $result;
    } elsif ($root->{'args'} and $root->{'args'}->[0] 
             and $root->{'args'}->[0]->{'type'}
             and $root->{'args'}->[0]->{'type'} eq 'brace_command_arg') {
      print STDERR "Unknown command with braces `$root->{'cmdname'}'\n"
       if ($self->get_conf('VERBOSE') or $self->get_conf('DEBUG'));
    # block commands
    } elsif (exists($block_commands{$root->{'cmdname'}})) {
      # remark:
      # cartouche group and raggedright -> nothing on format stack

      if ($menu_commands{$root->{'cmdname'}} and !$self->get_conf('SHOW_MENU')) {
        return '';
      }
      if ($self->{'preformatted_context_commands'}->{$root->{'cmdname'}}
          or $root->{'cmdname'} eq 'float') {
        if ($self->{'formatters'}->[-1]->{'type'} eq 'paragraph'
            and $format_raw_commands{$root->{'cmdname'}}) {
          $result .= $self->_count_added($formatter->{'container'},
                              $formatter->{'container'}->add_pending_word(1));
          $result .= $self->_count_added($formatter->{'container'},
                              $formatter->{'container'}->end_line());
        }
        push @{$self->{'context'}}, $root->{'cmdname'};
      } elsif ($flush_commands{$root->{'cmdname'}}) {
        push @{$self->{'context'}}, $root->{'cmdname'};
      } elsif ($raw_commands{$root->{'cmdname'}}) {
        if (!$self->{'formatters'}->[-1]->{'_top_formatter'}) {
          # reuse the current formatter if not in top level
          $result .= $self->_count_added($formatter->{'container'},
                              $formatter->{'container'}->add_pending_word(1));
          $result .= $self->_count_added($formatter->{'container'},
                              $formatter->{'container'}->end_line());
        } else {
          # if in top level, the raw block command is turned into a 
          # simple preformatted command (alike @verbatim), to have a 
          # formatter container being created.
          push @{$self->{'context'}}, $root->{'cmdname'};
          $self->{'format_context_commands'}->{$root->{'cmdname'}} = 1;
          $self->{'preformatted_context_commands'}->{$root->{'cmdname'}} = 1;
        }
      }

      if ($self->{'format_context_commands'}->{$root->{'cmdname'}}) {
        push @{$self->{'format_context'}}, 
             { 'cmdname' => $root->{'cmdname'},
               'paragraph_count' => 0,
               'indent_level' => 
                   $self->{'format_context'}->[-1]->{'indent_level'},
             };
        $self->{'format_context'}->[-1]->{'indent_level'}++
           if ($indented_commands{$root->{'cmdname'}});
        # open a preformatted container, if the command opening the 
        # preformatted context is not a classical preformatted 
        # command (ie if it is menu or verbatim, and not example or  
        # similar)
        if ($self->{'preformatted_context_commands'}->{$root->{'cmdname'}}
            and ! $preformatted_commands{$root->{'cmdname'}}
            and ! $format_raw_commands{$root->{'cmdname'}}) {
          $preformatted = $self->new_formatter('unfilled');
          push @{$self->{'formatters'}}, $preformatted;
        }
      }
      if ($root->{'cmdname'} eq 'quotation'
          or $root->{'cmdname'} eq 'smallquotation') {
        if ($root->{'extra'} and $root->{'extra'}->{'block_command_line_contents'}) {
          my $prepended = $self->gdt('@b{{quotation_arg}:} ', 
             {'quotation_arg' => $root->{'extra'}->{'block_command_line_contents'}->[0]});
          #print STDERR Data::Dumper->Dump([$prepended]);
          $prepended->{'type'} = 'frenchspacing';
          $result .= $self->convert_line($prepended);
          $self->{'text_element_context'}->[-1]->{'counter'} += 
             Texinfo::Convert::Unicode::string_width($result);
          $self->{'empty_lines_count'} = 0 unless ($result eq '');
        }
      } elsif ($menu_commands{$root->{'cmdname'}}) {
        $result .= $self->_menu($root);
      } elsif ($root->{'cmdname'} eq 'multitable') {
        my $columnsize;
        if ($root->{'extra'}->{'columnfractions'}) {
          foreach my $fraction (@{$root->{'extra'}->{'columnfractions'}}) {
            push @$columnsize, int($fraction * $self->{'text_element_context'}->[-1]->{'max'} +0.5);
          }
        } elsif ($root->{'extra'}->{'prototypes'}) {
          foreach my $prototype (@{$root->{'extra'}->{'prototypes'}}) {
            push @{$self->{'count_context'}}, {'lines' => 0, 'bytes' => 0};
            my ($formatted_prototype) = $self->convert_line($prototype, 
                                                        {'indent_length' => 0});
            pop @{$self->{'count_context'}};
            print STDERR " MULTITABLE_PROTO {$formatted_prototype}\n" 
              if ($self->get_conf('DEBUG'));
            push @$columnsize, 
                 2+Texinfo::Convert::Unicode::string_width($formatted_prototype);
          }
        }
        print STDERR "MULTITABLE_SIZES @$columnsize\n" if ($columnsize 
                                                and $self->get_conf('DEBUG'));
        $self->{'format_context'}->[-1]->{'columns_size'} = $columnsize;
        $self->{'format_context'}->[-1]->{'row_empty_lines_count'} 
          = $self->{'empty_lines_count'};
      } elsif ($root->{'cmdname'} eq 'float') {
        $result .= $self->_add_newline_if_needed();
        if ($root->{'extra'} and $root->{'extra'}->{'normalized'}) {
          $result .= $self->_anchor($root);
        }
      }
    } elsif ($root->{'cmdname'} eq 'node') {
      $self->{'node'} = $root;
      $result .= $self->_node($root);
      $self->{'format_context'}->[-1]->{'paragraph_count'} = 0;
    } elsif ($sectioning_commands{$root->{'cmdname'}}) {
      if ($self->get_conf('setcontentsaftertitlepage') 
           and $root_commands{$root->{'cmdname'}}
           and !$self->{'setcontentsaftertitlepage_done'}) {
        my ($contents, $lines_count) 
                = $self->_contents($self->{'structuring'}->{'sectioning_root'}, 
                                  'contents');
        if ($contents ne '') {
          $contents .= "\n";
          $self->{'empty_lines_count'} = 1;
          $self->_add_text_count($contents);
          $self->_add_lines_count($lines_count+1);
        }
        $self->{'setcontentsaftertitlepage_done'} = 1;
        $result .= $contents;
      } 
      if ($self->get_conf('setshortcontentsaftertitlepage')
            and $root_commands{$root->{'cmdname'}}
            and !$self->{'setshortcontentsaftertitlepage_done'}) {
        my ($contents, $lines_count) 
                = $self->_contents($self->{'structuring'}->{'sectioning_root'}, 
                              'shortcontents');
        if ($contents ne '') {
          $contents .= "\n";
          $self->{'empty_lines_count'} = 1;
          $self->_add_text_count($contents);
          $self->_add_lines_count($lines_count+1);
        }

        $self->{'setshortcontentsaftertitlepage_done'} = 1;
        $result .= $contents;
      }
      # use settitle for empty @top
      # ignore @part
      my $contents;
      if ($root->{'extra'}->{'misc_content'} 
          and @{$root->{'extra'}->{'misc_content'}} 
          and $root->{'cmdname'} ne 'part') {
        $contents = $root->{'extra'}->{'misc_content'};
      } elsif ($root->{'cmdname'} eq 'top'
          and $self->{'extra'}->{'settitle'} 
          and $self->{'extra'}->{'settitle'}->{'extra'}
          and $self->{'extra'}->{'settitle'}->{'extra'}->{'misc_content'}
          and @{$self->{'extra'}->{'settitle'}->{'extra'}->{'misc_content'}}) {
        $contents = $self->{'extra'}->{'settitle'}->{'extra'}->{'misc_content'};
      }
             
      if ($contents) {
        push @{$self->{'count_context'}}, {'lines' => 0, 'bytes' => 0};
        my $heading = $self->convert_line({'type' => 'frenchspacing',
                         'contents' => $contents});
        pop @{$self->{'count_context'}};
        # @* leads to an end of line, underlying appears on the line below
        # over one line
        my $heading_underlined = 
             Texinfo::Convert::Text::heading ($root, $heading, $self,
                                              $self->get_conf('NUMBER_SECTIONS'));
        $result .= $self->_add_newline_if_needed();
        $self->{'empty_lines_count'} = 0 unless ($heading_underlined eq '');
        $self->_add_text_count($heading_underlined);
        $result .= $heading_underlined;
        if ($heading_underlined ne '') {
          $self->_add_lines_count(2);
          $result .= $self->_add_newline_if_needed();
        }
      }
      $self->{'format_context'}->[-1]->{'paragraph_count'} = 0;
    } elsif (($root->{'cmdname'} eq 'item' or $root->{'cmdname'} eq 'itemx')
            and $root->{'args'} and $root->{'args'}->[0] 
            and $root->{'args'}->[0]->{'type'}
            and $root->{'args'}->[0]->{'type'} eq 'misc_line_arg') {
      if ($root->{'extra'} and $root->{'extra'}->{'misc_content'}) {
        my $contents = $root->{'extra'}->{'misc_content'};
        my $table_command = $root->{'parent'}->{'parent'}->{'parent'};
        if ($table_command->{'extra'} and $table_command->{'extra'}->{'command_as_argument'}) {
          my $command_as_argument = $table_command->{'extra'}->{'command_as_argument'};
          if ($command_as_argument->{'type'} ne 'definfoenclose_command') {
            $contents = [{'cmdname' => $command_as_argument->{'cmdname'},
                     'args' => [{'type' => 'brace_command_arg', 
                                'contents' => $contents}],
                     'line_nr' => $root->{'line_nr'},
            }];
          } else {
            $contents = [{'cmdname' => $command_as_argument->{'cmdname'},
                          'type' => $command_as_argument->{'type'},
                          'extra' => $command_as_argument->{'extra'},
                     'args' => [{'type' => 'brace_command_arg', 
                                'contents' => $contents}],
                     'line_nr' => $root->{'line_nr'},
            }];
          }
        }
        $result = $self->convert_line({'type' => 'frenchspacing',
                                     'contents' => $contents},
                    {'indent_level'
                      => $self->{'format_context'}->[-1]->{'indent_level'} -1});
        if ($result ne '') {
          $result = $self->ensure_end_of_line($result);
          $self->{'empty_lines_count'} = 0;
        }
      }
    } elsif ($root->{'cmdname'} eq 'item' and $root->{'parent'}->{'cmdname'}
             and $item_container_commands{$root->{'parent'}->{'cmdname'}}) {
      $self->{'format_context'}->[-1]->{'paragraph_count'} = 0;
      my $line = $self->new_formatter('line', 
          {'indent_length' => 
              ($self->{'format_context'}->[-1]->{'indent_level'} -1)
                * $indent_length
                 + $item_indent_format_length{$root->{'parent'}->{'cmdname'}}});
      push @{$self->{'formatters'}}, $line;
      if ($root->{'parent'}->{'cmdname'} eq 'enumerate') {
        $result = $self->_count_added($line->{'container'},
            $line->{'container'}->add_next(
               Texinfo::Common::enumerate_item_representation(
                 $root->{'parent'}->{'extra'}->{'enumerate_specification'},
                 $root->{'extra'}->{'item_number'}) . '. '));
      } elsif ($root->{'parent'}->{'extra'}->{'block_command_line_contents'}) {
        # this is the text prepended to items.
        
        $result = $self->_convert(
          {'contents' => 
             [@{$root->{'parent'}->{'extra'}->{'block_command_line_contents'}->[0]},
              { 'text' => ' ' }]
          });
      }
      $result .= $self->_count_added($line->{'container'}, 
                                     $line->{'container'}->end());
      print STDERR "  $root->{'parent'}->{'cmdname'}($root->{'extra'}->{'item_number'}) -> |$result|\n" 
         if ($self->get_conf('DEBUG'));
      pop @{$self->{'formatters'}};
      $self->{'text_element_context'}->[-1]->{'counter'} += 
         Texinfo::Convert::Unicode::string_width($result);
      $self->{'empty_lines_count'} = 0 unless ($result eq '');
    # open a multitable cell
    } elsif ($root->{'cmdname'} eq 'headitem' or $root->{'cmdname'} eq 'item'
             or $root->{'cmdname'} eq 'tab') {
      my $cell_width = $self->{'format_context'}->[-1]->{'columns_size'}->[$root->{'extra'}->{'cell_number'}-1];
      $self->{'format_context'}->[-1]->{'item_command'} = $root->{'cmdname'}
        if ($root->{'cmdname'} ne 'tab');
      print STDERR "CELL [$root->{'extra'}->{'cell_number'}]: \@$root->{'cmdname'}. Width: $cell_width\n"
            if ($self->get_conf('DEBUG'));
      die if (!defined($cell_width));
      $self->{'empty_lines_count'} 
         = $self->{'format_context'}->[-1]->{'row_empty_lines_count'};

      push @{$self->{'format_context'}},
           { 'cmdname' => $root->{'cmdname'},
             'paragraph_count' => 0,
             'indent_level' => 0 };
      push @{$self->{'text_element_context'}}, {'max' => $cell_width - 2 };
      push @{$self->{'count_context'}}, {'lines' => 0, 'bytes' => 0,
                                                   'locations' => []};
      $cell = 1;
    } elsif ($root->{'cmdname'} eq 'center') {
      #my ($counts, $new_locations);
      push @{$self->{'count_context'}}, {'lines' => 0, 'bytes' => 0, 
                                                   'locations' => []};
      $result = $self->convert_line (
                       {'type' => 'frenchspacing',
                        'contents' => $root->{'extra'}->{'misc_content'}},
                       {'indent_length' => 0});
      if ($result ne '') {
        $result = $self->ensure_end_of_line($result);

        $result = $self->_align_environment ($result, 
             $self->{'text_element_context'}->[-1]->{'max'}, 'center'); 
        $self->{'empty_lines_count'} = 0;
      }
      $self->{'format_context'}->[-1]->{'paragraph_count'}++;
      return $result;
    } elsif ($root->{'cmdname'} eq 'exdent') {
      if ($self->{'preformatted_context_commands'}->{$self->{'context'}->[-1]}) {
        $result = $self->convert_unfilled({'contents' => $root->{'extra'}->{'misc_content'}},
         {'indent_level'
          => $self->{'format_context'}->[-1]->{'indent_level'} -1});
      } else {
        $result = $self->convert_line ({'contents' => $root->{'extra'}->{'misc_content'}},
         {'indent_level' 
          => $self->{'format_context'}->[-1]->{'indent_level'} -1});
      }
      if ($result ne '') {
        $result = $self->ensure_end_of_line($result);
        $self->{'empty_lines_count'} = 0;
      }
      return $result;
    } elsif ($root->{'cmdname'} eq 'verbatiminclude') {
      my $expansion = $self->Texinfo::Common::expand_verbatiminclude($root);
      unshift @{$self->{'current_contents'}->[-1]}, $expansion
        if ($expansion);
      return '';
    } elsif ($root->{'cmdname'} eq 'insertcopying') {
      if ($self->{'extra'} and $self->{'extra'}->{'copying'}) {
        unshift @{$self->{'current_contents'}->[-1]}, 
           {'contents' => $self->{'extra'}->{'copying'}->{'contents'}};
      }
      return '';
    } elsif ($root->{'cmdname'} eq 'printindex') {
      $result = $self->_printindex($root);
      return $result;
    } elsif ($root->{'cmdname'} eq 'listoffloats') {
      my $lines_count = 0;
      if ($root->{'extra'} and $root->{'extra'}->{'type'}
          and defined($root->{'extra'}->{'type'}->{'normalized'}) 
          and $self->{'floats'} 
          and $self->{'floats'}->{$root->{'extra'}->{'type'}->{'normalized'}}
          and @{$self->{'floats'}->{$root->{'extra'}->{'type'}->{'normalized'}}}) {
        push @{$self->{'count_context'}}, {'lines' => 0, 'bytes' => 0};
        if (!$self->{'empty_lines_count'}) {
          $result .= "\n";
          $lines_count++;
        }
        $result .= "* Menu:\n\n";
        $lines_count += 2;
        foreach my $float (@{$self->{'floats'}->{$root->{'extra'}->{'type'}->{'normalized'}}}) {
          next if (!defined($float->{'extra'}->{'block_command_line_contents'}->[1]));
          my $float_entry;
          if ($root->{'extra'}->{'type'}->{'normalized'} ne '') {
            if (exists ($float->{'number'})) {
              $float_entry = 
               $self->gdt('* {float_type} {float_number}: {float_label}.', 
                {'float_type' => $root->{'extra'}->{'type'}->{'content'},
                 'float_number' => $float->{'number'},
                 'float_label' => $float->{'extra'}->{'block_command_line_contents'}->[1]});
            } else {
              $float_entry = $self->gdt('* {float_type}: {float_label}.', 
                {'float_type' => $root->{'extra'}->{'type'}->{'content'},
                 'float_label' => $float->{'extra'}->{'block_command_line_contents'}->[1]
                 });
            }
          } else {
            if (exists ($float->{'number'})) {
              $float_entry = 
               $self->gdt('*  {float_number}: {float_label}.', 
                {'float_number' => $float->{'number'},
                 'float_label' => $float->{'extra'}->{'block_command_line_contents'}->[1]});
            } else {
              $float_entry = $self->gdt('* : {float_label}.', 
                {'float_label' => $float->{'extra'}->{'block_command_line_contents'}->[1]
                 });
            }
          }
          #print STDERR "$float ".$self->convert_line($float_entry)."\n";
          $float_entry->{'type'} = 'frenchspacing';
          my $float_line = $self->convert_line($float_entry);
          my $line_width 
             = Texinfo::Convert::Unicode::string_width($float_line);
          if ($line_width > $listoffloat_entry_length) {
            $float_line .= "\n" . ' ' x $listoffloat_entry_length;
            $lines_count++;
          } else {
            $float_line .= ' ' x ($listoffloat_entry_length - $line_width);
          }
          $line_width = $listoffloat_entry_length;
          my $caption;
          if ($float->{'extra'}->{'shortcaption'}) {
            $caption = $float->{'extra'}->{'shortcaption'};
          } elsif ($float->{'extra'}->{'caption'}) {
            $caption = $float->{'extra'}->{'caption'};
          }
          if ($caption) {
            $self->{'multiple_pass'} = 1;
            push @{$self->{'context'}}, 'listoffloats';
            my $tree = {'contents' => $caption->{'args'}->[0]->{'contents'}};
            # the following does nothing since there are paragraphs within
            # the shortcaption.
            #if ($caption->{'cmdname'} eq 'shortcaption') {
            #  $tree->{'type'} = 'frenchspacing';
            #}
            my $caption_text = $self->_convert($tree);
            my $old_context = pop @{$self->{'context'}};
            delete $self->{'multiple_pass'};
            die if ($old_context ne 'listoffloats');
            while ($caption_text =~ s/^\s*(\p{Unicode::EastAsianWidth::InFullwidth}\s*|\S+\s*)//) {
              my $new_word = $1;
              $new_word =~ s/\n//g;
              if ((Texinfo::Convert::Unicode::string_width($new_word) +
                   $line_width) > 
                       ($self->{'text_element_context'}->[-1]->{'max'} - 3)) {
                $float_line .= $listoffloat_append;
                last;
              } else {
                $float_line .= $new_word;
                $line_width += 
                  Texinfo::Convert::Unicode::string_width($new_word);
              }
            }
          }
          $result .= $float_line. "\n";
          $lines_count++;
        }
        $result .= "\n";
        $lines_count++;
        $self->{'empty_lines_count'} = 1;
        pop @{$self->{'count_context'}};
      }
      $self->{'format_context'}->[-1]->{'paragraph_count'}++;
      $self->_add_text_count($result);
      $self->_add_lines_count($lines_count);
      return $result;
    } elsif ($root->{'cmdname'} eq 'sp') {
      if ($root->{'extra'}->{'misc_args'}->[0]) {
        # this useless copy avoids perl changing the type to integer!
        my $sp_nr = $root->{'extra'}->{'misc_args'}->[0];
        for (my $i = 0; $i < $sp_nr; $i++) {
          $result .= $self->_count_added($formatter->{'container'},
                $formatter->{'container'}->end_line());
        }
        
        $self->{'empty_lines_count'} += $sp_nr;
        delete $self->{'text_element_context'}->[-1]->{'counter'};
      }
      return $result;
    } elsif ($root->{'cmdname'} eq 'contents') {
      if (!defined($self->get_conf('setcontentsaftertitlepage'))
           and $self->{'structuring'}
           and $self->{'structuring'}->{'sectioning_root'}) {
        my $lines_count;
        ($result, $lines_count) 
            = $self->_contents($self->{'structuring'}->{'sectioning_root'}, 
                              'contents');
        $self->_add_lines_count($lines_count);
        $self->_add_text_count($result);
      }
      return $result;
    } elsif ($root->{'cmdname'} eq 'shortcontents' 
               or $root->{'cmdname'} eq 'summarycontents') {
      if (!defined($self->get_conf('setshortcontentsaftertitlepage'))
            and $self->{'structuring'}
            and $self->{'structuring'}->{'sectioning_root'}) {
        my $lines_count;
        ($result, $lines_count) 
              = $self->_contents($self->{'structuring'}->{'sectioning_root'}, 
                              'shortcontents');
        $self->_add_lines_count($lines_count);
        $self->_add_text_count($result);
      }
      return $result;
    # all the @-commands that have an information for the formatting, like
    # @paragraphindent, @frenchspacing...
    } elsif ($informative_commands{$root->{'cmdname'}}) {
      $self->_informative_command($root);
      return '';
    } else {
      $unknown_command = 1;
    }
    if ($unknown_command and !($root->{'extra'} 
                               and $root->{'extra'}->{'index_entry'})
        # commands like def*x are not processed above, since only the def_line
        # associated is processed. If they have no name and no category they 
        # are not considered as index entries either so they have a specific
        # condition
        and !($def_commands{$root->{'cmdname'}} 
              and $root->{'cmdname'} =~ /x$/)) {
      warn "Unhandled $root->{'cmdname'}\n";
      $result .= "!!!!!!!!! Unhandled $root->{'cmdname'} !!!!!!!!!\n";
    }
  }

  # open 'type' constructs.
  my $paragraph;
  if ($root->{'type'}) {
    if ($root->{'type'} eq 'paragraph') {
      $self->{'empty_lines_count'} = 0;
      my $conf;
      # indent. Not first paragraph.
      if ($self->get_conf('DEBUG')) {
        print STDERR "OPEN PARA ($self->{'format_context'}->[-1]->{'cmdname'}) "
           . "cnt ". 
            (defined($self->{'text_element_context'}->[-1]->{'counter'}) ? 
             $self->{'text_element_context'}->[-1]->{'counter'} : 'UNDEF'). ' '
           . "para cnt $self->{'format_context'}->[-1]->{'paragraph_count'} "
           . "fparaindent ".$self->get_conf('firstparagraphindent')." "
           . "paraindent ".$self->get_conf('paragraphindent')."\n";
      }
      if ($self->{'format_context'}->[-1]->{'cmdname'} eq '_top_format'
          and $self->get_conf('paragraphindent') ne 'asis' 
          and $self->get_conf('paragraphindent')
          and (($root->{'extra'} and $root->{'extra'}->{'indent'})
             or (!($root->{'extra'} and $root->{'extra'}->{'noindent'})
                and ($self->{'format_context'}->[-1]->{'paragraph_count'} 
                  or $self->get_conf('firstparagraphindent') eq 'insert') 
               and !$self->{'text_element_context'}->[-1]->{'counter'}))) {
        $conf->{'first_indent_length'} = $self->get_conf('paragraphindent');
        $conf->{'first_indent_length'} = 0
          if ($conf->{'first_indent_length'} eq 'none');
      }
      $paragraph = $self->new_formatter('paragraph', $conf);
      push @{$self->{'formatters'}}, $paragraph;
      $self->{'format_context'}->[-1]->{'paragraph_count'}++;
      if ($self->{'context'}->[-1] eq 'flushright') {
        push @{$self->{'count_context'}}, {'lines' => 0, 'bytes' => 0,
                                                   'locations' => []};
      }
    } elsif ($root->{'type'} eq 'preformatted'
             or $root->{'type'} eq 'rawpreformatted') {
      # if in a description reuse the main menu unfilled, to keep things
      # simpler and avoid having to do a separate count.
      if ($root->{'type'} eq 'rawpreformatted'
          or !$root->{'parent'}->{'type'}
          or $root->{'parent'}->{'type'} ne 'menu_entry_description') {
        $preformatted = $self->new_formatter('unfilled');
        push @{$self->{'formatters'}}, $preformatted;
        if ($self->{'context'}->[-1] eq 'flushright') {
          push @{$self->{'count_context'}}, {'lines' => 0, 'bytes' => 0,
                                                     'locations' => []};
        }
      }
    } elsif ($root->{'type'} eq 'def_line') {
      if ($root->{'extra'} and $root->{'extra'}->{'def_args'}
             and @{$root->{'extra'}->{'def_args'}}) {
        my $arguments = Texinfo::Common::definition_arguments_content($root);
        my $tree;
        my $command;
        if ($Texinfo::Common::def_aliases{$root->{'extra'}->{'def_command'}}) {
          $command = $Texinfo::Common::def_aliases{$root->{'extra'}->{'def_command'}};
        } else {
          $command = $root->{'extra'}->{'def_command'};
        }
        my $name;
        if ($root->{'extra'}->{'def_parsed_hash'}->{'name'}) {
          $name = $root->{'extra'}->{'def_parsed_hash'}->{'name'};
        } else {
          $name = '';
        }
        
        
        if ($command eq 'deffn'
            or $command eq 'defvr'
            or $command eq 'deftp'
            or (($command eq 'deftypefn'
                 or $command eq 'deftypevr')
                and !$root->{'extra'}->{'def_parsed_hash'}->{'type'})) {
          if ($arguments) {
            $tree = $self->gdt("\@tie{ }-- {category}: {name} {arguments}", {
                    'category' => $root->{'extra'}->{'def_parsed_hash'}->{'category'},
                    'name' => $name,
                    'arguments' => $arguments});
          } else {
            $tree = $self->gdt("\@tie{ }-- {category}: {name}", {
                    'category' => $root->{'extra'}->{'def_parsed_hash'}->{'category'},
                    'name' => $name});
          }
        } elsif ($command eq 'deftypefn'
                 or $command eq 'deftypevr') {
          if ($arguments) {
            my $strings = {
                    'category' => $root->{'extra'}->{'def_parsed_hash'}->{'category'},
                    'name' => $name,
                    'type' => $root->{'extra'}->{'def_parsed_hash'}->{'type'},
                    'arguments' => $arguments};
            if ($self->get_conf('deftypefnnewline') eq 'on') {
              $tree = $self->gdt("\@tie{ }-- {category}:\@*{type}\@*{name} {arguments}",
                                 $strings);
            } else {
              $tree = $self->gdt("\@tie{ }-- {category}: {type} {name} {arguments}",
                                 $strings);
            }
          } else {
            my $strings = {
                    'category' => $root->{'extra'}->{'def_parsed_hash'}->{'category'},
                    'type' => $root->{'extra'}->{'def_parsed_hash'}->{'type'},
                    'name' => $name};
            if ($self->get_conf('deftypefnnewline') eq 'on') {
              $tree = $self->gdt("\@tie{ }-- {category}:\@*{type}\@*{name}",
                                 $strings);
            } else {
              $tree = $self->gdt("\@tie{ }-- {category}: {type} {name}",
                                 $strings);
            }
          }
        } elsif ($command eq 'defcv'
                 or ($command eq 'deftypecv'
                     and !$root->{'extra'}->{'def_parsed_hash'}->{'type'})) {
          if ($arguments) {
            $tree = $self->gdt("\@tie{ }-- {category} of {class}: {name} {arguments}", {
                    'category' => $root->{'extra'}->{'def_parsed_hash'}->{'category'},
                    'name' => $name,
                    'class' => $root->{'extra'}->{'def_parsed_hash'}->{'class'},
                    'arguments' => $arguments});
          } else {
            $tree = $self->gdt("\@tie{ }-- {category} of {class}: {name}", {
                    'category' => $root->{'extra'}->{'def_parsed_hash'}->{'category'},
                    'class' => $root->{'extra'}->{'def_parsed_hash'}->{'class'},
                    'name' => $name});
          }
        } elsif ($command eq 'defop'
                 or ($command eq 'deftypeop'
                     and !$root->{'extra'}->{'def_parsed_hash'}->{'type'})) {
          if ($arguments) {
            $tree = $self->gdt("\@tie{ }-- {category} on {class}: {name} {arguments}", {
                    'category' => $root->{'extra'}->{'def_parsed_hash'}->{'category'},
                    'name' => $name,
                    'class' => $root->{'extra'}->{'def_parsed_hash'}->{'class'},
                    'arguments' => $arguments});
          } else {
            $tree = $self->gdt("\@tie{ }-- {category} on {class}: {name}", {
                    'category' => $root->{'extra'}->{'def_parsed_hash'}->{'category'},
                    'class' => $root->{'extra'}->{'def_parsed_hash'}->{'class'},
                    'name' => $name});
          }
        } elsif ($command eq 'deftypeop') {
          if ($arguments) {
            my $strings = {
                    'category' => $root->{'extra'}->{'def_parsed_hash'}->{'category'},
                    'name' => $name,
                    'class' => $root->{'extra'}->{'def_parsed_hash'}->{'class'},
                    'type' => $root->{'extra'}->{'def_parsed_hash'}->{'type'},
                    'arguments' => $arguments};
            if ($self->get_conf('deftypefnnewline') eq 'on') {
              $tree 
                = $self->gdt("\@tie{ }-- {category} on {class}:\@*{type}\@*{name} {arguments}",
                             $strings);
            } else {
              $tree 
                = $self->gdt("\@tie{ }-- {category} on {class}: {type} {name} {arguments}",
                             $strings);
            }
          } else {
            my $strings = {
                    'category' => $root->{'extra'}->{'def_parsed_hash'}->{'category'},
                    'type' => $root->{'extra'}->{'def_parsed_hash'}->{'type'},
                    'class' => $root->{'extra'}->{'def_parsed_hash'}->{'class'},
                    'name' => $name};
            if ($self->get_conf('deftypefnnewline') eq 'on') {
              $tree 
                = $self->gdt("\@tie{ }-- {category} on {class}:\@*{type}\@*{name}",
                             $strings);
            } else {
              $tree 
                = $self->gdt("\@tie{ }-- {category} on {class}: {type} {name}",
                             $strings);
            }
          }
        } elsif ($command eq 'deftypecv') {
          if ($arguments) {
            my $strings = {
                    'category' => $root->{'extra'}->{'def_parsed_hash'}->{'category'},
                    'name' => $name,
                    'class' => $root->{'extra'}->{'def_parsed_hash'}->{'class'},
                    'type' => $root->{'extra'}->{'def_parsed_hash'}->{'type'},
                    'arguments' => $arguments};
            if ($self->get_conf('deftypefnnewline') eq 'on') {
              $tree 
                = $self->gdt("\@tie{ }-- {category} of {class}:\@*{type}\@*{name} {arguments}",
                             $strings);
            } else {
              $tree 
                = $self->gdt("\@tie{ }-- {category} of {class}: {type} {name} {arguments}",
                             $strings);
            }
          } else {
            my $strings = {
                    'category' => $root->{'extra'}->{'def_parsed_hash'}->{'category'},
                    'type' => $root->{'extra'}->{'def_parsed_hash'}->{'type'},
                    'class' => $root->{'extra'}->{'def_parsed_hash'}->{'class'},
                    'name' => $name};
            if ($self->get_conf('deftypefnnewline') eq 'on') {
              $tree 
                = $self->gdt("\@tie{ }-- {category} of {class}:\@*{type}\@*{name}",
                             $strings);
            } else {
              $tree 
                = $self->gdt("\@tie{ }-- {category} of {class}: {type} {name}",
                             $strings);
            }
          }
        }

        my $def_paragraph = $self->new_formatter('paragraph', 
         { 'indent_length' => ($self->{'format_context'}->[-1]->{'indent_level'} -1) *$indent_length,
           'indent_length_next' => (1+$self->{'format_context'}->[-1]->{'indent_level'})*$indent_length});
        push @{$self->{'formatters'}}, $def_paragraph;

        $result .= $self->_convert({'type' => 'code', 'contents' => [$tree]});
        $result .= $self->_count_added($def_paragraph->{'container'},
                                      $def_paragraph->{'container'}->end());

        pop @{$self->{'formatters'}};
        delete $self->{'text_element_context'}->[-1]->{'counter'};
        $self->{'empty_lines_count'} = 0;
        print STDERR "     --> $result" if ($self->get_conf('DEBUG'));
      }
    } elsif ($root->{'type'} eq 'menu_entry') {
      my $menu_entry_internal_node;
      if ($root->{'extra'} and $root->{'extra'}->{'menu_entry_node'}
          and defined($root->{'extra'}->{'menu_entry_node'}->{'normalized'})
          and !$root->{'extra'}->{'menu_entry_node'}->{'manual_content'}
          and $self->{'labels'}
          and $self->{'labels'}->{$root->{'extra'}->{'menu_entry_node'}->{'normalized'}}) {
        $menu_entry_internal_node 
          = $self->{'labels'}->{$root->{'extra'}->{'menu_entry_node'}->{'normalized'}};
      }
      foreach my $arg (@{$root->{'args'}}) {
        if ($arg->{'type'} eq 'menu_entry_node') {
          if ($menu_entry_internal_node) {
            if ($self->get_conf('DEBUG')) {
              print STDERR "\n  ------------- BEGIN ignored 2 node formatting for error report -------------\n";
            }
            # check that after space collapse the info reader will find the
            # node.  But always expand what the user provided for the 
            # menu entry, to keep the user defined spacing.
            my $saved_error_nrs = $self->{'error_nrs'};
            my $saved_error_errors_warnings = $self->{'errors_warnings'};
            $self->{'errors_warnings'} = [];
            push @{$self->{'count_context'}}, {'lines' => 0, 'bytes' => 0};
            my $internal_node = Texinfo::Common::normalize_top_node_name(
                 $self->convert_line({'type' => 'code',
                 'contents' 
                  => $menu_entry_internal_node->{'extra'}->{'node_content'}}));
            my $menu_node = Texinfo::Common::normalize_top_node_name(
                 $self->convert_line({'type' => 'code',
                 'contents' 
                  => $arg->{'contents'}}));
            $self->{'error_nrs'} = $saved_error_nrs;
            $self->{'errors_warnings'} = $saved_error_errors_warnings;
            # trailing spaces for node in menu are not very predictable.
            # therefore they are ignored, and they are ignored in both
            # case, in case there where protected spaces at the end of a node.
            $internal_node =~ s/\s*$//;
            $menu_node =~ s/\s*$//;
            if ($internal_node ne $menu_node) {
              $self->line_warn(sprintf($self->__("Node expansion `%s' in menu differs from normal node expansion `%s'"), 
                       $menu_node, $internal_node), $root->{'line_nr'});
            }
            pop @{$self->{'count_context'}};
            if ($self->get_conf('DEBUG')) {
              print STDERR "  ------------- END ignored 2 node formatting for error report -------------\n\n";
            }
          }
          $result .= $self->_convert({'type' => 'code',
                                      'contents' => $arg->{'contents'}});
        } else {
          $result .= $self->_convert($arg);
        }
      }
      $result = $self->ensure_end_of_line($result) 
        unless ($root->{'parent'}->{'type'} 
                and $root->{'parent'}->{'type'} eq 'preformatted');
    } elsif ($root->{'type'} eq 'frenchspacing') {
      push @{$formatter->{'frenchspacing_stack'}}, 'on';
      $formatter->{'container'}->set_space_protection(undef,
        undef,undef,1);
    } elsif ($root->{'type'} eq 'code') {
      $formatter->{'code'}++;
      push @{$formatter->{'frenchspacing_stack'}}, 'on';
      $formatter->{'container'}->set_space_protection(undef,
        undef,undef,1);
    } elsif ($root->{'type'} eq 'bracketed') {
      $result .= $self->_count_added($formatter->{'container'}, 
                   $formatter->{'container'}->add_text('{'));
    }
  }

  # The processing of contents is done here.
  if ($root->{'contents'}) {
    my @contents = @{$root->{'contents'}};
    push @{$self->{'current_contents'}}, \@contents;
    push @{$self->{'current_roots'}}, $root;
    while (@contents) {
      my $content = shift @contents;
      my $text = $self->_convert($content);
      $self->{'empty_lines_count'} = 0 
        if ($preformatted and $text =~ /\S/);
      $result .= $text;
    }
    pop @{$self->{'current_contents'}};
    pop @{$self->{'current_roots'}};
  }

  # now closing. First, close types.
  if ($root->{'type'}) {
    if ($root->{'type'} eq 'frenchspacing') {
      pop @{$formatter->{'frenchspacing_stack'}};
      my $frenchspacing = 0;
      $frenchspacing = 1 if ($formatter->{'frenchspacing_stack'}->[-1] eq 'on');
      $formatter->{'container'}->set_space_protection(undef,
        undef, undef, $frenchspacing);
    } elsif ($root->{'type'} eq 'code') {
      $formatter->{'code'}--;
      pop @{$formatter->{'frenchspacing_stack'}};
      my $frenchspacing = 0;
      $frenchspacing = 1 if ($formatter->{'frenchspacing_stack'}->[-1] eq 'on');
      $formatter->{'container'}->set_space_protection(undef,
        undef, undef, $frenchspacing);
    } elsif ($root->{'type'} eq 'bracketed') {
      $result .= $self->_count_added($formatter->{'container'}, 
                                     $formatter->{'container'}->add_text('}'));
    } elsif ($root->{'type'} eq 'row') {
      my @cell_beginnings;
      my @cell_lines;
      my $cell_beginning = 0;
      my $cell_idx = 0;
      my $max_lines = 0;
      my $indent_len = $indent_length 
             * $self->{'format_context'}->[-1]->{'indent_level'};
      foreach my $cell (@{$self->{'format_context'}->[-1]->{'row'}}) {
        $cell_beginnings[$cell_idx] = $cell_beginning;
        my $cell_width = $self->{'format_context'}->[-1]->{'columns_size'}->[$cell_idx];
        $cell_beginning += $cell_width +1;
        $cell_lines[$cell_idx] = [ split /^/, $cell ];
        $max_lines = scalar(@{$cell_lines[$cell_idx]}) 
          if (scalar(@{$cell_lines[$cell_idx]}) > $max_lines);
        $cell_idx++;
      }

      $cell_idx = 0;
      my $cell_updated_locations;
      my @row_locations;
      foreach my $cell_locations (@{$self->{'format_context'}->[-1]->{'row_counts'}}) {
        foreach my $location (@{$cell_locations->{'locations'}}) {
          next unless (defined($location->{'bytes'}) and defined($location->{'lines'}));
          push @{$cell_updated_locations->[$cell_idx]->{$location->{'lines'}}},
                 $location;
          print STDERR "MULTITABLE anchor $location->{'root'}->{'extra'}->{'normalized'}: c $cell_idx, l $location->{'lines'} ($location->{'bytes'})\n"
                if ($self->get_conf('DEBUG'));
          $max_lines = $location->{'lines'}+1 
                            if ($location->{'lines'}+1 > $max_lines);
        }
        push @row_locations, @{$cell_locations->{'locations'}};
        $cell_idx++;
      }

      print STDERR "ROW, max_lines $max_lines, indent_len $indent_len\n" 
         if ($self->get_conf('DEBUG'));
      
      # this is used to keep track of the last cell with content.
      my $max_cell = scalar(@{$self->{'format_context'}->[-1]->{'row'}});
      my $bytes_count = 0;
      my $line;
      for (my $line_idx = 0; $line_idx < $max_lines; $line_idx++) {
        my $line_width = $indent_len;
        $line = '';
        # determine the last cell in the line, to fill spaces in 
        # cells preceding that cell on the line
        my $last_cell = 0;
        for (my $cell_idx = 0; $cell_idx < $max_cell; $cell_idx++) {
          $last_cell = $cell_idx+1 if (defined($cell_lines[$cell_idx]->[$line_idx])
                                       or defined($cell_updated_locations->[$cell_idx]->{$line_idx}));
        }
        print STDERR "  L(last_cell $last_cell): $line_idx\n"
          if ($self->get_conf('DEBUG'));

        for (my $cell_idx = 0; $cell_idx < $last_cell; $cell_idx++) {
          my $cell_text = $cell_lines[$cell_idx]->[$line_idx];
          if (defined($cell_text)) {
            chomp($cell_text);
            if ($line eq '' and $cell_text ne '') {
              $line = ' ' x $indent_len;
              $bytes_count += $self->count_bytes($line);
            }
            print STDERR "  C($cell_idx) `$cell_text'\n" if ($self->get_conf('DEBUG'));
            $line .= $cell_text;
            $bytes_count += $self->count_bytes($cell_text);
            $line_width += Texinfo::Convert::Unicode::string_width($cell_text);
          }
          if (defined($cell_updated_locations->[$cell_idx]->{$line_idx})) {
            foreach my $location (@{$cell_updated_locations->[$cell_idx]->{$line_idx}}) {
              print STDERR "MULTITABLE UPDATE ANCHOR (l $line_idx, c $cell_idx): $location->{'root'}->{'extra'}->{'normalized'}: $location->{'bytes'} -> $bytes_count\n"
                if ($self->get_conf('DEBUG'));
              $location->{'bytes'} = $bytes_count;
            }
          }
          if ($cell_idx+1 < $last_cell) {
            if ($line_width < $indent_len + $cell_beginnings[$cell_idx+1]) {
              if ($line eq '') {
                $line = ' ' x $indent_len;
                $bytes_count += $self->count_bytes($line);
              }
              my $spaces = ' ' x ($indent_len + $cell_beginnings[$cell_idx+1] - $line_width);
              $line_width += Texinfo::Convert::Unicode::string_width($spaces);
              $line .= $spaces;
              $bytes_count += $self->count_bytes($spaces);
            }
          }
        }
        $line .= "\n";
        $bytes_count += $self->count_bytes("\n");
        $result .= $line;
      }
      if ($self->{'format_context'}->[-1]->{'item_command'} eq 'headitem') {
        # at this point cell_beginning is at the beginning of
        # the cell following the end of the table -> full width
        my $line = ' ' x $indent_len . '-' x $cell_beginning . "\n";
        $bytes_count += $self->count_bytes($line);
        $result .= $line;
        $self->{'empty_lines_count'} = 0;
        $max_lines++;
      # there may be empty lines, in that case $line is undef, $max_lines == 0
      } elsif ($max_lines) {
        if ($line eq "\n") {
          $self->{'empty_lines_count'} = 1;
        } else {
          $self->{'empty_lines_count'} = 0;
        }
      }
      $self->_update_locations_counts(\@row_locations);
      push @{$self->{'count_context'}->[-1]->{'locations'}}, @row_locations;
      $self->{'count_context'}->[-1]->{'bytes'} += $bytes_count;
      $self->{'count_context'}->[-1]->{'lines'} += $max_lines;
      $self->{'format_context'}->[-1]->{'row'} = [];
      $self->{'format_context'}->[-1]->{'row_counts'} = [];
      $self->{'format_context'}->[-1]->{'row_empty_lines_count'} 
        = $self->{'empty_lines_count'};
    }
  }
  # close paragraphs and preformatted
  if ($paragraph) {
    $result .= $self->_count_added($paragraph->{'container'},
                                   $paragraph->{'container'}->end());
    if ($self->{'context'}->[-1] eq 'flushright') {
      $result = $self->_align_environment ($result, 
        $self->{'text_element_context'}->[-1]->{'max'}, 'right');
    }
    pop @{$self->{'formatters'}};
    delete $self->{'text_element_context'}->[-1]->{'counter'};
  } elsif ($preformatted) {
    $result .= $self->_count_added($preformatted->{'container'},
                                   $preformatted->{'container'}->end());
    if ($result ne '') {
      $result = $self->ensure_end_of_line($result);
    }
    if ($self->{'context'}->[-1] eq 'flushright') {
      $result = $self->_align_environment ($result, 
        $self->{'text_element_context'}->[-1]->{'max'}, 'right');
    }
    pop @{$self->{'formatters'}};
    # We assume that, upon closing the preformatted we are at the 
    # beginning of a line.
    delete $self->{'text_element_context'}->[-1]->{'counter'};
  }

  # close commands
  if ($root->{'cmdname'}) {
    if ($root->{'cmdname'} eq 'float') {
      if ($self->get_conf('DEBUG')) {
        my $type_texi = '';
        $type_texi = Texinfo::Convert::Texinfo::convert({'contents' => $root->{'extra'}->{'type'}->{'content'}})
          if ($root->{'extra'} and $root->{'extra'}->{'type'}->{'normalized'} ne '');
        my $number = '';
        $number = $root->{'number'} if (defined($root->{'number'}));
        print STDERR "FLOAT: ($number) ($type_texi)\n";
      }

      if ($root->{'extra'}
          and ($root->{'extra'}->{'type'}->{'normalized'} ne '' 
               or defined($root->{'number'})
               or $root->{'extra'}->{'caption'} or $root->{'extra'}->{'shortcaption'})) {
        
        $result .= $self->_add_newline_if_needed();
        my ($caption, $prepended) = Texinfo::Common::float_name_caption($self,
                                                                        $root);
        if ($prepended) {
          #print STDERR "PREPENDED ".Data::Dumper->Dump([$prepended]);
          $prepended->{'type'} = 'frenchspacing';
          my $float_number = $self->convert_line ($prepended);
          $result .= $float_number;
          $self->{'text_element_context'}->[-1]->{'counter'} += 
            Texinfo::Convert::Unicode::string_width($float_number);
          $self->{'empty_lines_count'} = 0;
        }
        if ($caption) {
          $self->{'format_context'}->[-1]->{'paragraph_count'} = 0;
          my $tree = $caption->{'args'}->[0];
          $result .= $self->_convert($tree);
        }
      }
    } elsif ($root->{'cmdname'} eq 'quotation' and $root->{'extra'} 
             and $root->{'extra'}->{'authors'}) {
      foreach my $author (@{$root->{'extra'}->{'authors'}}) {
        $result .= $self->_convert(
                 $self->gdt("\@center --- \@emph{{author}}\n",
                    {'author' => $author->{'extra'}->{'misc_content'}}));
      }
    }

  
    # close the contexts and register the cells
    if ($self->{'preformatted_context_commands'}->{$root->{'cmdname'}}
        or $root->{'cmdname'} eq 'float') {
      my $old_context = pop @{$self->{'context'}};
      die "Not a preformatted context: $old_context"
        if (!$self->{'preformatted_context_commands'}->{$old_context}
            and $old_context ne 'float');
      delete ($self->{'preformatted_context_commands'}->{$root->{'cmdname'}})
       unless ($default_preformatted_context_commands{$root->{'cmdname'}});
    } elsif ($flush_commands{$root->{'cmdname'}}) {
      my $old_context = pop @{$self->{'context'}};
      die if (! $flush_commands{$old_context});
    }

    if ($self->{'format_context_commands'}->{$root->{'cmdname'}}) {
      pop @{$self->{'format_context'}};
      delete ($self->{'format_context_commands'}->{$root->{'cmdname'}})
       unless ($default_format_context_commands{$root->{'cmdname'}});
    } elsif ($cell) {
      pop @{$self->{'format_context'}};
      pop @{$self->{'text_element_context'}};
      push @{$self->{'format_context'}->[-1]->{'row'}}, $result;
      my $cell_counts = pop @{$self->{'count_context'}};
      push @{$self->{'format_context'}->[-1]->{'row_counts'}}, $cell_counts;
      $result = '';
    }
    if ($advance_paragraph_count_commands{$root->{'cmdname'}}) {
      $self->{'format_context'}->[-1]->{'paragraph_count'}++;
    }
  }

  return $result;
}

1;

__END__
# Automatically generated from maintain/template.pod

=head1 NAME

Texinfo::Convert::Plaintext - Convert Texinfo tree to Plaintext

=head1 SYNOPSIS

  my $converter 
    = Texinfo::Convert::Plaintext->converter({'parser' => $parser});

  $converter->output($tree);

=head1 DESCRIPTION

Texinfo::Convert::Plaintext converts a Texinfo tree to Plaintext.

=head1 METHODS

=over

=item $converter = Texinfo::Convert::Plaintext->converter($options)

Initialize an Plaintext converter.  

The I<$options> hash reference holds options for the converter.  In
this option hash reference a parser object may be associated with the 
I<parser> key.  The other options should be configuration options
described in the Texinfo manual.  Those options, when appropriate,
override the document content.

See L<Texinfo::Convert::Converter> for more informations.

=item $converter->output($tree)

Convert a Texinfo tree I<$tree> and output the result in files as
described in the Texinfo manual.

=item $result = $converter->convert($tree)

Convert a Texinfo tree I<$tree> or tree portion and return 
the resulting output.

=item $result = $converter->convert_tree($tree)

Convert a Texinfo tree portion I<$tree> and return the resulting 
output.  This function do not try to output a full document but only
portions of document.  For a full document use C<convert>.

=item $result = $converter->output_internal_links()

Returns text representing the links in the document.  At present the format 
should follow the C<--internal-links> option of texi2any/makeinfo specification
and this is only relevant for HTML.

=back

=head1 AUTHOR

Patrice Dumas, E<lt>pertusus@free.frE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2011 Free Software Foundation, Inc.

This library is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3 of the License, or (at 
your option) any later version.

=cut
