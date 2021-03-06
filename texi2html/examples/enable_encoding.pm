# -*-perl-*-
#+##############################################################################
#
# enable_encoding.pm: mimics --enable-encoding
# This is now directly handled in the main program. It is, however different
# from the main program implementation snce this init file is much more
# intrusive (for example it wouldn't work with info, but it would work 
# better for a simple output format when entities are not used).
#
#    Copyright (C) 2008 Free Software Foundation, Inc.
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
# Originally written by Patrice Dumas.
#
#-##############################################################################

use strict;

my $enable_encoding_default_init_out = $init_out;
$init_out = \&enable_encoding_init_out;

# badly interact with --enable-encoding support in info.pm
set_from_init_file('ENABLE_ENCODING', 0);

sub enable_encoding_init_out()
{
  &$enable_encoding_default_init_out();
  # like utf8.pm
  if (get_conf('ENCODING_NAME') eq 'utf-8')
  {
    $normal_text       = \&t2h_utf8_normal_text unless (get_conf('ENABLE_ENCODING_USE_ENTITY'));
    foreach my $key (keys(%unicode_accents), 'dotless')
    {
      $style_map{$key}->{'function'} = \&t2h_utf8_accent;
      $style_map_texi{$key}->{'function'} = \&t2h_utf8_accent;
      $style_map_pre{$key}->{'function'} = \&t2h_utf8_accent;
    }

    foreach my $key (%things_map)
    {
      if (exists($unicode_map{$key}) and ($unicode_map{$key} ne ''))
      {
        $things_map{$key} = chr(hex($unicode_map{$key})) unless (t2h_encoding_is_entity($things_map{$key}));
        $texi_map{$key} = chr(hex($unicode_map{$key})) unless (t2h_encoding_is_entity($texi_map{$key}));
        $sorting_things_map{$key} = chr(hex($unicode_map{$key})) unless (t2h_encoding_is_entity($sorting_things_map{$key}));
        $pre_map{$key} = chr(hex($unicode_map{$key})) unless (t2h_encoding_is_entity($pre_map{$key}));
      }
    }
  }
  elsif (exists($makeinfo_encoding_to_map{get_conf('ENCODING_NAME')}))
  {
    my $enc_map = $makeinfo_encoding_to_map{get_conf('ENCODING_NAME')};
    foreach my $key (keys(%unicode_accents), 'dotless')
    {
      $t2h_enable_encoding_default_accent{'normal'}->{$key} = $style_map{$key}->{'function'};
      $t2h_enable_encoding_default_accent{'texi'}->{$key} = $style_map_texi{$key}->{'function'};
      $t2h_enable_encoding_default_accent{'pre'}->{$key} = $style_map_pre{$key}->{'function'};
      $style_map{$key}->{'function'} = \&t2h_enable_encoding_normal_accent;
      $style_map_texi{$key}->{'function'} = \&t2h_enable_encoding_texi_accent;
      $style_map_pre{$key}->{'function'} = \&t2h_enable_encoding_pre_accent;
    }

    foreach my $key (%things_map)
    {
      if (exists($unicode_map{$key}) and ($unicode_map{$key} ne '') and 
        exists($makeinfo_unicode_to_eight_bit{$enc_map}->{$unicode_map{$key}}))
      { # we let perl handle the conversion
        $things_map{$key} = chr(hex($unicode_map{$key})) unless (t2h_encoding_is_entity($things_map{$key}));
        $texi_map{$key} = chr(hex($unicode_map{$key})) unless (t2h_encoding_is_entity($texi_map{$key}));
        $sorting_things_map{$key} = chr(hex($unicode_map{$key})) unless (t2h_encoding_is_entity($sorting_things_map{$key}));
        $pre_map{$key} = chr(hex($unicode_map{$key})) unless (t2h_encoding_is_entity($pre_map{$key}));
      }
    }
  }
}

1;
