use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'simple_menu'} = {
  'contents' => [
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
          'contents' => [
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
                      'text' => '(ggg)'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_node'
                },
                {
                  'parent' => {},
                  'text' => ':: ',
                  'type' => 'menu_entry_separator'
                }
              ],
              'extra' => {
                'menu_entry_description' => {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'description
'
                        }
                      ],
                      'parent' => {},
                      'type' => 'preformatted'
                    },
                    {
                      'cmdname' => 'itemize',
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
                          'cmdname' => 'item',
                          'contents' => [
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
                                  'text' => 'idescr
'
                                }
                              ],
                              'parent' => {},
                              'type' => 'preformatted'
                            }
                          ],
                          'extra' => {
                            'item_number' => 1
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
                                  'text' => 'itemize'
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
                            'command_argument' => 'itemize',
                            'text_arg' => 'itemize'
                          },
                          'line_nr' => {
                            'file_name' => '',
                            'line_nr' => 5,
                            'macro' => ''
                          },
                          'parent' => {}
                        }
                      ],
                      'extra' => {
                        'block_command_line_contents' => [
                          [
                            {
                              'cmdname' => 'bullet',
                              'parent' => {},
                              'type' => 'command_as_argument'
                            }
                          ]
                        ],
                        'command_as_argument' => {},
                        'end_command' => {}
                      },
                      'line_nr' => {
                        'file_name' => '',
                        'line_nr' => 3,
                        'macro' => ''
                      },
                      'parent' => {}
                    },
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'AAA
'
                        },
                        {
                          'parent' => {},
                          'text' => '
',
                          'type' => 'after_description_line'
                        },
                        {
                          'parent' => {},
                          'text' => 'CCC
'
                        },
                        {
                          'parent' => {},
                          'text' => '
',
                          'type' => 'empty_line'
                        }
                      ],
                      'parent' => {},
                      'type' => 'preformatted'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_description'
                },
                'menu_entry_node' => {
                  'manual_content' => [
                    {
                      'parent' => {},
                      'text' => 'ggg'
                    }
                  ]
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 2,
                'macro' => ''
              },
              'parent' => {},
              'type' => 'menu_entry'
            },
            {}
          ],
          'parent' => {},
          'type' => 'preformatted'
        },
        {},
        {},
        {
          'cmdname' => 'itemize',
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
              'cmdname' => 'item',
              'contents' => [
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
                      'text' => 'iaa
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'preformatted'
                }
              ],
              'extra' => {
                'item_number' => 1
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 11,
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
                      'text' => 'itemize'
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
                'command_argument' => 'itemize',
                'text_arg' => 'itemize'
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 12,
                'macro' => ''
              },
              'parent' => {}
            }
          ],
          'extra' => {
            'block_command_line_contents' => [
              [
                {
                  'cmdname' => 'bullet',
                  'parent' => {},
                  'type' => 'command_as_argument'
                }
              ]
            ],
            'command_as_argument' => {},
            'end_command' => {}
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 10,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => '
',
              'type' => 'empty_line'
            },
            {
              'parent' => {},
              'text' => 'BBB
'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'empty_line'
            }
          ],
          'parent' => {},
          'type' => 'preformatted'
        },
        {
          'cmdname' => 'itemize',
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
              'cmdname' => 'item',
              'contents' => [
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
                      'text' => 'ibb
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'preformatted'
                }
              ],
              'extra' => {
                'item_number' => 1
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 17,
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
                      'text' => 'itemize'
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
                'command_argument' => 'itemize',
                'text_arg' => 'itemize'
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 18,
                'macro' => ''
              },
              'parent' => {}
            }
          ],
          'extra' => {
            'block_command_line_contents' => [
              [
                {
                  'cmdname' => 'bullet',
                  'parent' => {},
                  'type' => 'command_as_argument'
                }
              ]
            ],
            'command_as_argument' => {},
            'end_command' => {}
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 16,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'contents' => [
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
                      'text' => '(manual)'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_node'
                },
                {
                  'parent' => {},
                  'text' => '::',
                  'type' => 'menu_entry_separator'
                }
              ],
              'extra' => {
                'menu_entry_description' => {
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
                },
                'menu_entry_node' => {
                  'manual_content' => [
                    {
                      'parent' => {},
                      'text' => 'manual'
                    }
                  ]
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 19,
                'macro' => ''
              },
              'parent' => {},
              'type' => 'menu_entry'
            },
            {},
            {
              'parent' => {},
              'text' => '
',
              'type' => 'after_description_line'
            },
            {
              'parent' => {},
              'text' => 'comment
'
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
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => '(after_comment)'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_node'
                },
                {
                  'parent' => {},
                  'text' => ':: ',
                  'type' => 'menu_entry_separator'
                }
              ],
              'extra' => {
                'menu_entry_description' => {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'description
'
                        },
                        {
                          'parent' => {},
                          'text' => 'in description
'
                        }
                      ],
                      'parent' => {},
                      'type' => 'preformatted'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_description'
                },
                'menu_entry_node' => {
                  'manual_content' => [
                    {
                      'parent' => {},
                      'text' => 'after_comment'
                    }
                  ]
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 23,
                'macro' => ''
              },
              'parent' => {},
              'type' => 'menu_entry'
            },
            {},
            {},
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
                      'text' => '(after_description)'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_node'
                },
                {
                  'parent' => {},
                  'text' => '::',
                  'type' => 'menu_entry_separator'
                }
              ],
              'extra' => {
                'menu_entry_description' => {
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
                },
                'menu_entry_node' => {
                  'manual_content' => [
                    {
                      'parent' => {},
                      'text' => 'after_description'
                    }
                  ]
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 25,
                'macro' => ''
              },
              'parent' => {},
              'type' => 'menu_entry'
            },
            {},
            {
              'parent' => {},
              'text' => '
',
              'type' => 'after_description_line'
            }
          ],
          'parent' => {},
          'type' => 'preformatted'
        },
        {
          'cmdname' => 'detailmenu',
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
                      'parent' => {},
                      'text' => '* ',
                      'type' => 'menu_entry_leading_text'
                    },
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => '(detailggg)'
                        }
                      ],
                      'parent' => {},
                      'type' => 'menu_entry_node'
                    },
                    {
                      'parent' => {},
                      'text' => ':: ',
                      'type' => 'menu_entry_separator'
                    }
                  ],
                  'extra' => {
                    'menu_entry_description' => {
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'detaildescription
'
                            }
                          ],
                          'parent' => {},
                          'type' => 'preformatted'
                        },
                        {
                          'cmdname' => 'itemize',
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
                              'cmdname' => 'item',
                              'contents' => [
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
                                      'text' => 'idetaildescr
'
                                    }
                                  ],
                                  'parent' => {},
                                  'type' => 'preformatted'
                                }
                              ],
                              'extra' => {
                                'item_number' => 1
                              },
                              'line_nr' => {
                                'file_name' => '',
                                'line_nr' => 30,
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
                                      'text' => 'itemize'
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
                                'command_argument' => 'itemize',
                                'text_arg' => 'itemize'
                              },
                              'line_nr' => {
                                'file_name' => '',
                                'line_nr' => 31,
                                'macro' => ''
                              },
                              'parent' => {}
                            }
                          ],
                          'extra' => {
                            'block_command_line_contents' => [
                              [
                                {
                                  'cmdname' => 'bullet',
                                  'parent' => {},
                                  'type' => 'command_as_argument'
                                }
                              ]
                            ],
                            'command_as_argument' => {},
                            'end_command' => {}
                          },
                          'line_nr' => {
                            'file_name' => '',
                            'line_nr' => 29,
                            'macro' => ''
                          },
                          'parent' => {}
                        },
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'detailAAA
'
                            },
                            {
                              'parent' => {},
                              'text' => '
',
                              'type' => 'after_description_line'
                            },
                            {
                              'parent' => {},
                              'text' => 'detailCCC
'
                            },
                            {
                              'parent' => {},
                              'text' => '
',
                              'type' => 'empty_line'
                            }
                          ],
                          'parent' => {},
                          'type' => 'preformatted'
                        }
                      ],
                      'parent' => {},
                      'type' => 'menu_entry_description'
                    },
                    'menu_entry_node' => {
                      'manual_content' => [
                        {
                          'parent' => {},
                          'text' => 'detailggg'
                        }
                      ]
                    }
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 28,
                    'macro' => ''
                  },
                  'parent' => {},
                  'type' => 'menu_entry'
                },
                {}
              ],
              'parent' => {},
              'type' => 'preformatted'
            },
            {},
            {},
            {
              'cmdname' => 'itemize',
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
                  'cmdname' => 'item',
                  'contents' => [
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
                          'text' => 'detailiaa
'
                        }
                      ],
                      'parent' => {},
                      'type' => 'preformatted'
                    }
                  ],
                  'extra' => {
                    'item_number' => 1
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 37,
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
                          'text' => 'itemize'
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
                    'command_argument' => 'itemize',
                    'text_arg' => 'itemize'
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 38,
                    'macro' => ''
                  },
                  'parent' => {}
                }
              ],
              'extra' => {
                'block_command_line_contents' => [
                  [
                    {
                      'cmdname' => 'bullet',
                      'parent' => {},
                      'type' => 'command_as_argument'
                    }
                  ]
                ],
                'command_as_argument' => {},
                'end_command' => {}
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 36,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line'
                },
                {
                  'parent' => {},
                  'text' => 'detailBBB
'
                },
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line'
                }
              ],
              'parent' => {},
              'type' => 'preformatted'
            },
            {
              'cmdname' => 'itemize',
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
                  'cmdname' => 'item',
                  'contents' => [
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
                          'text' => 'detailibb
'
                        }
                      ],
                      'parent' => {},
                      'type' => 'preformatted'
                    }
                  ],
                  'extra' => {
                    'item_number' => 1
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 43,
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
                          'text' => 'itemize'
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
                    'command_argument' => 'itemize',
                    'text_arg' => 'itemize'
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 44,
                    'macro' => ''
                  },
                  'parent' => {}
                }
              ],
              'extra' => {
                'block_command_line_contents' => [
                  [
                    {
                      'cmdname' => 'bullet',
                      'parent' => {},
                      'type' => 'command_as_argument'
                    }
                  ]
                ],
                'command_as_argument' => {},
                'end_command' => {}
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 42,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'contents' => [
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
                          'text' => '(detailmanual)'
                        }
                      ],
                      'parent' => {},
                      'type' => 'menu_entry_node'
                    },
                    {
                      'parent' => {},
                      'text' => '::',
                      'type' => 'menu_entry_separator'
                    }
                  ],
                  'extra' => {
                    'menu_entry_description' => {
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
                    },
                    'menu_entry_node' => {
                      'manual_content' => [
                        {
                          'parent' => {},
                          'text' => 'detailmanual'
                        }
                      ]
                    }
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 45,
                    'macro' => ''
                  },
                  'parent' => {},
                  'type' => 'menu_entry'
                },
                {},
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'after_description_line'
                },
                {
                  'parent' => {},
                  'text' => 'detailcomment
'
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
                      'text' => '* ',
                      'type' => 'menu_entry_leading_text'
                    },
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => '(detailafter_comment)'
                        }
                      ],
                      'parent' => {},
                      'type' => 'menu_entry_node'
                    },
                    {
                      'parent' => {},
                      'text' => ':: ',
                      'type' => 'menu_entry_separator'
                    }
                  ],
                  'extra' => {
                    'menu_entry_description' => {
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'detaildescription
'
                            },
                            {
                              'parent' => {},
                              'text' => 'in detaildescription
'
                            }
                          ],
                          'parent' => {},
                          'type' => 'preformatted'
                        }
                      ],
                      'parent' => {},
                      'type' => 'menu_entry_description'
                    },
                    'menu_entry_node' => {
                      'manual_content' => [
                        {
                          'parent' => {},
                          'text' => 'detailafter_comment'
                        }
                      ]
                    }
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 49,
                    'macro' => ''
                  },
                  'parent' => {},
                  'type' => 'menu_entry'
                },
                {},
                {},
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
                          'text' => '(detailafter_description)'
                        }
                      ],
                      'parent' => {},
                      'type' => 'menu_entry_node'
                    },
                    {
                      'parent' => {},
                      'text' => '::',
                      'type' => 'menu_entry_separator'
                    }
                  ],
                  'extra' => {
                    'menu_entry_description' => {
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
                    },
                    'menu_entry_node' => {
                      'manual_content' => [
                        {
                          'parent' => {},
                          'text' => 'detailafter_description'
                        }
                      ]
                    }
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 51,
                    'macro' => ''
                  },
                  'parent' => {},
                  'type' => 'menu_entry'
                },
                {},
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'after_description_line'
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
                      'text' => 'detailmenu'
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
                'command_argument' => 'detailmenu',
                'text_arg' => 'detailmenu'
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 53,
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
            'line_nr' => 27,
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
            'line_nr' => 54,
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
        'line_nr' => 1,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'simple_menu'}{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'args'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'args'}[2]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[2];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[2];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[2]{'extra'}{'command'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'extra'}{'block_command_line_contents'}[0][0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'extra'}{'command_as_argument'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'extra'}{'block_command_line_contents'}[0][0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[2];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[2];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[2];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[2];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[2];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[2]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_node'}{'manual_content'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'args'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[1] = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[0]{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[2] = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[3] = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[2];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'extra'}{'command'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[4];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[4];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[4]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[4]{'contents'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[4]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[4]{'contents'}[1]{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[4]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[4]{'contents'}[1]{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[4]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[4]{'contents'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[4];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[4]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[4]{'contents'}[2];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[4]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[4]{'contents'}[2]{'args'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[4]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[4]{'contents'}[2]{'args'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[4]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[4]{'contents'}[2]{'args'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[4]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[4]{'contents'}[2];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[4]{'contents'}[2]{'extra'}{'command'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[4];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[4];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[4]{'extra'}{'block_command_line_contents'}[0][0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[4];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[4]{'extra'}{'command_as_argument'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[4]{'extra'}{'block_command_line_contents'}[0][0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[4]{'extra'}{'end_command'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[4]{'contents'}[2];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[5];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[5];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[5]{'contents'}[2]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[5];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[5]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[6]{'contents'}[0]{'extra'}{'command'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[6];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[6];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[6]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[6]{'contents'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[6]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[6]{'contents'}[1]{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[6]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[6]{'contents'}[1]{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[6]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[6]{'contents'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[6];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[6]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[6]{'contents'}[2];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[6]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[6]{'contents'}[2]{'args'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[6]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[6]{'contents'}[2]{'args'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[6]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[6]{'contents'}[2]{'args'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[6]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[6]{'contents'}[2];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[6]{'contents'}[2]{'extra'}{'command'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[6];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[6]{'contents'}[2]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[6];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[6]{'extra'}{'block_command_line_contents'}[0][0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[6];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[6]{'extra'}{'command_as_argument'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[6]{'extra'}{'block_command_line_contents'}[0][0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[6]{'extra'}{'end_command'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[6]{'contents'}[2];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[6]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[0]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[0]{'args'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[0]{'args'}[2]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[0]{'extra'}{'menu_entry_description'}{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[0]{'extra'}{'menu_entry_node'}{'manual_content'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[0]{'args'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[1] = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[0]{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[2]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[3]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[4]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[5];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[5]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[5]{'args'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[5]{'args'}[1]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[5];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[5]{'args'}[2]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[5];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[5]{'extra'}{'menu_entry_description'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[5]{'extra'}{'menu_entry_description'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[5]{'extra'}{'menu_entry_description'}{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[5]{'extra'}{'menu_entry_description'}{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[5];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[5]{'extra'}{'menu_entry_node'}{'manual_content'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[5]{'args'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[5]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[6] = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[5]{'extra'}{'menu_entry_description'}{'contents'}[0]{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[7] = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[5]{'extra'}{'menu_entry_description'}{'contents'}[0]{'contents'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[8];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[8]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[8]{'args'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[8]{'args'}[1]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[8];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[8]{'args'}[2]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[8];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[8]{'extra'}{'menu_entry_description'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[8]{'extra'}{'menu_entry_description'}{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[8]{'extra'}{'menu_entry_description'}{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[8];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[8]{'extra'}{'menu_entry_node'}{'manual_content'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[8]{'args'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[8]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[9] = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[8]{'extra'}{'menu_entry_description'}{'contents'}[0]{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'contents'}[10]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[7]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[0]{'extra'}{'command'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'args'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'args'}[2]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[2];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[2];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[2]{'extra'}{'command'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'extra'}{'block_command_line_contents'}[0][0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'extra'}{'command_as_argument'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'extra'}{'block_command_line_contents'}[0][0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'contents'}[2];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[2];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[2];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[2];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[2];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[2]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_node'}{'manual_content'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'args'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[1] = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[0]{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[2] = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[3] = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[2];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[4]{'contents'}[0]{'extra'}{'command'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[4];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[4];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[4]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[4]{'contents'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[4]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[4]{'contents'}[1]{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[4]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[4]{'contents'}[1]{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[4]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[4]{'contents'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[4];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[4]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[4]{'contents'}[2];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[4]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[4]{'contents'}[2]{'args'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[4]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[4]{'contents'}[2]{'args'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[4]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[4]{'contents'}[2]{'args'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[4]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[4]{'contents'}[2];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[4]{'contents'}[2]{'extra'}{'command'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[4];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[4];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[4]{'extra'}{'block_command_line_contents'}[0][0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[4];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[4]{'extra'}{'command_as_argument'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[4]{'extra'}{'block_command_line_contents'}[0][0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[4]{'extra'}{'end_command'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[4]{'contents'}[2];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[4]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[5];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[5]{'contents'}[1]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[5];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[5]{'contents'}[2]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[5];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[5]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[6]{'contents'}[0]{'extra'}{'command'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[6];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[6];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[6]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[6]{'contents'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[6]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[6]{'contents'}[1]{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[6]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[6]{'contents'}[1]{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[6]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[6]{'contents'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[6];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[6]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[6]{'contents'}[2];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[6]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[6]{'contents'}[2]{'args'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[6]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[6]{'contents'}[2]{'args'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[6]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[6]{'contents'}[2]{'args'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[6]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[6]{'contents'}[2];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[6]{'contents'}[2]{'extra'}{'command'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[6];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[6]{'contents'}[2]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[6];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[6]{'extra'}{'block_command_line_contents'}[0][0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[6];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[6]{'extra'}{'command_as_argument'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[6]{'extra'}{'block_command_line_contents'}[0][0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[6]{'extra'}{'end_command'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[6]{'contents'}[2];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[6]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[0]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[0]{'args'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[0]{'args'}[2]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[0]{'extra'}{'menu_entry_description'}{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[0]{'extra'}{'menu_entry_node'}{'manual_content'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[0]{'args'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[1] = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[0]{'extra'}{'menu_entry_description'}{'contents'}[0]{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[2]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[3]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[4]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[5];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[5]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[5]{'args'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[5]{'args'}[1]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[5];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[5]{'args'}[2]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[5];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[5]{'extra'}{'menu_entry_description'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[5]{'extra'}{'menu_entry_description'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[5]{'extra'}{'menu_entry_description'}{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[5]{'extra'}{'menu_entry_description'}{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[5];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[5]{'extra'}{'menu_entry_node'}{'manual_content'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[5]{'args'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[5]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[6] = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[5]{'extra'}{'menu_entry_description'}{'contents'}[0]{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[7] = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[5]{'extra'}{'menu_entry_description'}{'contents'}[0]{'contents'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[8];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[8]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[8]{'args'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[8]{'args'}[1]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[8];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[8]{'args'}[2]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[8];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[8]{'extra'}{'menu_entry_description'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[8]{'extra'}{'menu_entry_description'}{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[8]{'extra'}{'menu_entry_description'}{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[8];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[8]{'extra'}{'menu_entry_node'}{'manual_content'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[8]{'args'}[1];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[8]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[9] = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[8]{'extra'}{'menu_entry_description'}{'contents'}[0]{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'contents'}[10]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[7]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[8]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[8];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[8]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[8]{'args'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[8]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[8]{'args'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[8]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[8]{'args'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[8];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[8]{'extra'}{'command'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[8]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'extra'}{'end_command'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'contents'}[8];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[8]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[9]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[9];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[9]{'args'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[9]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[9]{'args'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[9]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[9]{'args'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[9];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[9]{'extra'}{'command'} = $result_trees{'simple_menu'}{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'contents'}[9]{'parent'} = $result_trees{'simple_menu'}{'contents'}[0];
$result_trees{'simple_menu'}{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'simple_menu'}{'contents'}[0]{'contents'}[9];
$result_trees{'simple_menu'}{'contents'}[0]{'parent'} = $result_trees{'simple_menu'};

$result_texis{'simple_menu'} = '@menu
* (ggg):: description
@itemize
@item idescr
@end itemize
AAA

CCC

@itemize
@item iaa
@end itemize

BBB

@itemize
@item ibb
@end itemize
* (manual)::

comment

* (after_comment):: description
in description
* (after_description)::

@detailmenu
* (detailggg):: detaildescription
@itemize
@item idetaildescr
@end itemize
detailAAA

detailCCC

@itemize
@item detailiaa
@end itemize

detailBBB

@itemize
@item detailibb
@end itemize
* (detailmanual)::

detailcomment

* (detailafter_comment):: detaildescription
in detaildescription
* (detailafter_description)::

@end detailmenu
@end menu
';


$result_texts{'simple_menu'} = '* (ggg):: description
idescr
AAA

CCC

iaa

BBB

ibb
* (manual)::

comment

* (after_comment):: description
in description
* (after_description)::

* (detailggg):: detaildescription
idetaildescr
detailAAA

detailCCC

detailiaa

detailBBB

detailibb
* (detailmanual)::

detailcomment

* (detailafter_comment):: detaildescription
in detaildescription
* (detailafter_description)::

';

$result_errors{'simple_menu'} = [
  {
    'error_line' => ':1: @menu seen before first @node
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@menu seen before first @node',
    'type' => 'error'
  },
  {
    'error_line' => ':1: perhaps your @top node should be wrapped in @ifnottex rather than @ifinfo?
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => 'perhaps your @top node should be wrapped in @ifnottex rather than @ifinfo?',
    'type' => 'error continuation'
  },
  {
    'error_line' => ':27: @detailmenu seen before first @node
',
    'file_name' => '',
    'line_nr' => 27,
    'macro' => '',
    'text' => '@detailmenu seen before first @node',
    'type' => 'error'
  },
  {
    'error_line' => ':27: perhaps your @top node should be wrapped in @ifnottex rather than @ifinfo?
',
    'file_name' => '',
    'line_nr' => 27,
    'macro' => '',
    'text' => 'perhaps your @top node should be wrapped in @ifnottex rather than @ifinfo?',
    'type' => 'error continuation'
  }
];



$result_converted{'info'}->{'simple_menu'} = 'This is , produced by tp version from .

* Menu:

* (ggg):: description
   * idescr
AAA

CCC

   * iaa

BBB

   * ibb
* (manual)::

comment

* (after_comment):: description
in description
* (after_description)::

* (detailggg):: detaildescription
   * idetaildescr
detailAAA

detailCCC

   * detailiaa

detailBBB

   * detailibb
* (detailmanual)::

detailcomment

* (detailafter_comment):: detaildescription
in detaildescription
* (detailafter_description)::



Tag Table:

End Tag Table
';

$result_converted_errors{'info'}->{'simple_menu'} = [
  {
    'error_line' => 'warning: Document without nodes.
',
    'text' => 'Document without nodes.',
    'type' => 'warning'
  }
];



$result_converted{'html'}->{'simple_menu'} = '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<div class="menu">
<pre class="menu-preformatted">&bull; <a href="ggg.html#Top" accesskey="1">(ggg)</a>:: description
</pre><ul>
<li> <pre class="menu-preformatted">idescr
</pre></li></ul>
<pre class="menu-preformatted">AAA

CCC

</pre><ul>
<li> <pre class="menu-preformatted">iaa
</pre></li></ul>
<pre class="menu-preformatted">
BBB

</pre><ul>
<li> <pre class="menu-preformatted">ibb
</pre></li></ul>
<pre class="menu-preformatted">&bull; <a href="manual.html#Top" accesskey="2">(manual)</a>::

comment

&bull; <a href="after_comment.html#Top" accesskey="3">(after_comment)</a>:: description
in description
&bull; <a href="after_description.html#Top" accesskey="4">(after_description)</a>::

</pre><pre class="menu-preformatted">&bull; <a href="detailggg.html#Top" accesskey="5">(detailggg)</a>:: detaildescription
</pre><ul>
<li> <pre class="menu-preformatted">idetaildescr
</pre></li></ul>
<pre class="menu-preformatted">detailAAA

detailCCC

</pre><ul>
<li> <pre class="menu-preformatted">detailiaa
</pre></li></ul>
<pre class="menu-preformatted">
detailBBB

</pre><ul>
<li> <pre class="menu-preformatted">detailibb
</pre></li></ul>
<pre class="menu-preformatted">&bull; <a href="detailmanual.html#Top" accesskey="6">(detailmanual)</a>::

detailcomment

&bull; <a href="detailafter_comment.html#Top" accesskey="7">(detailafter_comment)</a>:: detaildescription
in detaildescription
&bull; <a href="detailafter_description.html#Top" accesskey="8">(detailafter_description)</a>::

</pre></div>
<p>


</p>
</body>
</html>
';

$result_converted_errors{'html'}->{'simple_menu'} = [
  {
    'error_line' => 'warning: Must specify a title with a title command or @top
',
    'text' => 'Must specify a title with a title command or @top',
    'type' => 'warning'
  }
];


1;
