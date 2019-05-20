# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

if [[ -f /etc/bash.bashrc ]] ; then
    source /etc/bash.bashrc
fi
 
 
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
 
# append to the history file, don't overwrite it
shopt -s histappend
 
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
 
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
 
# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar
 
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
 
# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
 
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac
 
# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes
 
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi
 
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt
 
# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac
 
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
 
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
 
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
 
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
 
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
 
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
 
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Added by Canopy installer on 2015-01-19
# VIRTUAL_ENV_DISABLE_PROMPT can be set to '' to make bashprompt show that Canopy is active, otherwise 1
#VIRTUAL_ENV_DISABLE_PROMPT=1 source /mnt/data/mlisicki/pkgs/enthought/canopy-1.5.1/bin/activate
#VIRTUAL_ENV_DISABLE_PROMPT=1 source /export/mlrg/mlisicki/Enthought/Canopy_64bit/User/bin/activate

# Comment cudnn paths if Theano is used (because of conflicts)
export CUDNN_PATH=$HOME/cudnn71_cuda90
export CUDA_HOME=/usr/local/cuda

export CPATH=$CUDNN_PATH/include:$CPATH
export LD_LIBRARY_PATH=/usr/local/lib:$CUDNN_PATH/lib64:$CUDA_HOME/lib64:$HOME/libffi-3.2/lib:$HOME/python3/lib:$HOME/usr/local/lib
export LIBRARY_PATH=$LD_LIBRARY_PATH
#export LD_PRELOAD=/mnt/data/mlisicki/pkgs/enthought/canopy-1.5.1/lib/libmkl_core.so
export PATH=$HOME/usr/local/bin:$HOME/data/pkgs/mongodb-linux-x86_64-3.0.2/bin:~/src/system_scripts:~/juju/bin:$HOME/src/tools:$HOME/src/pylearn2/pylearn2/scripts::/export/mlrg/mlisicki/data/pkgs/Jobman/bin:$CUDA_HOME/bin:$HOME/python3/bin:$PATH
#export THEANO_FLAGS=mode=FAST_RUN,device=gpu,floatX=float32
export PYLEARN2_DATA_PATH=/mnt/data/mlisicki/pylearn_data
export PYLEARN2_VIEWER_COMMAND="eog"
export PYTHONPATH=.:$HOME/copper/src:$HOME/src:$HOME/data/pkgs/Sum-of-Functions-Optimizer/:$HOME/src/archimedes:$PYTHONPATH
#:$HOME/data/pkgs/spearmint/spearmint:$PYTHONPATH
export THEANORC=~/.theanorc

#alias mongod='mongod --dbpath $HOME/data/mongodb'

# Added by Canopy installer on 2015-01-26
# VIRTUAL_ENV_DISABLE_PROMPT can be set to '' to make bashprompt show that Canopy is active, otherwise 1

export DB=postgres://mlisicki@mikedb.cgke70rvs2ad.us-west-2.rds.amazonaws.com/jobbase?table=jobs

export AST_DATA=$HOME/data/ast

export PATH=$HOME/usr/local/lib/wingide4.1/:$HOME/usr/local/bin:$PATH
#export WINGIDE_USE_QT4="1"

export WINGHOME=$HOME/usr/local/lib/wingide4.1
#export WINGPYTHON=/mnt/data/mlisicki/pkgs/enthought/canopy-1.5.1/bin/python
#export PYTHONPATH=$PYTHONPATH:$HOME/usr/local/lib/wingide4.1/src

killscreens () {
    screen -ls | grep Detached | cut -d. -f1 | awk '{print $1}' | xargs kill
}

. /export/mlrg/mlisicki/anaconda3/etc/profile.d/conda.sh

export PATH=/export/mlrg/mlisicki/anaconda3/bin:$PATH
# If not running interactively, don't do anything below
[ -z "$PS1" ] && return

export CUDA_VISIBLE_DEVICES=0
