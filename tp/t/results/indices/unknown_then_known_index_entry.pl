use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'unknown_then_known_index_entry'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => ' someindex entry.
'
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
                  'text' => 'some'
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
          'cmdname' => 'defindex',
          'extra' => {
            'misc_args' => [
              'some'
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 2,
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
                  'text' => 'someindex entry.'
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
          'cmdname' => 'someindex',
          'extra' => {
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'content_normalized' => [],
              'in_code' => 0,
              'index_at_command' => 'someindex',
              'index_name' => 'some',
              'index_prefix' => 'some',
              'index_type_command' => 'someindex',
              'key' => 'someindex entry.',
              'number' => 1
            },
            'misc_content' => []
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 3,
            'macro' => ''
          },
          'parent' => {},
          'type' => 'index_entry_command'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'unknown_then_known_index_entry'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'unknown_then_known_index_entry'}{'contents'}[0];
$result_trees{'unknown_then_known_index_entry'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'unknown_then_known_index_entry'}{'contents'}[0]{'contents'}[1];
$result_trees{'unknown_then_known_index_entry'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'unknown_then_known_index_entry'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'unknown_then_known_index_entry'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'unknown_then_known_index_entry'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'unknown_then_known_index_entry'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'unknown_then_known_index_entry'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'unknown_then_known_index_entry'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'unknown_then_known_index_entry'}{'contents'}[0]{'contents'}[1];
$result_trees{'unknown_then_known_index_entry'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'unknown_then_known_index_entry'}{'contents'}[0];
$result_trees{'unknown_then_known_index_entry'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'unknown_then_known_index_entry'}{'contents'}[0]{'contents'}[2];
$result_trees{'unknown_then_known_index_entry'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'unknown_then_known_index_entry'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'unknown_then_known_index_entry'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'unknown_then_known_index_entry'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'unknown_then_known_index_entry'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'unknown_then_known_index_entry'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'unknown_then_known_index_entry'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'unknown_then_known_index_entry'}{'contents'}[0]{'contents'}[2];
$result_trees{'unknown_then_known_index_entry'}{'contents'}[0]{'contents'}[2]{'extra'}{'index_entry'}{'command'} = $result_trees{'unknown_then_known_index_entry'}{'contents'}[0]{'contents'}[2];
$result_trees{'unknown_then_known_index_entry'}{'contents'}[0]{'contents'}[2]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'unknown_then_known_index_entry'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'unknown_then_known_index_entry'}{'contents'}[0]{'contents'}[2]{'extra'}{'index_entry'}{'content_normalized'} = $result_trees{'unknown_then_known_index_entry'}{'contents'}[0]{'contents'}[2]{'extra'}{'index_entry'}{'content'};
$result_trees{'unknown_then_known_index_entry'}{'contents'}[0]{'contents'}[2]{'extra'}{'misc_content'} = $result_trees{'unknown_then_known_index_entry'}{'contents'}[0]{'contents'}[2]{'extra'}{'index_entry'}{'content'};
$result_trees{'unknown_then_known_index_entry'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'unknown_then_known_index_entry'}{'contents'}[0];
$result_trees{'unknown_then_known_index_entry'}{'contents'}[0]{'parent'} = $result_trees{'unknown_then_known_index_entry'};

$result_texis{'unknown_then_known_index_entry'} = ' someindex entry.
@defindex some
@someindex someindex entry.
';


$result_texts{'unknown_then_known_index_entry'} = ' someindex entry.
';

$result_errors{'unknown_then_known_index_entry'} = [
  {
    'error_line' => ':1: Unknown command `someindex\'
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => 'Unknown command `someindex\'',
    'type' => 'error'
  },
  {
    'error_line' => ':3: Entry for index `some\' outside of any node
',
    'file_name' => '',
    'line_nr' => 3,
    'macro' => '',
    'text' => 'Entry for index `some\' outside of any node',
    'type' => 'error'
  }
];


$result_indices{'unknown_then_known_index_entry'} = {
  'index_names' => {
    'cp' => {
      'c' => 0,
      'cp' => 0
    },
    'fn' => {
      'f' => 1,
      'fn' => 1
    },
    'ky' => {
      'k' => 1,
      'ky' => 1
    },
    'pg' => {
      'p' => 1,
      'pg' => 1
    },
    'some' => {
      'some' => 0
    },
    'tp' => {
      't' => 1,
      'tp' => 1
    },
    'vr' => {
      'v' => 1,
      'vr' => 1
    }
  }
};


1;
