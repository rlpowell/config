use strict;
use vars qw($VERSION %IRSSI);

use Irssi;
$VERSION = '1.00';
%IRSSI = (
    authors     => 'Robin Lee Powell',
    contact     => 'rlpowell@digitalkingdom.org',
    name        => 'Beeper (AKA Repeat Notifications)',
    description => 'This script will continue emitting bells when any window has un-noticed activity, forever.  It can also be used to complain about activity when idle.',
    license     => 'WTFPL Version 2 (although attribution is certainly appreciated!)',
);


my $help=<<EOF;
The goal of this script is to ensure that important conversations
(work, for example) are never missed.  It has various conditions
under which it runs irssi's bell command (which means that scripts
that override the bell should work in conjunction with this one).

Commands

Manage the list of things to repeatedly notify about; actual
behaviour is entirely due to the flags.  Note that each channel can
have more than one flag set.

  beeper add <channel> <flag set>
  beeper del <channel> <flag set>  (deletes just this flag set)
  beeper del <channel>             (deletes all flag sets for this channel)
  beeper list
  beeper clear                     (clears all flag sets)
  beeper quiet                     (stops active alerts)

Examples

  beeper add #jbopre a
  beeper add #jbopre hi

Variables

  beeper_idle

      This variable indicates, in seconds, how long you have to be
      idle (idle means not interacting with irssi at all) to count
      for purposes of the i and c flags.

  beeper_delay

      This variable indicates, in seconds, how much time there should be between
      beeps.

Flag Sets

  A flag set is a flag plus one or more modifiers.  A channel can
  have many flag sets (although there aren't that many to have! :).

Flags

No more than one flag can appear in each flag set.

  a (for 'a'ctivity)
      Any channel with this flag will produce notifications when
      activity is registered, until and unless it becomes the
      active window.  This uses the usual activity_msg_level
      variable.

      This flag has no effect on whatever channel is currently in
      the active window, partly because making that window active
      is how you let the script know to stop beeping, and partly
      because irssi's concept of "activity" only applies to other
      windows.

  h (for 'h'ilight)

      Same as notify_activiy, but only beeps on hilight, not on
      any activity.

Flag Modifiers

A modifier must appear with a flag.  Multiple modifiers are
allowed (but currently pointless, as c implies i).

  c (for 'c'urrent window)

      Modifies the behaviour of the flag to affect only the active
      window.  As such, the only way the script has to know that
      you've been notified is whether or not you are idle, so the c
      modifier automatically sets the i modifier.

  i (for idle)
      
      Modifies the behaviour of the flag to cause notifications
      only when you are idle.
EOF

#****************************************

# Utility

sub clean {
  my $string = lc(shift);

  # trim whitespace
  $string =~ s/^\s+//;
  $string =~ s/\s+$//g;

  return $string;
}

sub uniq {
  return keys %{{ map { $_ => 1 } @_ }};
}

#****************************************

# Manage the settings variable.  This is called beeper_channels, and
# it's a space seperated list of blobs; each blob is
# channel,flag set,flag set,...
#
# So this: #lojban,foo,bar Tene,baz
# Becomes: $VAR1 = { '#lojban' => [ 'foo', 'bar' ], 'tene' => [ 'baz' ] };

my %channels;

sub reload_settings {
  my @channels = split '\s+', Irssi::settings_get_str('beeper_channels');
  %channels = map {
    my @bits = split '\s*,\s*', $_;
    my $channel = shift @bits;
    clean($channel) => \@bits;
  } @channels;

  # use Data::Dumper;
  # Irssi::print "reload chan: ".Dumper(\%channels);
}

Irssi::settings_add_str('beeper', 'beeper_channels', '');

Irssi::signal_add('setup changed', \&reload_settings);

# Initialize %channels
reload_settings();

sub save_channels {
  use Data::Dumper;
  my @bits;
  foreach (keys %channels) {
    if (exists $channels{$_} and defined $channels{$_}) {
      push @bits, join ',', ($_, @{$channels{$_}})
    }
  };
  my $channels = join ' ', @bits;

  # Irssi::print "save chan: $channels";

  Irssi::settings_set_str('beeper_channels', $channels);
}

sub beeper_clear {
  %channels = ();
  save_channels();
}

# The other settings variable; the user manages this themselves.
Irssi::settings_add_int('beeper', 'beeper_idle', 180);
Irssi::settings_add_int('beeper', 'beeper_delay', 5);

#****************************************

# Settings-related commands
  
Irssi::command_bind("beeper quiet", \&beeper_quiet);
Irssi::command_bind("beeper clear", \&beeper_clear);
Irssi::command_bind("beeper list", \&beeper_list);
Irssi::command_bind("beeper add", \&beeper_add);
Irssi::command_bind("beeper del", \&beeper_del);
Irssi::command_bind("beeper help", \&beeper_help);
Irssi::command_bind("beeper", \&beeper_handler);

sub beeper_handler {
  my ($data, $server, $item) = @_;
  $data = clean($data);

  my $type = (split '\s+', $data )[0];

  # Print help as necessary
  if ($type !~ m{^(list|add|del|clear|quiet)}i) {
    beeper_help();
    return;
  }
  # Irssi::print("Beeper args is $data.");

  Irssi::command_runsub('beeper', $data, $server, $item);

  save_channels();
}

sub beeper_list {
  Irssi::print("Beeper Flag Sets:");
  map {
    Irssi::print("Channel/window $_ is being monitored with flag sets: " . (join ', ', @{$channels{$_}}));
  } (keys %channels);
}

sub beeper_add {
  my ($data, $server, $item) = @_;

  my ($channel, $flags) = (split m{\s+}, $data);

  if (! $channel || ! $flags) {
    Irssi::print(qq{\nError: "/beeper add" needs both a channel and a flag set; see /help beeper\n});
    Irssi::signal_stop;
    return;
  }

  if ($flags !~ m{^[ahci]+$}) {
    Irssi::print(qq{\nError: "$flags" is not a valid flag set; see /help beeper\n});
    Irssi::signal_stop;
    return;
  }

  if ($flags =~ m{a} && $flags =~ m{h} ) {
    Irssi::print(qq{\nError: can't have both a and h at the same time; see /help beeper\n});
    Irssi::signal_stop;
    return;
  }

  if (not exists $channels{$channel}) {
    $channels{$channel} = [ ];
  }

  push @{$channels{$channel}}, $flags;

  $channels{$channel} = [ sort( uniq(@{$channels{$channel}}) ) ];

  # use Data::Dumper;
  # Irssi::print "beeper add: ".Dumper(\%channels);
}

sub beeper_del {
  my ($data, $server, $item) = @_;

  my ($channel, $flags) = (split m{\s+}, $data);

  if (not $channel ) {
    Irssi::print(qq{\nError: "/beeper del" needs at least a channel, and optionally a flag set; see /help beeper\n});
    Irssi::signal_stop;
    return;
  }

  if (not exists $channels{$channel}) {
    Irssi::print(qq{\nError: channel/window "$channel" does not exist.\n});
    Irssi::signal_stop;
    return;
  }

  if (not $flags) {
    delete $channels{$channel};
  } else {
    my @newchan = grep { $_ ne $flags } @{$channels{$channel}};
    $channels{$channel} = \@newchan;
  }

  # use Data::Dumper;
  # Irssi::print "beeper del: ".Dumper(\%channels);
}

#****************************************

# Help related commands

sub beeper_help {
  Irssi::print($help, MSGLEVEL_CLIENTCRAP);
  Irssi::signal_stop;
}

Irssi::command_bind('help', sub {
    my $check = clean($_[0]);
    if ($check eq 'beeper') {
      beeper_help();
    }
  }
);

#****************************************

# General functionality

my $last_activity = 0;

my %alerts;

sub reset_idle {
  # Irssi::print "activity";
  $last_activity = time;

  my $wname = clean(Irssi::active_win()->get_active_name());
  if (exists $alerts{$wname}) {
    # Irssi::print "unidled: clearing alert for $wname";
    Irssi::timeout_remove($alerts{$wname});
    delete $alerts{$wname};
  }
};

sub beeper_quiet {
  foreach my $alert (keys %alerts) {
    # Irssi::print "clearing alert for $alert";
    Irssi::timeout_remove($alerts{$alert});
    delete $alerts{$alert};
  }
}

sub beep {
  # use Data::Dumper;
  # Irssi::print "beep: ".Dumper(\%alerts);
  Irssi::signal_emit('beep');
}

sub is_active_window {
  my $name = clean(shift);

  my $wname = clean(Irssi::active_win()->get_active_name());

  # Irssi::print "is_active_window: ".($name eq $wname);

  return ($name eq $wname);
}

sub handle_window_change {
  my $wname = clean(Irssi::active_win()->get_active_name());

  # use Data::Dumper;
  # Irssi::print "window change: $wname";

  if (exists $alerts{$wname}) {
    # Irssi::print "window change: clearing alert for $wname";
    Irssi::timeout_remove($alerts{$wname});
    delete $alerts{$wname};
  }
}

sub is_idle {
  my $idle = Irssi::settings_get_int('beeper_idle');
  # Irssi::print "idle: $idle, ".(time - $last_activity);
  return ( (time - $last_activity) > $idle );
}

# Given a window name and a list of flag sets, returns true if the
# idle time aspects of the current situation do not prevent us from
# beeping.
#
# In other words, returns true immediately if:
#
# 1. There are no idle time related flags and the window is *not*
# the current one.
#
# 2. There is a c flag, the window is the current one, and we are in
# fact idle.
#
# 3. There is an i flag, and we are in fact idle.
#
#
sub is_idle_enough {
  my $wname = shift;

  # If we have any relevant flags, continue, otherwise idle time is
  # not relevant, so return true.
  if (grep { m{[ic]} } @_) {
    # Perform c flags
    if (grep { m{c} } @_) {
      # Irssi::print "is_idle_enough: c flag applies";
      return (is_active_window($wname) && is_idle());
    }
    # If we're still here, no c flags
    if (grep { m{i} } @_) {
      # Irssi::print "is_idle_enough: i flag applies";
      return is_idle();
    }

  } else {
    # Irssi::print "is_idle_enough: no idle flags: ".(not is_active_window($wname));

    # No idle flags; we're OK if it's not the active window
    return (not is_active_window($wname));
  }

  return 0;
}

#****************************************

# HANDLING THE FLAGS

sub to_beep_or_not_to_beep {
  my $name = shift;
  my @flag_sets = @_;

  if (is_idle_enough($name, @flag_sets)) {

    # Irssi::print "starting to beep";

    my $delay = Irssi::settings_get_int('beeper_delay');
    $alerts{$name} = Irssi::timeout_add 1000*$delay, 'beep', undef
  }
}

sub handle_text {
  my $item = shift;
  my ($fg, $bg, $flags, $text, $dest) = @_;

  if ($item) {
    my $name = $item->get_active_name();

    if ($name and $name ne '(status)') {

      # In case we print something; responding to our own prints
      # might get bad.
      Irssi::signal_remove('gui print text', 'handle_text');

      #  use Data::Dumper;
      #  Irssi::print "print text: ".Dumper(\@_);
      #  Irssi::print "print text: fg: ".Dumper($fg);
      #  Irssi::print "print text: bg: ".Dumper($bg);
      #  Irssi::print "print text: flags: ".Dumper($flags);
      #  Irssi::print "print text: text: ".Dumper($text);
      #  Irssi::print "print text: dest: ".Dumper($dest);
      #  Irssi::print "print text: $name, $text";
      #  Irssi::print "print text level: ".Irssi::bits2level($dest->{'level'});
      #  Irssi::print "print text level hi: ".($dest->{'level'} & Irssi::MSGLEVEL_HILIGHT());
      #  Irssi::print "print text level pub: ".($dest->{'level'} & Irssi::MSGLEVEL_PUBLIC());
      #  Irssi::print "print text level aml: ".Irssi::settings_get_level('activity_msg_level');
      #  Irssi::print "print text level aml2: ".($dest->{'level'} & Irssi::settings_get_level('activity_msg_level') );

      if ($channels{$name} and not exists $alerts{$name} ) {
        # Handle the a flag, if any
        my @flag_sets = grep { m{a} } @{$channels{$name}};

        if (@flag_sets) {
          # Use the normal activity_msg_level variable to see if we've
          # got interesting activity as the user sees it.
          my $activity_match = ($dest->{'level'} & Irssi::settings_get_level('activity_msg_level') );
          if ($activity_match) { to_beep_or_not_to_beep( $name, @flag_sets); }
        }

        # Handle the h flag, if any
        my @flag_sets = grep { m{h} } @{$channels{$name}};

        if (@flag_sets) {
          # Is it highlighted?
          my $activity_match = ($dest->{'level'} & Irssi::MSGLEVEL_HILIGHT());
          if ($activity_match) { to_beep_or_not_to_beep( $name, @flag_sets); }
        }
      }

      Irssi::signal_add_last('gui print text', 'handle_text');
    }
  }
}

#****************************************

# Functionality setup
Irssi::signal_add_last('gui print text', 'handle_text');
Irssi::signal_add_last('window changed', 'handle_window_change');
Irssi::signal_add_last('gui key pressed', 'reset_idle');
