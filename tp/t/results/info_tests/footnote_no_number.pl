use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'footnote_no_number'} = {
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
              'text' => 'Top'
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
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'Para'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'Footnote 1.'
                        }
                      ],
                      'parent' => {},
                      'type' => 'paragraph'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_context'
                }
              ],
              'cmdname' => 'footnote',
              'contents' => [],
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 3,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '.
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'Para2'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'Footnote 2.'
                        }
                      ],
                      'parent' => {},
                      'type' => 'paragraph'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_context'
                }
              ],
              'cmdname' => 'footnote',
              'contents' => [],
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 5,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '.
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
      'extra' => {
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [],
            'normalized' => 'Top'
          }
        ],
        'normalized' => 'Top'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 1,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'footnote_no_number'}{'contents'}[0]{'parent'} = $result_trees{'footnote_no_number'};
$result_trees{'footnote_no_number'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'footnote_no_number'}{'contents'}[1];
$result_trees{'footnote_no_number'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'footnote_no_number'}{'contents'}[1]{'args'}[0];
$result_trees{'footnote_no_number'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'footnote_no_number'}{'contents'}[1]{'args'}[0];
$result_trees{'footnote_no_number'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'footnote_no_number'}{'contents'}[1]{'args'}[0];
$result_trees{'footnote_no_number'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'footnote_no_number'}{'contents'}[1];
$result_trees{'footnote_no_number'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'footnote_no_number'}{'contents'}[1];
$result_trees{'footnote_no_number'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'footnote_no_number'}{'contents'}[1]{'contents'}[1];
$result_trees{'footnote_no_number'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'footnote_no_number'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'footnote_no_number'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'footnote_no_number'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'footnote_no_number'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'footnote_no_number'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'footnote_no_number'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'footnote_no_number'}{'contents'}[1]{'contents'}[1];
$result_trees{'footnote_no_number'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'footnote_no_number'}{'contents'}[1]{'contents'}[1];
$result_trees{'footnote_no_number'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'footnote_no_number'}{'contents'}[1];
$result_trees{'footnote_no_number'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'footnote_no_number'}{'contents'}[1];
$result_trees{'footnote_no_number'}{'contents'}[1]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'footnote_no_number'}{'contents'}[1]{'contents'}[3];
$result_trees{'footnote_no_number'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'footnote_no_number'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'footnote_no_number'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'footnote_no_number'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'args'}[0];
$result_trees{'footnote_no_number'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'footnote_no_number'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'footnote_no_number'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'footnote_no_number'}{'contents'}[1]{'contents'}[3];
$result_trees{'footnote_no_number'}{'contents'}[1]{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'footnote_no_number'}{'contents'}[1]{'contents'}[3];
$result_trees{'footnote_no_number'}{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'footnote_no_number'}{'contents'}[1];
$result_trees{'footnote_no_number'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'footnote_no_number'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'footnote_no_number'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'footnote_no_number'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'footnote_no_number'}{'contents'}[1]{'parent'} = $result_trees{'footnote_no_number'};

$result_texis{'footnote_no_number'} = '@node Top

Para@footnote{Footnote 1.}.

Para2@footnote{Footnote 2.}.
';


$result_texts{'footnote_no_number'} = '
Para.

Para2.
';

$result_sectioning{'footnote_no_number'} = {};

$result_nodes{'footnote_no_number'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'node_up' => {
    'extra' => {
      'manual_content' => [
        {
          'text' => 'dir'
        }
      ],
      'top_node_up' => {}
    },
    'type' => 'top_node_up'
  }
};
$result_nodes{'footnote_no_number'}{'node_up'}{'extra'}{'top_node_up'} = $result_nodes{'footnote_no_number'};

$result_menus{'footnote_no_number'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  }
};

$result_errors{'footnote_no_number'} = [];



$result_converted{'info'}->{'footnote_no_number'} = 'This is , produced by tp version from .


File: ,  Node: Top,  Up: (dir)

Para(*).

   Para2(*).

   ---------- Footnotes ----------

   (*) Footnote 1.

   (*) Footnote 2.



Tag Table:
Node: Top41
Ref: Top-Footnote-1135
Ref: Top-Footnote-2155

End Tag Table
';

1;
