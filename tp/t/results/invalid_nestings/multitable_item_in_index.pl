use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'multitable_item_in_index'} = {
  'contents' => [
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
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'aaa'
                }
              ],
              'parent' => {},
              'type' => 'bracketed'
            },
            {
              'parent' => {},
              'text' => ' '
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'bbb'
                }
              ],
              'parent' => {},
              'type' => 'bracketed'
            },
            {
              'parent' => {},
              'text' => '
'
            }
          ],
          'parent' => {},
          'type' => 'block_line_arg'
        }
      ],
      'cmdname' => 'multitable',
      'contents' => [
        {
          'contents' => [
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
                      'extra' => {
                        'command' => undef
                      },
                      'parent' => {},
                      'text' => ' ',
                      'type' => 'empty_spaces_after_command'
                    },
                    {
                      'parent' => {},
                      'text' => 'on item line'
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
              'cmdname' => 'vindex',
              'extra' => {
                'index_entry' => {
                  'command' => {},
                  'content' => [
                    {},
                    {}
                  ],
                  'content_normalized' => [],
                  'in_code' => 1,
                  'index_at_command' => 'vindex',
                  'index_name' => 'vr',
                  'index_prefix' => 'v',
                  'index_type_command' => 'vindex',
                  'key' => 'on item line',
                  'number' => 1
                },
                'misc_content' => []
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 2,
                'macro' => ''
              },
              'parent' => {},
              'type' => 'index_entry_command'
            }
          ],
          'parent' => {},
          'type' => 'before_item'
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
                  'text' => 'multitable'
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
          'cmdname' => 'end',
          'extra' => {
            'command' => {},
            'command_argument' => 'multitable',
            'text_arg' => 'multitable'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 3,
            'macro' => ''
          },
          'parent' => {}
        }
      ],
      'extra' => {
        'end_command' => {},
        'max_columns' => 2,
        'prototypes' => [
          {
            'contents' => [],
            'parent' => {},
            'type' => 'bracketed_multitable_prototype'
          },
          {
            'contents' => [],
            'parent' => {},
            'type' => 'bracketed_multitable_prototype'
          }
        ]
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 1,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'multitable_item_in_index'}{'contents'}[0];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'args'}[0];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'args'}[0];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'args'}[0];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'args'}[0]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'args'}[0];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'args'}[0];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'multitable_item_in_index'}{'contents'}[0];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[1] = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content_normalized'} = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'extra'}{'misc_content'} = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[0];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'multitable_item_in_index'}{'contents'}[0];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[1];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[1];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[1]{'extra'}{'command'} = $result_trees{'multitable_item_in_index'}{'contents'}[0];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'multitable_item_in_index'}{'contents'}[0];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'contents'}[1];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'extra'}{'prototypes'}[0]{'contents'} = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'};
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'extra'}{'prototypes'}[0]{'parent'} = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'args'}[0];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'extra'}{'prototypes'}[1]{'contents'} = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'args'}[0]{'contents'}[3]{'contents'};
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'extra'}{'prototypes'}[1]{'parent'} = $result_trees{'multitable_item_in_index'}{'contents'}[0]{'args'}[0];
$result_trees{'multitable_item_in_index'}{'contents'}[0]{'parent'} = $result_trees{'multitable_item_in_index'};

$result_texis{'multitable_item_in_index'} = '@multitable {aaa} {bbb}
@vindex  on item line
@end multitable
';


$result_texts{'multitable_item_in_index'} = '';

$result_errors{'multitable_item_in_index'} = [
  {
    'error_line' => ':2: @item outside of table or list
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => '@item outside of table or list',
    'type' => 'error'
  },
  {
    'error_line' => ':2: warning: @item should not appear in @vindex
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => '@item should not appear in @vindex',
    'type' => 'warning'
  },
  {
    'error_line' => ':2: Entry for index `vr\' outside of any node
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => 'Entry for index `vr\' outside of any node',
    'type' => 'error'
  },
  {
    'error_line' => ':1: warning: @multitable has text but no @item
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@multitable has text but no @item',
    'type' => 'warning'
  }
];


1;
