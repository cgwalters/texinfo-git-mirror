use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'part_node_before_top'} = [
  {
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
                'text' => 'part node before top'
              }
            ],
            'parent' => {},
            'type' => 'misc_line_arg'
          },
          {
            'contents' => [
              {
                'text' => ' ',
                'type' => 'empty_spaces_before_argument'
              },
              {
                'parent' => {},
                'text' => 'Top'
              }
            ],
            'parent' => {},
            'type' => 'misc_line_arg'
          },
          {
            'contents' => [],
            'parent' => {},
            'type' => 'misc_line_arg'
          },
          {
            'contents' => [
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
        'contents' => [],
        'extra' => {
          'node_content' => [
            {}
          ],
          'nodes_manuals' => [
            {
              'node_content' => [],
              'normalized' => 'part-node-before-top'
            },
            {
              'node_content' => [
                {}
              ],
              'normalized' => 'Top'
            },
            undef,
            {
              'node_content' => [
                {}
              ],
              'normalized' => 'Top'
            }
          ],
          'normalized' => 'part-node-before-top'
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
                'text' => 'part'
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
        'cmdname' => 'part',
        'contents' => [
          {
            'parent' => {},
            'text' => '
',
            'type' => 'empty_line'
          }
        ],
        'extra' => {
          'misc_content' => [
            {}
          ]
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
    'extra' => {
      'element_command' => {},
      'section' => {}
    },
    'type' => 'element'
  },
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
        'contents' => [],
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
          'line_nr' => 4,
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
                'text' => 'top'
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
        'cmdname' => 'top',
        'contents' => [
          {
            'parent' => {},
            'text' => '
',
            'type' => 'empty_line'
          },
          {
            'cmdname' => 'menu',
            'contents' => [
              {
                'extra' => {
                  'command' => {}
                },
                'parent' => {},
                'text' => '
',
                'type' => 'empty_line_after_command'
              },
              {
                'args' => [
                  {
                    'parent' => {},
                    'text' => '* ',
                    'type' => 'menu_entry_leading_text'
                  },
                  {
                    'contents' => [
                      {
                        'parent' => {},
                        'text' => 'part node before top'
                      }
                    ],
                    'parent' => {},
                    'type' => 'menu_entry_node'
                  },
                  {
                    'parent' => {},
                    'text' => '::',
                    'type' => 'menu_entry_separator'
                  },
                  {
                    'contents' => [
                      {
                        'contents' => [
                          {
                            'parent' => {},
                            'text' => '
'
                          }
                        ],
                        'parent' => {},
                        'type' => 'preformatted'
                      }
                    ],
                    'parent' => {},
                    'type' => 'menu_entry_description'
                  }
                ],
                'extra' => {
                  'menu_entry_description' => {},
                  'menu_entry_node' => {
                    'node_content' => [
                      {}
                    ],
                    'normalized' => 'part-node-before-top'
                  }
                },
                'line_nr' => {
                  'file_name' => '',
                  'line_nr' => 8,
                  'macro' => ''
                },
                'parent' => {},
                'type' => 'menu_entry'
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
                        'text' => 'menu'
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
                  'command_argument' => 'menu',
                  'text_arg' => 'menu'
                },
                'line_nr' => {
                  'file_name' => '',
                  'line_nr' => 9,
                  'macro' => ''
                },
                'parent' => {}
              }
            ],
            'extra' => {
              'end_command' => {}
            },
            'line_nr' => {
              'file_name' => '',
              'line_nr' => 7,
              'macro' => ''
            },
            'parent' => {}
          }
        ],
        'extra' => {
          'misc_content' => [
            {}
          ]
        },
        'level' => 0,
        'line_nr' => {
          'file_name' => '',
          'line_nr' => 5,
          'macro' => ''
        },
        'parent' => {}
      }
    ],
    'element_prev' => {},
    'extra' => {
      'element_command' => {},
      'node' => {},
      'section' => {}
    },
    'type' => 'element'
  }
];
$result_trees{'part_node_before_top'}[0]{'contents'}[0]{'parent'} = $result_trees{'part_node_before_top'}[0];
$result_trees{'part_node_before_top'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'part_node_before_top'}[0]{'contents'}[1];
$result_trees{'part_node_before_top'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'part_node_before_top'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'part_node_before_top'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'part_node_before_top'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'part_node_before_top'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'part_node_before_top'}[0]{'contents'}[1];
$result_trees{'part_node_before_top'}[0]{'contents'}[1]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'part_node_before_top'}[0]{'contents'}[1]{'args'}[1];
$result_trees{'part_node_before_top'}[0]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'part_node_before_top'}[0]{'contents'}[1];
$result_trees{'part_node_before_top'}[0]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'part_node_before_top'}[0]{'contents'}[1];
$result_trees{'part_node_before_top'}[0]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'part_node_before_top'}[0]{'contents'}[1]{'args'}[3];
$result_trees{'part_node_before_top'}[0]{'contents'}[1]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'part_node_before_top'}[0]{'contents'}[1]{'args'}[3];
$result_trees{'part_node_before_top'}[0]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'part_node_before_top'}[0]{'contents'}[1];
$result_trees{'part_node_before_top'}[0]{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'part_node_before_top'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'part_node_before_top'}[0]{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'part_node_before_top'}[0]{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'part_node_before_top'}[0]{'contents'}[1]{'extra'}{'nodes_manuals'}[1]{'node_content'}[0] = $result_trees{'part_node_before_top'}[0]{'contents'}[1]{'args'}[1]{'contents'}[1];
$result_trees{'part_node_before_top'}[0]{'contents'}[1]{'extra'}{'nodes_manuals'}[3]{'node_content'}[0] = $result_trees{'part_node_before_top'}[0]{'contents'}[1]{'args'}[3]{'contents'}[0];
$result_trees{'part_node_before_top'}[0]{'contents'}[1]{'parent'} = $result_trees{'part_node_before_top'}[0];
$result_trees{'part_node_before_top'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'part_node_before_top'}[0]{'contents'}[2];
$result_trees{'part_node_before_top'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'part_node_before_top'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'part_node_before_top'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'part_node_before_top'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'part_node_before_top'}[0]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'part_node_before_top'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'part_node_before_top'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'part_node_before_top'}[0]{'contents'}[2];
$result_trees{'part_node_before_top'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'part_node_before_top'}[0]{'contents'}[2];
$result_trees{'part_node_before_top'}[0]{'contents'}[2]{'extra'}{'misc_content'}[0] = $result_trees{'part_node_before_top'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'part_node_before_top'}[0]{'contents'}[2]{'parent'} = $result_trees{'part_node_before_top'}[0];
$result_trees{'part_node_before_top'}[0]{'extra'}{'element_command'} = $result_trees{'part_node_before_top'}[0]{'contents'}[2];
$result_trees{'part_node_before_top'}[0]{'extra'}{'section'} = $result_trees{'part_node_before_top'}[0]{'contents'}[2];
$result_trees{'part_node_before_top'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'part_node_before_top'}[1]{'contents'}[0];
$result_trees{'part_node_before_top'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'part_node_before_top'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'part_node_before_top'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'part_node_before_top'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'part_node_before_top'}[1]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'part_node_before_top'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'part_node_before_top'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'part_node_before_top'}[1]{'contents'}[0];
$result_trees{'part_node_before_top'}[1]{'contents'}[0]{'extra'}{'node_content'}[0] = $result_trees{'part_node_before_top'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'part_node_before_top'}[1]{'contents'}[0]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'part_node_before_top'}[1]{'contents'}[0]{'extra'}{'node_content'};
$result_trees{'part_node_before_top'}[1]{'contents'}[0]{'parent'} = $result_trees{'part_node_before_top'}[1];
$result_trees{'part_node_before_top'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'part_node_before_top'}[1]{'contents'}[1];
$result_trees{'part_node_before_top'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'part_node_before_top'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'part_node_before_top'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'part_node_before_top'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'part_node_before_top'}[1]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'part_node_before_top'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'part_node_before_top'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'part_node_before_top'}[1]{'contents'}[1];
$result_trees{'part_node_before_top'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'part_node_before_top'}[1]{'contents'}[1];
$result_trees{'part_node_before_top'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'part_node_before_top'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'part_node_before_top'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'part_node_before_top'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'part_node_before_top'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'part_node_before_top'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'part_node_before_top'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'part_node_before_top'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'part_node_before_top'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'part_node_before_top'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'part_node_before_top'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'part_node_before_top'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'part_node_before_top'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'part_node_before_top'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0];
$result_trees{'part_node_before_top'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'part_node_before_top'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'part_node_before_top'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'part_node_before_top'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'part_node_before_top'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_description'} = $result_trees{'part_node_before_top'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'part_node_before_top'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'part_node_before_top'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'part_node_before_top'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'part_node_before_top'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'part_node_before_top'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'part_node_before_top'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'part_node_before_top'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'part_node_before_top'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'part_node_before_top'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'part_node_before_top'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'part_node_before_top'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'part_node_before_top'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'part_node_before_top'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'part_node_before_top'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'part_node_before_top'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[2]{'extra'}{'command'} = $result_trees{'part_node_before_top'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'part_node_before_top'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'part_node_before_top'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'part_node_before_top'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'part_node_before_top'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'part_node_before_top'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'part_node_before_top'}[1]{'contents'}[1];
$result_trees{'part_node_before_top'}[1]{'contents'}[1]{'extra'}{'misc_content'}[0] = $result_trees{'part_node_before_top'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'part_node_before_top'}[1]{'contents'}[1]{'parent'} = $result_trees{'part_node_before_top'}[1];
$result_trees{'part_node_before_top'}[1]{'element_prev'} = $result_trees{'part_node_before_top'}[0];
$result_trees{'part_node_before_top'}[1]{'extra'}{'element_command'} = $result_trees{'part_node_before_top'}[1]{'contents'}[1];
$result_trees{'part_node_before_top'}[1]{'extra'}{'node'} = $result_trees{'part_node_before_top'}[1]{'contents'}[0];
$result_trees{'part_node_before_top'}[1]{'extra'}{'section'} = $result_trees{'part_node_before_top'}[1]{'contents'}[1];

$result_texis{'part_node_before_top'} = '@node part node before top, Top,,Top
@part part

@node Top
@top top

@menu
* part node before top::
@end menu
';


$result_texts{'part_node_before_top'} = 'part
****

top
***

* part node before top::
';

$result_sectioning{'part_node_before_top'} = {
  'level' => -1,
  'section_childs' => [
    {
      'cmdname' => 'part',
      'extra' => {},
      'level' => 0,
      'section_up' => {}
    },
    {
      'cmdname' => 'top',
      'extra' => {
        'associated_node' => {
          'cmdname' => 'node',
          'extra' => {
            'normalized' => 'Top'
          }
        }
      },
      'level' => 0,
      'section_prev' => {},
      'section_up' => {}
    }
  ]
};
$result_sectioning{'part_node_before_top'}{'section_childs'}[0]{'section_up'} = $result_sectioning{'part_node_before_top'};
$result_sectioning{'part_node_before_top'}{'section_childs'}[1]{'section_prev'} = $result_sectioning{'part_node_before_top'}{'section_childs'}[0];
$result_sectioning{'part_node_before_top'}{'section_childs'}[1]{'section_up'} = $result_sectioning{'part_node_before_top'};

$result_nodes{'part_node_before_top'} = {
  'cmdname' => 'node',
  'extra' => {
    'associated_section' => {
      'cmdname' => 'top',
      'extra' => {},
      'level' => 0
    },
    'normalized' => 'Top'
  },
  'menu_child' => {
    'cmdname' => 'node',
    'extra' => {
      'normalized' => 'part-node-before-top'
    },
    'node_next' => {},
    'node_prev' => {},
    'node_up' => {}
  },
  'menus' => [
    {
      'cmdname' => 'menu',
      'extra' => {
        'end_command' => {
          'cmdname' => 'end',
          'extra' => {
            'command' => {},
            'command_argument' => 'menu',
            'text_arg' => 'menu'
          }
        }
      }
    }
  ],
  'node_next' => {},
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
$result_nodes{'part_node_before_top'}{'menu_child'}{'node_next'} = $result_nodes{'part_node_before_top'};
$result_nodes{'part_node_before_top'}{'menu_child'}{'node_prev'} = $result_nodes{'part_node_before_top'};
$result_nodes{'part_node_before_top'}{'menu_child'}{'node_up'} = $result_nodes{'part_node_before_top'};
$result_nodes{'part_node_before_top'}{'menus'}[0]{'extra'}{'end_command'}{'extra'}{'command'} = $result_nodes{'part_node_before_top'}{'menus'}[0];
$result_nodes{'part_node_before_top'}{'node_next'} = $result_nodes{'part_node_before_top'}{'menu_child'};
$result_nodes{'part_node_before_top'}{'node_up'}{'extra'}{'top_node_up'} = $result_nodes{'part_node_before_top'};

$result_menus{'part_node_before_top'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'menu_child' => {
    'cmdname' => 'node',
    'extra' => {
      'normalized' => 'part-node-before-top'
    },
    'menu_up' => {},
    'menu_up_hash' => {
      'Top' => 1
    }
  }
};
$result_menus{'part_node_before_top'}{'menu_child'}{'menu_up'} = $result_menus{'part_node_before_top'};

$result_errors{'part_node_before_top'} = [
  {
    'error_line' => ':2: warning: @node precedes @part, but part are not associated with nodes
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => '@node precedes @part, but part are not associated with nodes',
    'type' => 'warning'
  },
  {
    'error_line' => ':2: warning: No sectioning command associated with @part
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => 'No sectioning command associated with @part',
    'type' => 'warning'
  }
];


$result_elements{'part_node_before_top'} = [
  {
    'extra' => {
      'directions' => {
        'FastForward' => {
          'extra' => {
            'directions' => {
              'Back' => {},
              'FastBack' => {},
              'NodeForward' => {},
              'NodeNext' => {},
              'NodeUp' => {
                'extra' => {
                  'manual_content' => [
                    {
                      'text' => 'dir'
                    }
                  ],
                  'top_node_up' => {
                    'cmdname' => 'node',
                    'extra' => {
                      'normalized' => 'Top'
                    },
                    'menu_child' => {
                      'cmdname' => 'node',
                      'extra' => {
                        'normalized' => 'part-node-before-top'
                      },
                      'menu_up' => {},
                      'menu_up_hash' => {
                        'Top' => 1
                      }
                    }
                  }
                },
                'type' => 'external_node'
              },
              'Prev' => {},
              'This' => {}
            },
            'element_command' => {
              'cmdname' => 'top',
              'extra' => {},
              'level' => 0
            },
            'node' => {},
            'section' => {}
          },
          'type' => 'element'
        },
        'Forward' => {},
        'Next' => {},
        'NodeBack' => {},
        'This' => {}
      },
      'element_command' => {
        'cmdname' => 'part',
        'extra' => {},
        'level' => 0
      },
      'section' => {}
    },
    'type' => 'element'
  },
  {}
];
$result_elements{'part_node_before_top'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'Back'} = $result_elements{'part_node_before_top'}[0];
$result_elements{'part_node_before_top'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'FastBack'} = $result_elements{'part_node_before_top'}[0];
$result_elements{'part_node_before_top'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'NodeForward'} = $result_elements{'part_node_before_top'}[0];
$result_elements{'part_node_before_top'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'NodeNext'} = $result_elements{'part_node_before_top'}[0];
$result_elements{'part_node_before_top'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'NodeUp'}{'extra'}{'top_node_up'}{'menu_child'}{'menu_up'} = $result_elements{'part_node_before_top'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'NodeUp'}{'extra'}{'top_node_up'};
$result_elements{'part_node_before_top'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'Prev'} = $result_elements{'part_node_before_top'}[0];
$result_elements{'part_node_before_top'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'This'} = $result_elements{'part_node_before_top'}[0]{'extra'}{'directions'}{'FastForward'};
$result_elements{'part_node_before_top'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'node'} = $result_elements{'part_node_before_top'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'directions'}{'NodeUp'}{'extra'}{'top_node_up'};
$result_elements{'part_node_before_top'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'section'} = $result_elements{'part_node_before_top'}[0]{'extra'}{'directions'}{'FastForward'}{'extra'}{'element_command'};
$result_elements{'part_node_before_top'}[0]{'extra'}{'directions'}{'Forward'} = $result_elements{'part_node_before_top'}[0]{'extra'}{'directions'}{'FastForward'};
$result_elements{'part_node_before_top'}[0]{'extra'}{'directions'}{'Next'} = $result_elements{'part_node_before_top'}[0]{'extra'}{'directions'}{'FastForward'};
$result_elements{'part_node_before_top'}[0]{'extra'}{'directions'}{'NodeBack'} = $result_elements{'part_node_before_top'}[0]{'extra'}{'directions'}{'FastForward'};
$result_elements{'part_node_before_top'}[0]{'extra'}{'directions'}{'This'} = $result_elements{'part_node_before_top'}[0];
$result_elements{'part_node_before_top'}[0]{'extra'}{'section'} = $result_elements{'part_node_before_top'}[0]{'extra'}{'element_command'};
$result_elements{'part_node_before_top'}[1] = $result_elements{'part_node_before_top'}[0]{'extra'}{'directions'}{'FastForward'};



$result_directions_text{'part_node_before_top'} = 'element: @part part
  FastForward: @top top
  Forward: @top top
  Next: @top top
  NodeBack: @top top
  This: @part part
element: @top top
  Back: @part part
  FastBack: @part part
  NodeForward: @part part
  NodeNext: @part part
  NodeUp: (dir)
  Prev: @part part
  This: @top top
';


$result_converted{'info'}->{'part_node_before_top'} = 'This is , produced by tp version from .


File: ,  Node: part node before top,  Next: Top,  Prev: Top,  Up: Top


File: ,  Node: Top,  Next: part node before top,  Up: (dir)

top
***

* Menu:

* part node before top::


Tag Table:
Node: part node before top41
Node: Top114

End Tag Table
';


$result_converted{'html'}->{'part_node_before_top'} = '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- Created by texinfo, http://www.gnu.org/software/texinfo/ -->
<head>
<title>top</title>

<meta name="description" content="top">
<meta name="keywords" content="top">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="Generator" content="tp">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="#Top" rel="start" title="Top">
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
<a name="part-node-before-top"></a>
<div class="header">
<p>
Next: <a href="#Top" accesskey="n" rel="next">Top</a>, Previous: <a href="#Top" accesskey="p" rel="previous">Top</a>, Up: <a href="#Top" accesskey="u" rel="up">Top</a> &nbsp; </p>
</div>
<h4 class="node-heading">part node before top</h4>
<a name="part"></a>
<h1 class="part">part</h1>
<hr>

<hr>
<a name="Top"></a>
<div class="header">
<p>
Next: <a href="#part-node-before-top" accesskey="n" rel="next">part node before top</a>, Up: <a href="dir.html#Top" accesskey="u" rel="up">(dir)</a> &nbsp; </p>
</div>
<a name="top"></a>
<h1 class="top">top</h1>

<table class="menu" border="0" cellspacing="0">
<tr><td align="left" valign="top">&bull; <a href="#part-node-before-top" accesskey="1">part node before top</a>:</td><td>&nbsp;&nbsp;</td><td align="left" valign="top">
</td></tr>
</table>
<hr>
<p>


</p>
</body>
</html>
';


$result_converted{'xml'}->{'part_node_before_top'} = '<node name="part-node-before-top"><nodename>part node before top</nodename><nodenext>Top</nodenext><nodeprev automatic="on">Top</nodeprev><nodeup>Top</nodeup></node>
<part><sectiontitle>part</sectiontitle>

</part>
<node name="Top"><nodename>Top</nodename><nodenext automatic="on">part node before top</nodenext><nodeup automatic="on">(dir)</nodeup></node>
<top><sectiontitle>top</sectiontitle>

<menu>
<menuentry><menunode>part node before top</menunode><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>
</top>
';

1;
