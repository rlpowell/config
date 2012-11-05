#**************************************************************************************
#                       MAINTAINED WITH PUPPET
#                       DO NOT EDIT LOCALLY
#**************************************************************************************


#
# Generic .zshrc file for zsh 2.5
#
# .zshrc is sourced in interactive shells.  It
# should contain commands to set up aliases, functions,
# options, key bindings, etc.
#

# search path for the cd command
cdpath=(. .. ~ ~/src)

# where to look for function definitions
fpath=(~/.zfunc /usr/share/zsh/functions /usr/share/zsh/functions/Zle)

# Put information into the tmux title
function precmd { printf "\033]2;$(uname -n | cut -d . -f 1):${PWD}\033\\" }

# use hard limits, except for a smaller stack and no core dumps
unlimit
#limit stack 8192
#limit core 0
limit -s

umask 022

stty echoe
stty flush '^@'
stty start '^@'
stty stop '^@'

if [ -f "$HOME/bin/agent" ]
then
  . $HOME/bin/agent
fi

stty susp 

# set up aliases
unalias ll
alias screen="screen -U"
alias mv='nocorrect mv -i'    # no spelling correction on mv
alias cp='nocorrect cp -i'    # no spelling correction on cp
alias j=jobs
alias fg='clear ; fg'
alias vim=cvim
alias lh='ll -h'
alias pu=pushd
alias po=popd
alias d='dirs -v'
alias h=history
alias pfl='ps -aef --forest | most'
alias pg='ps -aef | grep '
alias ls='ls -AF --color=auto'
alias la='ls -a'
alias dl='dict -P - -h dict.lojban.org'
alias sl='ssh -e none ls'
#alias z=suspend
#alias x=exit
alias repl='repl -filter ~/.mh_filter -group -nocc me'
alias vcat='cat -v'
if [ -z "`which ncftp 2>&1 | grep 'no' `" ]
then
    alias ftp=ncftp
fi

# shell functions
setenv() 
{ 
	export $1=$2 
}  # csh compatibility

# bigger shell functions to autoload
autoload zed
autoload run-help

# filename completion suffixes to ignore
#fignore=(.o .c~ .old)

# hosts to use for completion
#hosts=($HOSTANME mobius07.math.uwaterloo.ca calum.csclub.uwaterloo.ca)

# set prompts
USER=$(whoami)
HOSTNAME=$(uname -n | sed 's/\..*//')
export PS1="$USER@$HOSTNAME> "
#PROMPT='%m%# '    # default prompt
#RPROMPT=' %~'     # prompt for right side of screen

#Format binary chars in less in an octal fashion
export LESSBINFMT='*d\%o'
export MAILCALL='NEW MAIL! '
export YOUSAID='In %C you wrote:'
export ATTRIBUTION='%f wrote:'
export LESS=-eM
export PAGER=less
#export HELPDIR=/usr/local/lib/zsh/help  # directory for run-help function to find docs
#export NETHACKOPTIONS="name:Turgul-W,hilite_pet,nocolor,number_pad,fruit:Pear,noautopickup,nolegacy,rest_on_space,time,showexp,showscore"
#export SCREENDIR=$HOME/.screen
#export HUNT="name=JaDur,team=7,scan,nobeep"
#export IRCSERVER="irc.digitalkingdom.org irc.paganpaths.org"

MAILCHECK=300
DIRSTACKSIZE=30

# set/unset  shell options
setopt   notify globdots correct pushdtohome cdablevars autolist
setopt   sunkeyboardhack correctall autocd recexact longlistjobs
setopt   autoresume pushdsilent noclobber
setopt   autopushd pushdminus extendedglob rcquotes mailwarning
setopt   automenu sunkeyboardhack RM_STAR_WAIT
setopt   notify

# History settings
setopt INC_APPEND_HISTORY APPEND_HISTORY EXTENDED_HISTORY HIST_FIND_NO_DUPS
export SAVEHIST=30000
export HISTSIZE=30000
export HISTFILE=$HOME/.zhistory

unsetopt rmstarsilent
unsetopt bgnice
unsetopt EXTENDED_GLOB 

WATCHFMT='%n %a %l from %m at %t.'
LOGCHECK=0

bindkey -v       # vi key bindings

# hit v to run the whole thing in your editor
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

#setenv HOST `hostname`
setenv USER `whoami`
setenv ARCH `uname -r`

eclean()
{
    (rm .[a-zA-Z0-9]*~;rm *~) >&/dev/null
}

# The following is used to find out if a particular
# program exists:
# consider if [ -n "`exists showpath`" ]
# if showpath exists, the if part will be executed,
# if it does not, the else part will be.

exists()
{
    which $1 | grep -v no 
}

if [ -e ~/.zshrc_local ]
then
	. ~/.zshrc_local
fi
