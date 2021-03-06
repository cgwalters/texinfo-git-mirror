use strict;

require 't/test_utils.pl';

my @test_cases = (
['no_nodes',
'Text.'],
['no_top_node',
'@node node Top not Top node
'],
['paragraphindent_and_preamble',
'@copying
In copying.

Copying second para.
@end copying

@node Top
@top test @@paragraphindent effect in preamble

First para.

Before paragraphindent.

@paragraphindent 1

After paragraphindent.

@bye

'],
['paragraphindent_asis_first',
'
     bbb

@paragraphindent asis
     ccc
'],
['paragraphindent_none_first',
'
      first

      second

@paragraphindent none

      after none
'],
['space_at_menu_end',
'@node Top

@menu
* (out)::

@end menu

A para.
'],
['text_before_node',
'@node Top
@top top

@menu
* chapter node::
@end menu

text.
@node chapter node
@chapter chapter'
],
['footnote_no_number',
'@node Top

Para@footnote{Footnote 1.}.

Para2@footnote{Footnote 2.}.
',{} , {'NUMBER_FOOTNOTES' => 0}],
['footnote_no_number_separate',
'@node Top

Para@footnote{Footnote 1.}.

Para2@footnote{Footnote 2.}.
',{} , {'NUMBER_FOOTNOTES' => 0, 'footnotestyle' => 'separate'}],
['ref_tests',
'
@node Top

@ref{(m)in ref followed by comma}, 
@ref{(m)in ref not followed by comma} after ref.
@code{@ref{(m)in ref followed by end command}}.


@ref{(m)in ref followed by comma, name},
@ref{(m)in ref not followed by comma, name} after ref.
@code{@ref{(m)in ref followed by end command, name}}.
@ref{(m)in ref ending with a dot., name} after ref.

'],
['xref_test',
'
@node Top

@xref{(m)in xref}. @xref{(m)bad xref} after xref.
@code{@xref{(m)bad nested xref}}.
@xref{(m)in ref ending with a dot., name} ! after xref and dot inside.
@xref{(m)in ref followed by symbol}# g.
'],
['pxref_test',
'@node Top

Hey (@pxref{(m) in pxref}) and continue (@pxref{(m) in pxref, name}) and end.
@pxref{(m) n}. @pxref{(m) n, name}.
'],
['contents_setcontentsaftertitlepage_before_node',
'
@contents
@setcontentsaftertitlepage

@node Top
@top Double contents
'],
['anchor_in_command',
'@node Top

@strong{aaa @TeX{} @emph{in emph} after 
@c emph @emph{emph2 @anchor{anchor in emph} }}.
emph @emph{emph2 @anchor{anchor in emph}}}.
'],
['anchor_and_spaces',
'@node Top
@top Element
@anchor{anchor 0}

Now @anchor{anchor1}.

No space@anchor{anchor2}.
'],
['before_node_and_section',
'Garbage
ref to Top @ref{Top}.
@cindex index entry before anything 
Hey@footnote{a footnote}.
An anchor @anchor{anchor1}.

@menu
* node1::
@end menu

@node Top
@top top @@top section
Node top

ref to anchor1@footnote{another footnote}, which is before @@node Top: @ref{anchor1}.
@menu
* node1::
@end menu

@node node1
@chapter node1 chapter

@printindex cp

'],
['image_quotes', 
'@node Top

@image{f--ile,,,alt""\\}
'],
['image_in_paragraph',
'@node Top

Para.
@image{f--ile,,,alt""\\}. End para.
'],
['image_not_found',
'@node Top
@image{n_f_image}
'],
['image_file_search',
'@node Top

@c does not work in the standalone perl module
@c @image{tp/t/include_dir/f--ile}

@@image dot.
@image{./tp/t/include_dir/f--ile}

@@image dot parent.
@image{../include_dir/f--ile}
',{'include_directories' => ['.', '..', 't/include_dir']}],
['image_extension',
'@node Top

@image{fext,,,,ext}
@image{fdotext,,,,ext}
@image{f--ile,,,,ext}
'],
['image_text_encoded',
'@documentencoding utf-8

@image{image_encoded}
'],
['image_formatting',
'@node Top

@code{@@image@{f--ile@}} @image{f--ile}
@code{@@image@{f--ile,l--i@}} @image{f--ile,l--i}
@code{@@image@{f--ile,,l--e@}} @image{f--ile,,l--e}
@code{@@image@{f--ile,,,alt@}} @image{f--ile,,,alt}
@code{@@image@{f--ile,,,,e-d-xt@}} @image{f--ile,,,,e--xt}
@code{@@image@{f--ile,aze,az,alt,e--xt@}} @image{f--ile,aze,az,alt,e--xt}
@code{@@image@{f-ile,aze,,a--lt@}} @image{f-ile,aze,,a--lt}
@code{@@image@{@@file@{f--ile@}@@@@@@.,aze,az,alt,@@file@{file ext@} e--xt@@@}} @image{@file{f--ile}@@@.,aze,az,alt,@file{file ext} e--xt@}}
@image{image} @image{image}

@example
@code{@@image@{f--ile@}} @image{f--ile}
@code{@@image@{f--ile,l--i@}} @image{f--ile,l--i}
@code{@@image@{f--ile,,l--e@}} @image{f--ile,,l--e}
@code{@@image@{f--ile,,,alt@}} @image{f--ile,,,alt}
@code{@@image@{f--ile,,,,e-d-xt@}} @image{f--ile,,,,e--xt}
@code{@@image@{f--ile,aze,az,alt,e--xt@}} @image{f--ile,aze,az,alt,e--xt}
@code{@@image@{f-ile,aze,,a--lt@}} @image{f-ile,aze,,a--lt}
@code{@@image@{@@file@{f--ile@}@@@@@@.,aze,az,alt,@@file@{file ext@} e--xt@@@}} @image{@file{f--ile}@@@.,aze,az,alt,@file{file ext} e--xt@}}
@image{image} @image{image}
@end example

@image{f--ile,,,a very long alt argument that could span more than one line who knows}

in para
@image{f--ile,,,a very long alt argument that could span more than one line who knows}.
'],
['image_and_spaces_formatting',
'@node Top

@image{words} @image{words} @image{words} @image{words} @image{words} @image{words} @image{words}

Some text @image{words} @image{words} @image{words} @image{words} @image{words} @image{words} @image{words}.

Some text @image{words} text aaaaaaaaa @image{words} text bbbbbbbbbbb @image{words} text ccccccccccccc @image{words} text ddddddddddddd @image{words} text eeeeeeeeeeeeeee @image{words} text fffffffffff @image{words}.

AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA @image{words}

AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBBBBBBB @image{words}

Text. @image{words}       @image{words}.

'],
['image_and_punctuation',
'@node Top

One space. @image{f--ile}.

Two spaces.  @image{f--ile}.

End line.
@image{f--ile}.

One space. @image{words}.

Two spaces.  @image{words}.

End line.
@image{words}.
'],
[ 'multitable_anchor_and_index_entry',
'@node Top

@multitable @columnfractions 0.4 0.6
@headitem mu--ltitable headitem @tab another tab
@item mu--ltitable item @tab multitable tab
@c comment in multitable
@item mu--ltitable item 2 @tab multitable tab 2
@cindex index entry within multitable
@anchor{anchor in multitable}
@item lone mu--ltitable item
@end multitable

@multitable {A} {B}
@item A
B

C
@tab G
@item lsfd mlkdsf lk s
mlsdmjlfdsjm mdsfk 
@cindex index entry
@item lsfd2 mlkdsf2 lk2 s2
mlsdmjlfdsjm mdsfk2
@tab ATTTTTTTTTTTTTTTTTTTTT
BTTTTTTt @anchor{mark}

CTTTTTT

@end multitable

@printindex cp
@ref{mark}
@ref{anchor in multitable}
'],
['note_in_strong',
'@node Top

One @strong{Note}.

3 @strong{Note a}.



2 @strong{note}.

4 @strong{note b}.

6 @strong{ note}.
'],
['nested_multitable_anchor_index',
'@node Top

@multitable {truc AAAA   machin}    {bidule}
@item
@multitable {AAAA} {machin}
@item AAAA @tab machin @anchor{mark inside}
@cindex index entry inside
@end multitable
 @tab bidule
@item other item @tab in tab @anchor{mark}
@cindex index entry
@end multitable

@printindex cp

@xref{mark}.
@xref{mark inside}.
'],
['def_in_copying',
'@macro mymacro
@deffn aa bb cc
@deffnx aax bbx ccx
deffnx lines
@end deffn
@end macro

@node Top
@top Test for definition commands

@copying
In copying
@mymacro{}
@end copying

In text
@mymacro{}

@printindex fn
'],
['file_only_png',
'@node Top

Just before an image @image{this_is_a_long_unknown_file} text after the image, and more text, and more @image{this_is_a_long_unknown_file} text.
'],
['error_in_footnote',
'
@node Top

@float Text, label

Float text1

@caption{Caption. @TeX. 
In caption @strong{note}.  
Now footnote@footnote{@LaTeX. 
and strong @strong{Note}.}}
@end float

@listoffloats Text

@listoffloats Text
'],
['nested_footnotes_separate',
'@footnotestyle separate
@node Top

F@footnote{F1

V@footnote{F2}
}
'],
['encoding_us_ascii',
'
@documentencoding US-ASCII

@node Top

'],
['known_encoding',
'
@documentencoding latin1

@node Top

'],
['unknown_encoding',
'
@documentencoding ggg

@node Top

'],
['top_node_normalization',
'@node ToP

@xref{TOP}. @xref{tOP}.

@menu
* tOP::
@end menu
'],
# since there is no split in the test suite, there is no split tested
# here, in fact.
['split_no_copying',
'\input texinfo
@setfilename split-nocopying.info

@node Top
@top Top

This is the top node.

@menu
* Ch1::
@end menu

@node Ch1
@chapter Ch1

First chapter.

@bye

',{},{'SPLIT_SIZE' => 10}],
['no_node_but_top',
'@top top
'],
['space_in_setfilename',
'@setfilename @ @verb{: name :}@ 

@node Top
'],
['novalidate_empty_refs',
'
@novalidate

@node Top

@xref{@:}.
@xref{@asis{ }}.

@node @
@node @:
@node @asis{ }
'],
['only_documentencoding',
'@documentencoding ISO-8859-1'],
['direntry_dircategory_and_commands',
'@dircategory ``category---@var{th  ere}?\'\'
@direntry
* foo: (foo).   ``hello---@var{there}?\'\'
@end direntry

@dircategory cat2
@direntry
* aaa ::               aaaa
                   bbbbb

menutitle
@end direntry


@node Top
@top Test dircategory and direntry

Text
'],
['colon_in_index_entry',
'@node Top

@synindex vr cp

@cindex a:b

@vtable @emph
@item %main::value
@end vtable

@defvr {a:b} {c:d} e f
@defvrx {x:y} {z:t} n m o
@end defvr

@printindex cp
'],
);

foreach my $test (@test_cases) {
  push @{$test->[2]->{'test_formats'}}, 'info';
}

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('info_tests', [@test_cases], $arg_test_case,
   $arg_generate, $arg_debug);

1;

