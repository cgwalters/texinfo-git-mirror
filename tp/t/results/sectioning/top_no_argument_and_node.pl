use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'top_no_argument_and_node'} = {
  'contents' => [
    {
      'contents' => [],
      'parent' => {},
      'type' => 'text_root'
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'extra' => {
                'command' => {}
              },
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'start'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'spaces_at_end'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'node',
      'contents' => [],
      'extra' => {
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [],
            'normalized' => 'start'
          }
        ],
        'normalized' => 'start'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 1,
        'macro' => ''
      },
      'parent' => {}
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'extra' => {
                'command' => {}
              },
              'parent' => {},
              'text' => '
',
              'type' => 'empty_line_after_command'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'top',
      'contents' => [],
      'extra' => {
        'misc_content' => []
      },
      'level' => 0,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 2,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'top_no_argument_and_node'}{'contents'}[0]{'parent'} = $result_trees{'top_no_argument_and_node'};
$result_trees{'top_no_argument_and_node'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'top_no_argument_and_node'}{'contents'}[1];
$result_trees{'top_no_argument_and_node'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'top_no_argument_and_node'}{'contents'}[1]{'args'}[0];
$result_trees{'top_no_argument_and_node'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'top_no_argument_and_node'}{'contents'}[1]{'args'}[0];
$result_trees{'top_no_argument_and_node'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'top_no_argument_and_node'}{'contents'}[1]{'args'}[0];
$result_trees{'top_no_argument_and_node'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'top_no_argument_and_node'}{'contents'}[1];
$result_trees{'top_no_argument_and_node'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'top_no_argument_and_node'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'top_no_argument_and_node'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'top_no_argument_and_node'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'top_no_argument_and_node'}{'contents'}[1]{'parent'} = $result_trees{'top_no_argument_and_node'};
$result_trees{'top_no_argument_and_node'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'top_no_argument_and_node'}{'contents'}[2];
$result_trees{'top_no_argument_and_node'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'top_no_argument_and_node'}{'contents'}[2]{'args'}[0];
$result_trees{'top_no_argument_and_node'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'top_no_argument_and_node'}{'contents'}[2];
$result_trees{'top_no_argument_and_node'}{'contents'}[2]{'parent'} = $result_trees{'top_no_argument_and_node'};

$result_texis{'top_no_argument_and_node'} = '@node start
@top
';


$result_texts{'top_no_argument_and_node'} = '';

$result_sectioning{'top_no_argument_and_node'} = {
  'level' => -1,
  'section_childs' => [
    {
      'cmdname' => 'top',
      'extra' => {
        'associated_node' => {
          'cmdname' => 'node',
          'extra' => {
            'normalized' => 'start'
          }
        }
      },
      'level' => 0,
      'section_up' => {}
    }
  ]
};
$result_sectioning{'top_no_argument_and_node'}{'section_childs'}[0]{'section_up'} = $result_sectioning{'top_no_argument_and_node'};

$result_nodes{'top_no_argument_and_node'} = {
  'cmdname' => 'node',
  'extra' => {
    'associated_section' => {
      'cmdname' => 'top',
      'extra' => {},
      'level' => 0
    },
    'normalized' => 'start'
  }
};

$result_menus{'top_no_argument_and_node'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'start'
  }
};

$result_errors{'top_no_argument_and_node'} = [];



$result_converted{'info'}->{'top_no_argument_and_node'} = 'This is , produced by tp version from .


File: ,  Node: start



Tag Table:
Node: start41

End Tag Table
';

$result_converted_errors{'info'}->{'top_no_argument_and_node'} = [
  {
    'error_line' => 'warning: Document without Top node.
',
    'text' => 'Document without Top node.',
    'type' => 'warning'
  }
];



$result_converted{'html'}->{'top_no_argument_and_node'} = '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- Created by texinfo, http://www.gnu.org/software/texinfo/ -->
<head>
<title>Untitled Document</title>

<meta name="description" content="Untitled Document">
<meta name="keywords" content="Untitled Document">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="Generator" content="tp">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="#start" rel="start" title="start">
<style type="text/css">
<!--
a.summary-letter {text-decoration: none}
blockquote.smallquotation {font-size: smaller}
div.display {margin-left: 3.2em}
div.example {margin-left: 3.2em}
div.lisp {margin-left: 3.2em}
div.smalldisplay {margin-left: 3.2em}
div.smallexample {margin-left: 3.2em}
div.smalllisp {margin-left: 3.2em}
pre.display {font-family: serif}
pre.format {font-family: serif}
pre.menu-comment {font-family: serif}
pre.menu-preformatted {font-family: serif}
pre.smalldisplay {font-family: serif; font-size: smaller}
pre.smallexample {font-size: smaller}
pre.smallformat {font-family: serif; font-size: smaller}
pre.smalllisp {font-size: smaller}
span.nocodebreak {white-space:pre}
span.nolinebreak {white-space:pre}
span.roman {font-family:serif; font-weight:normal}
span.sansserif {font-family:sans-serif; font-weight:normal}
ul.no-bullet {list-style: none}
-->
</style>


</head>

<body lang="en" bgcolor="#FFFFFF" text="#000000" link="#0000FF" vlink="#800080" alink="#FF0000">
<a name="start"></a>
<a name="SEC_Top"></a>
<hr>
<p>


</p>
</body>
</html>
';

$result_converted_errors{'html'}->{'top_no_argument_and_node'} = [
  {
    'error_line' => 'warning: Must specify a title with a title command or @top
',
    'text' => 'Must specify a title with a title command or @top',
    'type' => 'warning'
  }
];


1;
