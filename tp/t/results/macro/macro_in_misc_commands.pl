use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'macro_in_misc_commands'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'parent' => {},
              'text' => 'text',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => 'atext',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
          'extra' => {
            'arg_line' => ' text 
',
            'macrobody' => 'atext
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 1,
            'macro' => ''
          },
          'parent' => {}
        },
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
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => 'Top',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => 'Top',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
          'extra' => {
            'arg_line' => ' Top
',
            'macrobody' => 'Top
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 5,
            'macro' => ''
          },
          'parent' => {}
        },
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
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
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
        'line_nr' => 9,
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
              'text' => 'top atext'
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
                  'text' => 'Comment like: atext'
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
          'cmdname' => 'subheading',
          'extra' => {
            'misc_content' => [
              {}
            ]
          },
          'level' => 3,
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 11,
            'macro' => ''
          },
          'parent' => {}
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
              'text' => 'Text line followed by a comment on the same line and another below '
            },
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => ' comment @text{}
',
                  'type' => 'misc_arg'
                }
              ],
              'cmdname' => 'c',
              'parent' => {}
            },
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => ' comment @text{}
',
                  'type' => 'misc_arg'
                }
              ],
              'cmdname' => 'c',
              'parent' => {}
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
          'args' => [
            {
              'parent' => {},
              'text' => 'en',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => 'en',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
          'extra' => {
            'arg_line' => ' en 
',
            'macrobody' => 'en
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 16,
            'macro' => ''
          },
          'parent' => {}
        },
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
              'text' => 'documentlanguage-command',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => '@documentlanguage',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
          'extra' => {
            'arg_line' => ' documentlanguage-command 
',
            'macrobody' => '@documentlanguage
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 19,
            'macro' => ''
          },
          'parent' => {}
        },
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
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'documentlanguage '
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
                      'text' => '  ',
                      'type' => 'empty_spaces_after_command'
                    },
                    {
                      'parent' => {},
                      'text' => 'en'
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
              'cmdname' => 'documentlanguage',
              'extra' => {
                'text_arg' => 'en'
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 23,
                'macro' => ''
              },
              'parent' => {}
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
              'text' => 'documentlanguage on its line
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
                      'text' => '  ',
                      'type' => 'empty_spaces_after_command'
                    },
                    {
                      'parent' => {},
                      'text' => 'en'
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
              'cmdname' => 'documentlanguage',
              'extra' => {
                'text_arg' => 'en'
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 26,
                'macro' => 'documentlanguage-command'
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => 'line following documentlanguage
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
          'args' => [
            {
              'parent' => {},
              'text' => 'pagesizes-arg',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => '200mm,150mm',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
          'extra' => {
            'arg_line' => ' pagesizes-arg
',
            'macrobody' => '200mm,150mm
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 29,
            'macro' => ''
          },
          'parent' => {}
        },
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
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => 'afourpaper-macro',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => '@afourpaper',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
          'extra' => {
            'arg_line' => ' afourpaper-macro 
',
            'macrobody' => '@afourpaper
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 33,
            'macro' => ''
          },
          'parent' => {}
        },
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
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
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
                  'text' => '200mm,150mm'
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
          'cmdname' => 'pagesizes',
          'extra' => {
            'misc_content' => [
              {}
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 37,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'cmdname' => 'afourpaper',
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
                  'text' => 'on line following headings atext'
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
          'cmdname' => 'headings',
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 39,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => ' some text ignored @text{}
',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'oddfooting',
          'parent' => {}
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => ' on line following everyheading @text{}
',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'everyheading',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => 'need-arg',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => '0.1',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
          'extra' => {
            'arg_line' => ' need-arg
',
            'macrobody' => '0.1
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 43,
            'macro' => ''
          },
          'parent' => {}
        },
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
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
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
                  'text' => '0.1'
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
          'cmdname' => 'need',
          'extra' => {
            'misc_args' => [
              '0.1'
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 47,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => 'raisesections-macro',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => '@raisesections',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
          'extra' => {
            'arg_line' => ' raisesections-macro 
',
            'macrobody' => '@raisesections
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 49,
            'macro' => ''
          },
          'parent' => {}
        },
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
          'cmdname' => 'raisesections',
          'parent' => {}
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => 'lowersections-macro',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => '@lowersections',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
          'extra' => {
            'arg_line' => ' lowersections-macro 
',
            'macrobody' => '@lowersections
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 53,
            'macro' => ''
          },
          'parent' => {}
        },
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
          'cmdname' => 'lowersections',
          'parent' => {}
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
              'cmdname' => '@',
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => 'definfoenclose phoo,//,\\\\  '
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
                      'text' => 'phoo,//,\\\\'
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
              'cmdname' => 'definfoenclose',
              'extra' => {
                'misc_args' => [
                  'phoo',
                  '//',
                  '\\\\'
                ]
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 58,
                'macro' => ''
              },
              'parent' => {}
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
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'bar'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'phoo',
              'contents' => [],
              'extra' => {
                'begin' => '//',
                'end' => '\\\\'
              },
              'parent' => {},
              'type' => 'definfoenclose_command'
            },
            {
              'parent' => {},
              'text' => '
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
          'args' => [
            {
              'parent' => {},
              'text' => 'definfoenclose-name',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => 'phi',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
          'extra' => {
            'arg_line' => ' definfoenclose-name 
',
            'macrobody' => 'phi
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 62,
            'macro' => ''
          },
          'parent' => {}
        },
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
                  'text' => 'phi,:,:'
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
          'cmdname' => 'definfoenclose',
          'extra' => {
            'misc_args' => [
              'phi',
              ':',
              ':'
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 65,
            'macro' => ''
          },
          'parent' => {}
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
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'bar'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'phi',
              'contents' => [],
              'extra' => {
                'begin' => ':',
                'end' => ':'
              },
              'parent' => {},
              'type' => 'definfoenclose_command'
            },
            {
              'parent' => {},
              'text' => '
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
          'args' => [
            {
              'parent' => {},
              'text' => 'strong-macro',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => '@strong',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
          'extra' => {
            'arg_line' => ' strong-macro 
',
            'macrobody' => '@strong
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 69,
            'macro' => ''
          },
          'parent' => {}
        },
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
              'text' => 'strong-name',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => 'strong',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
          'extra' => {
            'arg_line' => ' strong-name 
',
            'macrobody' => 'strong
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 72,
            'macro' => ''
          },
          'parent' => {}
        },
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
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'very strong'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'strong',
              'contents' => [],
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 76,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '
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
                  'text' => 'strong,(strong:,:)'
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
          'cmdname' => 'definfoenclose',
          'extra' => {
            'misc_args' => [
              'strong',
              '(strong:',
              ':)'
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 78,
            'macro' => ''
          },
          'parent' => {}
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
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => ' is it really strong? '
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'strong',
              'contents' => [],
              'extra' => {
                'begin' => '(strong:',
                'end' => ':)'
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 80,
                'macro' => ''
              },
              'parent' => {},
              'type' => 'definfoenclose_command'
            },
            {
              'parent' => {},
              'text' => '
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
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'something before kbdinputstyle'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'kbd',
              'contents' => [],
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 82,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '
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
          'args' => [
            {
              'parent' => {},
              'text' => 'kbdinputstyle-arg',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => 'code',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
          'extra' => {
            'arg_line' => ' kbdinputstyle-arg 
',
            'macrobody' => 'code
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 84,
            'macro' => ''
          },
          'parent' => {}
        },
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
                  'text' => 'code'
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
          'cmdname' => 'kbdinputstyle',
          'extra' => {
            'misc_args' => [
              'code'
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 87,
            'macro' => ''
          },
          'parent' => {}
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
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'truc'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'kbd',
              'contents' => [],
              'extra' => {
                'code' => 1
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 89,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '
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
          'cmdname' => 'example',
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
              'contents' => [
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'example'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'kbd',
                  'contents' => [],
                  'extra' => {
                    'code' => 1
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 92,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => '
'
                }
              ],
              'parent' => {},
              'type' => 'preformatted'
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
                      'text' => 'example'
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
                'command_argument' => 'example',
                'text_arg' => 'example'
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 93,
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
            'line_nr' => 91,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => 'asis-arg',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => 'asis',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
          'extra' => {
            'arg_line' => ' asis-arg 
',
            'macrobody' => 'asis
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 95,
            'macro' => ''
          },
          'parent' => {}
        },
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
              'text' => 'zero',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => '0',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
          'extra' => {
            'arg_line' => ' zero 
',
            'macrobody' => '0
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 98,
            'macro' => ''
          },
          'parent' => {}
        },
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
              'text' => 'none-arg',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => 'none',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
          'extra' => {
            'arg_line' => ' none-arg 
',
            'macrobody' => 'none
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 101,
            'macro' => ''
          },
          'parent' => {}
        },
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
              'text' => 'four',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => '4',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
          'extra' => {
            'arg_line' => ' four 
',
            'macrobody' => '4
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 104,
            'macro' => ''
          },
          'parent' => {}
        },
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
              'text' => 'six',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => '6',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
          'extra' => {
            'arg_line' => ' six 
',
            'macrobody' => '6
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 107,
            'macro' => ''
          },
          'parent' => {}
        },
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
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
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
                  'text' => 'asis'
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
          'cmdname' => 'paragraphindent',
          'extra' => {
            'misc_args' => [
              'asis'
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 111,
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
                  'text' => '0'
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
          'cmdname' => 'paragraphindent',
          'extra' => {
            'misc_args' => [
              '0'
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 112,
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
                  'text' => 'none'
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
          'cmdname' => 'paragraphindent',
          'extra' => {
            'misc_args' => [
              'none'
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 113,
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
                  'text' => '4'
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
          'cmdname' => 'paragraphindent',
          'extra' => {
            'misc_args' => [
              '4'
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 114,
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
                  'text' => 'none'
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
          'cmdname' => 'firstparagraphindent',
          'extra' => {
            'misc_args' => [
              'none'
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 115,
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
                  'text' => '6'
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
          'cmdname' => 'exampleindent',
          'extra' => {
            'misc_args' => [
              '6'
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 116,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => 'end-arg',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => 'end',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
          'extra' => {
            'arg_line' => ' end-arg 
',
            'macrobody' => 'end
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 118,
            'macro' => ''
          },
          'parent' => {}
        },
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
              'text' => 'separate-arg',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => 'separate ',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
          'extra' => {
            'arg_line' => ' separate-arg 
',
            'macrobody' => 'separate 
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 121,
            'macro' => ''
          },
          'parent' => {}
        },
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
                  'text' => 'end'
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
          'cmdname' => 'footnotestyle',
          'extra' => {
            'misc_args' => [
              'end'
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 124,
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
                  'text' => 'separate'
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
          'cmdname' => 'footnotestyle',
          'extra' => {
            'misc_args' => [
              'separate'
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 125,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => 'on-arg',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => 'on',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
          'extra' => {
            'arg_line' => ' on-arg 
',
            'macrobody' => 'on
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 127,
            'macro' => ''
          },
          'parent' => {}
        },
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
              'text' => 'off-arg',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => 'off',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
          'extra' => {
            'arg_line' => ' off-arg 
',
            'macrobody' => 'off
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 130,
            'macro' => ''
          },
          'parent' => {}
        },
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
                  'text' => 'on'
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
          'cmdname' => 'frenchspacing',
          'extra' => {
            'misc_args' => [
              'on'
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 133,
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
                  'text' => 'off'
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
          'cmdname' => 'frenchspacing',
          'extra' => {
            'misc_args' => [
              'off'
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 134,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => ' accepts 10 or 11
',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'c',
          'parent' => {}
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => 'ten',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => '10',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
          'extra' => {
            'arg_line' => ' ten 
',
            'macrobody' => '10
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 137,
            'macro' => ''
          },
          'parent' => {}
        },
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
                  'text' => '10'
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
          'cmdname' => 'fonttextsize',
          'extra' => {
            'misc_args' => [
              '10'
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 140,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => ' accept false or true
',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'c',
          'parent' => {}
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => 'false-arg',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => 'false',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
          'extra' => {
            'arg_line' => ' false-arg 
',
            'macrobody' => 'false
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 142,
            'macro' => ''
          },
          'parent' => {}
        },
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
              'text' => 'true-arg',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => 'true',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
          'extra' => {
            'arg_line' => ' true-arg
',
            'macrobody' => 'true
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 145,
            'macro' => ''
          },
          'parent' => {}
        },
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
                  'text' => 'false'
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
          'cmdname' => 'allowcodebreaks',
          'extra' => {
            'misc_args' => [
              'false'
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 148,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
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
                  'text' => 'true'
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
          'cmdname' => 'allowcodebreaks',
          'extra' => {
            'misc_args' => [
              'true'
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 150,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => 'page-macro',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => '@page',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
          'extra' => {
            'arg_line' => ' page-macro 
',
            'macrobody' => '@page
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 152,
            'macro' => ''
          },
          'parent' => {}
        },
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
              'text' => 'noindent-macro',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => '@noindent',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
          'extra' => {
            'arg_line' => ' noindent-macro 
',
            'macrobody' => '@noindent
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 155,
            'macro' => ''
          },
          'parent' => {}
        },
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
              'text' => 'refill-macro',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => '@refill',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
          'extra' => {
            'arg_line' => ' refill-macro 
',
            'macrobody' => '@refill
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 158,
            'macro' => ''
          },
          'parent' => {}
        },
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
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'cmdname' => '@',
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => 'page '
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        },
        {
          'cmdname' => 'page',
          'parent' => {}
        },
        {
          'contents' => [
            {
              'cmdname' => '@',
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => 'noindent '
            },
            {
              'cmdname' => 'noindent',
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 163,
                'macro' => 'noindent-macro'
              },
              'parent' => {}
            },
            {
              'extra' => {
                'command' => {}
              },
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'cmdname' => '@',
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => 'refill '
            },
            {
              'cmdname' => 'refill',
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => ' something
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
          'cmdname' => 'noindent',
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 165,
            'macro' => 'noindent-macro'
          },
          'parent' => {}
        },
        {
          'extra' => {
            'command' => {}
          },
          'parent' => {},
          'text' => '     ',
          'type' => 'empty_spaces_after_command'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'noindent at beginning of line
'
            },
            {
              'cmdname' => 'noindent',
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 166,
                'macro' => 'noindent-macro'
              },
              'parent' => {}
            },
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
              'parent' => {},
              'text' => 'noindent on the preceding line
'
            },
            {
              'parent' => {},
              'text' => '  '
            },
            {
              'cmdname' => 'noindent',
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 168,
                'macro' => 'noindent-macro'
              },
              'parent' => {}
            },
            {
              'extra' => {
                'command' => {}
              },
              'parent' => {},
              'text' => '    ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'noindent after space at beginning of line
'
            }
          ],
          'extra' => {
            'noindent' => 1
          },
          'parent' => {},
          'type' => 'paragraph'
        },
        {
          'cmdname' => 'page',
          'parent' => {}
        },
        {
          'cmdname' => 'page',
          'parent' => {}
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'After page on its own line.
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
              'cmdname' => '@',
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => 'page '
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        },
        {
          'cmdname' => 'page',
          'parent' => {}
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'two spaces   '
            },
            {
              'cmdname' => '@',
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => 'noindent '
            },
            {
              'cmdname' => 'noindent',
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 174,
                'macro' => 'noindent-macro'
              },
              'parent' => {}
            },
            {
              'extra' => {
                'command' => {}
              },
              'parent' => {},
              'text' => '    ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'cmdname' => '@',
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => 'refill '
            },
            {
              'cmdname' => 'refill',
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '
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
          'args' => [
            {
              'parent' => {},
              'text' => 'contents-macro',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => '@contents',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
          'extra' => {
            'arg_line' => ' contents-macro 
',
            'macrobody' => '@contents
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 176,
            'macro' => ''
          },
          'parent' => {}
        },
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
          'cmdname' => 'contents',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => ' @atext{}
',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'vskip',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => 'cropmarks-macro',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => '@cropmarks',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
          'extra' => {
            'arg_line' => ' cropmarks-macro
',
            'macrobody' => '@cropmarks
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 183,
            'macro' => ''
          },
          'parent' => {}
        },
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
          'cmdname' => 'cropmarks',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => 'exdent-macro',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => '@exdent',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
          'extra' => {
            'arg_line' => ' exdent-macro 
',
            'macrobody' => '@exdent
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 188,
            'macro' => ''
          },
          'parent' => {}
        },
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
                  'text' => 'line after exdent'
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
          'cmdname' => 'exdent',
          'extra' => {
            'misc_content' => [
              {}
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 191,
            'macro' => 'exdent-macro'
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => 'two',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => '2',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
          'extra' => {
            'arg_line' => ' two 
',
            'macrobody' => '2
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 193,
            'macro' => ''
          },
          'parent' => {}
        },
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
                  'text' => '2'
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
          'cmdname' => 'sp',
          'extra' => {
            'misc_args' => [
              '2'
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 196,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => 'result-macro',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => '@result',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
          'extra' => {
            'arg_line' => ' result-macro 
',
            'macrobody' => '@result
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 198,
            'macro' => ''
          },
          'parent' => {}
        },
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
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => '@result-macro',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'clickstyle',
          'extra' => {
            'arg_line' => ' @result-macro{}
'
          },
          'parent' => {}
        },
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
                      'text' => 'node atext'
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
                  'normalized' => 'node-atext'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 205,
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
                'line_nr' => 206,
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
            'line_nr' => 204,
            'macro' => ''
          },
          'parent' => {}
        },
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
        'line_nr' => 10,
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
              'text' => 'node atext'
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
            'normalized' => 'node-atext'
          }
        ],
        'normalized' => 'node-atext'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 208,
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
              'text' => 'chapter'
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
      'cmdname' => 'chapter',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'contents',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => 'shortcontents-macro',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => '@shortcontents',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
          'extra' => {
            'arg_line' => ' shortcontents-macro 
',
            'macrobody' => '@shortcontents
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 213,
            'macro' => ''
          },
          'parent' => {}
        },
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
          'cmdname' => 'shortcontents',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => 'bye-macro',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => '@bye',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
          'extra' => {
            'arg_line' => ' bye-macro
',
            'macrobody' => '@bye
'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 218,
            'macro' => ''
          },
          'parent' => {}
        },
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
      'level' => 1,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 209,
        'macro' => ''
      },
      'number' => 1,
      'parent' => {}
    },
    {
      'cmdname' => 'bye',
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'macro_in_misc_commands'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[0]{'contents'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[0]{'contents'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[0]{'contents'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[0]{'contents'}[1]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[0]{'contents'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[0]{'contents'}[3];
$result_trees{'macro_in_misc_commands'}{'contents'}[0]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[0]{'contents'}[3];
$result_trees{'macro_in_misc_commands'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[0]{'contents'}[3];
$result_trees{'macro_in_misc_commands'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[0]{'contents'}[4]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[0]{'contents'}[3];
$result_trees{'macro_in_misc_commands'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[0]{'contents'}[5]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[1];
$result_trees{'macro_in_misc_commands'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[1]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[1]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[1]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[1];
$result_trees{'macro_in_misc_commands'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'macro_in_misc_commands'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'macro_in_misc_commands'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'macro_in_misc_commands'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'macro_in_misc_commands'}{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[0]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[0]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[0]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[0]{'extra'}{'misc_content'}[0] = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[2]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[2]{'contents'}[1];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[2]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[2]{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[4];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[4];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[4];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[4]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[5]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[4];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[5]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[6];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[6];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[6];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[6]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[7]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[6];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[7]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[8]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[9]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[9];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[9]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[9]{'contents'}[1];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[9]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[9]{'contents'}[1]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[9]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[9]{'contents'}[1]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[9]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[9]{'contents'}[1]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[9]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[9]{'contents'}[1];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[9]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[9];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[9]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[10]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[11]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[11];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[11]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[11]{'contents'}[1];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[11]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[11]{'contents'}[1]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[11]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[11]{'contents'}[1]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[11]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[11]{'contents'}[1]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[11]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[11]{'contents'}[1];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[11]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[11];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[11]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[11];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[11]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[12]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[13]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[13];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[13]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[13];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[13]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[13];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[13]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[14]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[13];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[14]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[15]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[16]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[16];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[16]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[16];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[16]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[16];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[16]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[17]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[16];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[17]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[18]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[19]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[19];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[19]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[19]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[19]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[19]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[19]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[19]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[19]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[19];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[19]{'extra'}{'misc_content'}[0] = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[19]{'args'}[0]{'contents'}[1];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[19]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[20]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[21]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[21];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[21]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[21]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[21]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[21]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[21]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[21]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[21]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[21];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[21]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[22]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[22];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[22]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[23]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[23];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[23]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[24]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[25]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[25];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[25]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[25];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[25]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[25];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[25]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[26]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[25];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[26]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[27]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[28]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[28];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[28]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[28]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[28]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[28]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[28]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[28]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[28]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[28];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[28]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[29]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[30]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[30];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[30]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[30];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[30]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[30];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[30]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[31]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[30];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[31]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[32]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[33]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[33];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[33]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[33];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[33]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[33];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[33]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[34]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[33];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[34]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[35]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[36]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[37]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[37];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[37]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[37];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[37]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[37]{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[37]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[37]{'contents'}[2]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[37]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[37]{'contents'}[2]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[37]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[37]{'contents'}[2]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[37]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[37]{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[37]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[37];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[37]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[38]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[39]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[39]{'contents'}[0]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[39]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[39]{'contents'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[39]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[39];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[39]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[39];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[39]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[40]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[41]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[41];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[41]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[41];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[41]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[41];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[41]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[42]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[41];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[42]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[43]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[43];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[43]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[43]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[43]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[43]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[43]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[43]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[43]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[43];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[43]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[44]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[45]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[45]{'contents'}[0]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[45]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[45]{'contents'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[45]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[45];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[45]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[45];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[45]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[46]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[47]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[47];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[47]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[47];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[47]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[47];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[47]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[48]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[47];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[48]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[49]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[49];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[49]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[49];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[49]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[49];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[49]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[50]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[49];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[50]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[51]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[52]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[52]{'contents'}[0]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[52]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[52]{'contents'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[52]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[52];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[52]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[52];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[52]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[53]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[54]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[54];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[54]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[54]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[54]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[54]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[54]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[54]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[54]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[54];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[54]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[55]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[56]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[56]{'contents'}[0]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[56]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[56]{'contents'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[56]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[56];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[56]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[56];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[56]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[57]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[58]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[58]{'contents'}[0]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[58]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[58]{'contents'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[58]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[58];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[58]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[58];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[58]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[59]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[60]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[60];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[60]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[60];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[60]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[60];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[60]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[61]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[60];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[61]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[62]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[62];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[62]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[62]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[62]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[62]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[62]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[62]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[62]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[62];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[62]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[63]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[64]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[64]{'contents'}[0]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[64]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[64]{'contents'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[64]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[64];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[64]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[64];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[64]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[65]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[66]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[66];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[66]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[66];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[66]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[66]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[66]{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[66]{'contents'}[1]{'contents'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[66]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[66]{'contents'}[1];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[66]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[66]{'contents'}[1];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[66]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[66];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[66]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[66]{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[66]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[66]{'contents'}[2]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[66]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[66]{'contents'}[2]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[66]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[66]{'contents'}[2]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[66]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[66]{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[66]{'contents'}[2]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[66];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[66]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[66];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[66]{'extra'}{'end_command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[66]{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[66]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[67]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[68]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[68];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[68]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[68];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[68]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[68];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[68]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[69]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[68];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[69]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[70]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[70];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[70]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[70];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[70]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[70];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[70]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[71]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[70];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[71]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[72]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[72];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[72]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[72];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[72]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[72];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[72]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[73]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[72];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[73]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[74]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[74];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[74]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[74];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[74]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[74];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[74]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[75]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[74];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[75]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[76]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[76];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[76]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[76];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[76]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[76];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[76]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[77]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[76];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[77]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[78]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[79]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[79];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[79]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[79]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[79]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[79]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[79]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[79]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[79]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[79];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[79]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[80]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[80];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[80]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[80]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[80]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[80]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[80]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[80]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[80]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[80];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[80]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[81]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[81];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[81]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[81]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[81]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[81]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[81]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[81]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[81]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[81];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[81]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[82]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[82];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[82]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[82]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[82]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[82]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[82]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[82]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[82]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[82];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[82]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[83]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[83];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[83]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[83]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[83]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[83]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[83]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[83]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[83]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[83];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[83]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[84]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[84];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[84]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[84]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[84]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[84]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[84]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[84]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[84]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[84];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[84]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[85]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[86]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[86];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[86]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[86];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[86]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[86];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[86]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[87]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[86];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[87]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[88]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[88];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[88]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[88];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[88]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[88];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[88]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[89]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[88];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[89]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[90]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[90];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[90]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[90]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[90]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[90]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[90]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[90]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[90]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[90];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[90]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[91]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[91];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[91]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[91]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[91]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[91]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[91]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[91]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[91]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[91];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[91]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[92]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[93]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[93];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[93]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[93];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[93]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[93];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[93]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[94]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[93];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[94]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[95]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[95];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[95]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[95];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[95]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[95];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[95]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[96]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[95];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[96]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[97]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[97];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[97]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[97]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[97]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[97]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[97]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[97]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[97]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[97];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[97]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[98]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[98];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[98]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[98]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[98]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[98]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[98]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[98]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[98]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[98];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[98]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[99]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[100]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[100];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[100]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[101]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[101];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[101]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[101];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[101]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[101];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[101]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[102]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[101];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[102]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[103]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[103];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[103]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[103]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[103]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[103]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[103]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[103]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[103]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[103];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[103]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[104]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[104];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[104]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[105]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[105];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[105]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[105];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[105]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[105];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[105]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[106]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[105];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[106]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[107]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[107];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[107]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[107];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[107]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[107];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[107]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[108]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[107];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[108]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[109]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[109];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[109]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[109]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[109]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[109]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[109]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[109]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[109]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[109];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[109]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[110]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[111]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[111];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[111]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[111]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[111]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[111]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[111]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[111]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[111]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[111];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[111]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[112]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[113]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[113];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[113]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[113];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[113]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[113];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[113]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[114]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[113];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[114]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[115]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[115];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[115]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[115];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[115]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[115];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[115]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[116]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[115];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[116]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[117]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[117];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[117]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[117];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[117]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[117];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[117]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[118]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[117];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[118]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[119]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[120]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[120];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[120]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[120];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[120]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[121]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[122]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[122];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[122]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[122];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[122]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[122];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[122]{'contents'}[3]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[122]{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[122]{'contents'}[3]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[122];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[122]{'contents'}[4]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[122];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[122]{'contents'}[5]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[122];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[122]{'contents'}[6]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[122];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[122]{'contents'}[7]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[122];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[122]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[123]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[124]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[125]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[124];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[125]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[126]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[126];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[126]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[126];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[126]{'contents'}[2]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[126]{'contents'}[1];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[126]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[126];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[126]{'contents'}[3]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[126];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[126]{'contents'}[4]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[126];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[126]{'contents'}[5]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[126];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[126]{'contents'}[6]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[126]{'contents'}[5];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[126]{'contents'}[6]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[126];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[126]{'contents'}[7]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[126];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[126]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[127]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[128]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[129]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[129];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[129]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[130]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[131]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[131];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[131]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[131];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[131]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[132]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[133]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[133];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[133]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[133];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[133]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[133];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[133]{'contents'}[3]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[133];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[133]{'contents'}[4]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[133]{'contents'}[3];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[133]{'contents'}[4]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[133];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[133]{'contents'}[5]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[133];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[133]{'contents'}[6]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[133];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[133]{'contents'}[7]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[133];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[133]{'contents'}[8]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[133];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[133]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[134]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[135]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[135];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[135]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[135];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[135]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[135];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[135]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[136]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[135];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[136]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[137]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[138]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[139]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[139];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[139]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[140]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[141]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[141];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[141]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[141];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[141]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[141];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[141]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[142]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[141];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[142]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[143]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[144]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[145]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[145];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[145]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[145];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[145]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[145];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[145]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[146]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[145];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[146]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[147]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[147];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[147]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[147]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[147]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[147]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[147]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[147]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[147]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[147];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[147]{'extra'}{'misc_content'}[0] = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[147]{'args'}[0]{'contents'}[1];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[147]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[148]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[149]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[149];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[149]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[149];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[149]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[149];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[149]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[150]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[149];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[150]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[151]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[151];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[151]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[151]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[151]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[151]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[151]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[151]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[151]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[151];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[151]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[152]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[153]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[153];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[153]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[153];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[153]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[153];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[153]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[154]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[153];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[154]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[155]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[156]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[156];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[156]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[157]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[158]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[158];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[158]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[158];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[158]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[158]{'contents'}[1];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[158]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[158]{'contents'}[1]{'args'}[1];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[158]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[158]{'contents'}[1];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[158]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[158]{'contents'}[1];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[158]{'contents'}[1]{'args'}[3]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[158]{'contents'}[1]{'args'}[3]{'contents'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[158]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[158]{'contents'}[1]{'args'}[3];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[158]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[158]{'contents'}[1];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[158]{'contents'}[1]{'extra'}{'menu_entry_description'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[158]{'contents'}[1]{'args'}[3];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[158]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[158]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[158]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[158];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[158]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[158]{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[158]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[158]{'contents'}[2]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[158]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[158]{'contents'}[2]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[158]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[158]{'contents'}[2]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[158]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[158]{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[158]{'contents'}[2]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[158];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[158]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[158];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[158]{'extra'}{'end_command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[158]{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[158]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'contents'}[159]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[2];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'extra'}{'misc_content'}[0] = $result_trees{'macro_in_misc_commands'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'macro_in_misc_commands'}{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[3];
$result_trees{'macro_in_misc_commands'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[3]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[3]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[3]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[3];
$result_trees{'macro_in_misc_commands'}{'contents'}[3]{'extra'}{'node_content'}[0] = $result_trees{'macro_in_misc_commands'}{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'macro_in_misc_commands'}{'contents'}[3]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'macro_in_misc_commands'}{'contents'}[3]{'extra'}{'node_content'};
$result_trees{'macro_in_misc_commands'}{'contents'}[3]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[4];
$result_trees{'macro_in_misc_commands'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[4]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[4]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[4]{'args'}[0];
$result_trees{'macro_in_misc_commands'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[4];
$result_trees{'macro_in_misc_commands'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[4];
$result_trees{'macro_in_misc_commands'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[4];
$result_trees{'macro_in_misc_commands'}{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[4];
$result_trees{'macro_in_misc_commands'}{'contents'}[4]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[4]{'contents'}[3];
$result_trees{'macro_in_misc_commands'}{'contents'}[4]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[4]{'contents'}[3];
$result_trees{'macro_in_misc_commands'}{'contents'}[4]{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[4]{'contents'}[3];
$result_trees{'macro_in_misc_commands'}{'contents'}[4]{'contents'}[3]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[4];
$result_trees{'macro_in_misc_commands'}{'contents'}[4]{'contents'}[4]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[4]{'contents'}[3];
$result_trees{'macro_in_misc_commands'}{'contents'}[4]{'contents'}[4]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[4];
$result_trees{'macro_in_misc_commands'}{'contents'}[4]{'contents'}[5]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[4];
$result_trees{'macro_in_misc_commands'}{'contents'}[4]{'contents'}[6]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[4];
$result_trees{'macro_in_misc_commands'}{'contents'}[4]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[4]{'contents'}[7];
$result_trees{'macro_in_misc_commands'}{'contents'}[4]{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[4]{'contents'}[7];
$result_trees{'macro_in_misc_commands'}{'contents'}[4]{'contents'}[7]{'contents'}[1]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[4]{'contents'}[7];
$result_trees{'macro_in_misc_commands'}{'contents'}[4]{'contents'}[7]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[4];
$result_trees{'macro_in_misc_commands'}{'contents'}[4]{'contents'}[8]{'extra'}{'command'} = $result_trees{'macro_in_misc_commands'}{'contents'}[4]{'contents'}[7];
$result_trees{'macro_in_misc_commands'}{'contents'}[4]{'contents'}[8]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[4];
$result_trees{'macro_in_misc_commands'}{'contents'}[4]{'contents'}[9]{'parent'} = $result_trees{'macro_in_misc_commands'}{'contents'}[4];
$result_trees{'macro_in_misc_commands'}{'contents'}[4]{'extra'}{'misc_content'}[0] = $result_trees{'macro_in_misc_commands'}{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'macro_in_misc_commands'}{'contents'}[4]{'parent'} = $result_trees{'macro_in_misc_commands'};
$result_trees{'macro_in_misc_commands'}{'contents'}[5]{'parent'} = $result_trees{'macro_in_misc_commands'};

$result_texis{'macro_in_misc_commands'} = '@macro text 
atext
@end macro

@macro Top
Top
@end macro

@node Top
@top top atext
@subheading Comment like: atext

Text line followed by a comment on the same line and another below @c comment @text{}
@c comment @text{}

@macro en 
en
@end macro
@macro documentlanguage-command 
@documentlanguage
@end macro

documentlanguage @documentlanguage  en

documentlanguage on its line
@documentlanguage  en
line following documentlanguage

@macro pagesizes-arg
200mm,150mm
@end macro

@macro afourpaper-macro 
@afourpaper
@end macro

@pagesizes 200mm,150mm
@afourpaper
@headings on line following headings atext
@oddfooting some text ignored @text{}
@everyheading on line following everyheading @text{}

@macro need-arg
0.1
@end macro

@need 0.1

@macro raisesections-macro 
@raisesections
@end macro
@raisesections
@macro lowersections-macro 
@lowersections
@end macro
@lowersections

@@definfoenclose phoo,//,\\\\  @definfoenclose phoo,//,\\\\

@phoo{bar}

@macro definfoenclose-name 
phi
@end macro
@definfoenclose phi,:,:

@phi{bar}

@macro strong-macro 
@strong
@end macro
@macro strong-name 
strong
@end macro

@strong{very strong}

@definfoenclose strong,(strong:,:)

@strong{ is it really strong? }

@kbd{something before kbdinputstyle}

@macro kbdinputstyle-arg 
code
@end macro
@kbdinputstyle code

@kbd{truc}

@example
@kbd{example}
@end example

@macro asis-arg 
asis
@end macro
@macro zero 
0
@end macro
@macro none-arg 
none
@end macro
@macro four 
4
@end macro
@macro six 
6
@end macro

@paragraphindent asis
@paragraphindent 0
@paragraphindent none
@paragraphindent 4
@firstparagraphindent none
@exampleindent 6

@macro end-arg 
end
@end macro
@macro separate-arg 
separate 
@end macro
@footnotestyle end
@footnotestyle separate 

@macro on-arg 
on
@end macro
@macro off-arg 
off
@end macro
@frenchspacing on
@frenchspacing off

@c accepts 10 or 11
@macro ten 
10
@end macro
@fonttextsize 10
@c accept false or true
@macro false-arg 
false
@end macro
@macro true-arg
true
@end macro
@allowcodebreaks false

@allowcodebreaks true

@macro page-macro 
@page
@end macro
@macro noindent-macro 
@noindent
@end macro
@macro refill-macro 
@refill
@end macro

@@page @page
@@noindent @noindent @@refill @refill something

@noindent     noindent at beginning of line
@noindent
noindent on the preceding line
  @noindent    noindent after space at beginning of line
@page
@page
After page on its own line.

@@page @page
two spaces   @@noindent @noindent    @@refill @refill

@macro contents-macro 
@contents
@end macro
@contents

@vskip @atext{}

@macro cropmarks-macro
@cropmarks
@end macro
@cropmarks

@macro exdent-macro 
@exdent
@end macro
@exdent line after exdent

@macro two 
2
@end macro
@sp 2

@macro result-macro 
@result
@end macro

@clickstyle @result-macro{}

@menu
* node atext::
@end menu

@node node atext
@chapter chapter

@contents

@macro shortcontents-macro 
@shortcontents
@end macro
@shortcontents

@macro bye-macro
@bye
@end macro

@bye
';


$result_texts{'macro_in_misc_commands'} = '

top atext
*********
Comment like: atext
-------------------

Text line followed by a comment on the same line and another below 

documentlanguage 
documentlanguage on its line
line following documentlanguage







@definfoenclose phoo,//,\\\\  
bar


bar


very strong


 is it really strong? 

something before kbdinputstyle


truc

example








@page @noindent @refill  something

noindent at beginning of line
noindent on the preceding line
  noindent after space at beginning of line
After page on its own line.

@page two spaces   @noindent @refill 




line after exdent






* node atext::

1 chapter
*********




';

$result_sectioning{'macro_in_misc_commands'} = {
  'level' => -1,
  'section_childs' => [
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
      'section_childs' => [
        {
          'cmdname' => 'chapter',
          'extra' => {
            'associated_node' => {
              'cmdname' => 'node',
              'extra' => {
                'normalized' => 'node-atext'
              }
            }
          },
          'level' => 1,
          'number' => 1,
          'section_up' => {},
          'toplevel_prev' => {},
          'toplevel_up' => {}
        }
      ],
      'section_up' => {}
    }
  ]
};
$result_sectioning{'macro_in_misc_commands'}{'section_childs'}[0]{'section_childs'}[0]{'section_up'} = $result_sectioning{'macro_in_misc_commands'}{'section_childs'}[0];
$result_sectioning{'macro_in_misc_commands'}{'section_childs'}[0]{'section_childs'}[0]{'toplevel_prev'} = $result_sectioning{'macro_in_misc_commands'}{'section_childs'}[0];
$result_sectioning{'macro_in_misc_commands'}{'section_childs'}[0]{'section_childs'}[0]{'toplevel_up'} = $result_sectioning{'macro_in_misc_commands'}{'section_childs'}[0];
$result_sectioning{'macro_in_misc_commands'}{'section_childs'}[0]{'section_up'} = $result_sectioning{'macro_in_misc_commands'};

$result_nodes{'macro_in_misc_commands'} = {
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
      'associated_section' => {
        'cmdname' => 'chapter',
        'extra' => {},
        'level' => 1,
        'number' => 1
      },
      'normalized' => 'node-atext'
    },
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
$result_nodes{'macro_in_misc_commands'}{'menu_child'}{'node_prev'} = $result_nodes{'macro_in_misc_commands'};
$result_nodes{'macro_in_misc_commands'}{'menu_child'}{'node_up'} = $result_nodes{'macro_in_misc_commands'};
$result_nodes{'macro_in_misc_commands'}{'menus'}[0]{'extra'}{'end_command'}{'extra'}{'command'} = $result_nodes{'macro_in_misc_commands'}{'menus'}[0];
$result_nodes{'macro_in_misc_commands'}{'node_next'} = $result_nodes{'macro_in_misc_commands'}{'menu_child'};
$result_nodes{'macro_in_misc_commands'}{'node_up'}{'extra'}{'top_node_up'} = $result_nodes{'macro_in_misc_commands'};

$result_menus{'macro_in_misc_commands'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'menu_child' => {
    'cmdname' => 'node',
    'extra' => {
      'normalized' => 'node-atext'
    },
    'menu_up' => {},
    'menu_up_hash' => {
      'Top' => 1
    }
  }
};
$result_menus{'macro_in_misc_commands'}{'menu_child'}{'menu_up'} = $result_menus{'macro_in_misc_commands'};

$result_errors{'macro_in_misc_commands'} = [
  {
    'error_line' => ':23: warning: @documentlanguage should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 23,
    'macro' => '',
    'text' => '@documentlanguage should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':39: Bad argument to @headings: on line following headings atext
',
    'file_name' => '',
    'line_nr' => 39,
    'macro' => '',
    'text' => 'Bad argument to @headings: on line following headings atext',
    'type' => 'error'
  },
  {
    'error_line' => ':58: warning: @definfoenclose should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 58,
    'macro' => '',
    'text' => '@definfoenclose should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':125: warning: Multiple @footnotestyle
',
    'file_name' => '',
    'line_nr' => 125,
    'macro' => '',
    'text' => 'Multiple @footnotestyle',
    'type' => 'warning'
  },
  {
    'error_line' => ':162: warning: @page should only appear at a line beginning (possibly involving @page-macro)
',
    'file_name' => '',
    'line_nr' => 162,
    'macro' => 'page-macro',
    'text' => '@page should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':173: warning: @page should only appear at a line beginning (possibly involving @page-macro)
',
    'file_name' => '',
    'line_nr' => 173,
    'macro' => 'page-macro',
    'text' => '@page should only appear at a line beginning',
    'type' => 'warning'
  }
];


1;
