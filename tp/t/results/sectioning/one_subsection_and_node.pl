use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'one_subsection_and_node'} = {
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
              'text' => 'one node'
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
            'normalized' => 'one-node'
          }
        ],
        'normalized' => 'one-node'
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
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'The subsection'
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
      'cmdname' => 'subsection',
      'contents' => [],
      'extra' => {
        'misc_content' => [
          {}
        ]
      },
      'level' => 3,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 2,
        'macro' => ''
      },
      'number' => 1,
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'one_subsection_and_node'}{'contents'}[0]{'parent'} = $result_trees{'one_subsection_and_node'};
$result_trees{'one_subsection_and_node'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'one_subsection_and_node'}{'contents'}[1];
$result_trees{'one_subsection_and_node'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'one_subsection_and_node'}{'contents'}[1]{'args'}[0];
$result_trees{'one_subsection_and_node'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'one_subsection_and_node'}{'contents'}[1]{'args'}[0];
$result_trees{'one_subsection_and_node'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'one_subsection_and_node'}{'contents'}[1]{'args'}[0];
$result_trees{'one_subsection_and_node'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'one_subsection_and_node'}{'contents'}[1];
$result_trees{'one_subsection_and_node'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'one_subsection_and_node'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'one_subsection_and_node'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'one_subsection_and_node'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'one_subsection_and_node'}{'contents'}[1]{'parent'} = $result_trees{'one_subsection_and_node'};
$result_trees{'one_subsection_and_node'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'one_subsection_and_node'}{'contents'}[2];
$result_trees{'one_subsection_and_node'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'one_subsection_and_node'}{'contents'}[2]{'args'}[0];
$result_trees{'one_subsection_and_node'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'one_subsection_and_node'}{'contents'}[2]{'args'}[0];
$result_trees{'one_subsection_and_node'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'one_subsection_and_node'}{'contents'}[2]{'args'}[0];
$result_trees{'one_subsection_and_node'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'one_subsection_and_node'}{'contents'}[2];
$result_trees{'one_subsection_and_node'}{'contents'}[2]{'extra'}{'misc_content'}[0] = $result_trees{'one_subsection_and_node'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'one_subsection_and_node'}{'contents'}[2]{'parent'} = $result_trees{'one_subsection_and_node'};

$result_texis{'one_subsection_and_node'} = '@node one node
@subsection The subsection
';


$result_texts{'one_subsection_and_node'} = '1 The subsection
----------------
';

$result_sectioning{'one_subsection_and_node'} = {
  'level' => 2,
  'section_childs' => [
    {
      'cmdname' => 'subsection',
      'extra' => {
        'associated_node' => {
          'cmdname' => 'node',
          'extra' => {
            'normalized' => 'one-node'
          }
        }
      },
      'level' => 3,
      'number' => 1,
      'section_up' => {}
    }
  ]
};
$result_sectioning{'one_subsection_and_node'}{'section_childs'}[0]{'section_up'} = $result_sectioning{'one_subsection_and_node'};

$result_nodes{'one_subsection_and_node'} = {
  'cmdname' => 'node',
  'extra' => {
    'associated_section' => {
      'cmdname' => 'subsection',
      'extra' => {},
      'level' => 3,
      'number' => 1
    },
    'normalized' => 'one-node'
  }
};

$result_menus{'one_subsection_and_node'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'one-node'
  }
};

$result_errors{'one_subsection_and_node'} = [];



$result_converted{'info'}->{'one_subsection_and_node'} = 'This is , produced by tp version from .


File: ,  Node: one node

1 The subsection
----------------



Tag Table:
Node: one node41

End Tag Table
';

$result_converted_errors{'info'}->{'one_subsection_and_node'} = [
  {
    'error_line' => 'warning: Document without Top node.
',
    'text' => 'Document without Top node.',
    'type' => 'warning'
  }
];



$result_converted{'html'}->{'one_subsection_and_node'} = '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<link href="#one-node" rel="start" title="one node">
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
<a name="one-node"></a>
<a name="The-subsection"></a>
<h4 class="subsection">1 The subsection</h4>
<hr>
<p>


</p>
</body>
</html>
';

$result_converted_errors{'html'}->{'one_subsection_and_node'} = [
  {
    'error_line' => 'warning: Must specify a title with a title command or @top
',
    'text' => 'Must specify a title with a title command or @top',
    'type' => 'warning'
  }
];


1;
