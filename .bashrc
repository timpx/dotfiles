# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

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
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
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

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

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
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# pc_name if pc id is needed in if cases
pc_name=$(cat /etc/hostname)

# Add scripts
export PATH=/home/tim/Work/Scripts:$PATH

# use python for anki
export PATH=/usr/bin/:$PATH

alias pycan='export PATH=/home/tim/Canopy_environment/User/bin:$PATH'
alias upycan='export PATH=/usr/bin/:$PATH'


# Add sublime text work
if [ $pc_name == "work" ]; then
export PATH=/home/tim/Work/Soft/Sublime2/:$PATH;
fi
# sublime_text home
if [ $pc_name == "home" ]; then
export PATH=$PATH:/home/tim/Work/Soft/Sublime\ Text\ 2/;
fi

# bug in canopy, change xterm 
export TERM="xterm-256color"

# python path for canopy
# export PYTHONPATH=/home/tim/Canopy_user/User/lib/python2.7/site-packages
#export PYTHONPATH=/home/tim/Canopy/appdata/canopy-1.1.0.1371.rh5-x86_64/lib/python2.7/site-packages:$PATH


# added by Anaconda 1.8.0 installer
alias ancda='export OLD_PATH=$PATH export PATH="/home/tim/anaconda/bin:$PATH"; export QT_API=pyqt'
alias uancda='export PATH=$OLD_PATH'

# external geodesic library
export PYTHONPATH=/home/tim/Work/Models/python/TVB/external_geodesic_library

# for matlab
export LD_LIBRARY_PATH=/usr/local/MATLAB/MATLAB_Compiler_Runtime/v81/runtime/glnxa64:/usr/local/MATLAB/MATLAB_Compiler_Runtime/v81/bin/glnxa64:/usr/local/MATLAB/MATLAB_Compiler_Runtime/v80/sys/os/glnxa64:/usr/local/MATLAB/MATLAB_Compiler_Runtime/v81/sys/java/jre/glnxa64/jre/lib/amd64/native_threads:/usr/local/MATLAB/Matlab_Compiler_Runtime/v81/sys/java/jre/glnxa64/jre/lib/amd64/server:/usr/local/MATLAB/Matlab_Compiler_Runtime/v81/sys/java/jre/glnxa64/jre/lib/amd64:$LD_LIBRARY_PATH
export XAPPLRESDIR=/usr/local/MATLAB/MATLAB_Compiler_Runtime/v81/X11/app-defaults:$XAPPLRESDIR

# for fsl
FSLDIR=/usr/share/fsl/5.0/
. ${FSLDIR}/etc/fslconf/fsl.sh
PATH=${FSLDIR}/bin:${PATH}
export FSLDIR PATH 

# for anywave
export PATH=/home/tim/Work/Soft/Anywave/AnyWave/:${PATH}

# qmake
alias qmake=/usr/local/pkg/qt/4.8.5/bin/qmake

# qmake
alias qmake=/usr/local/pkg/qt/4.8.5/bin/qmake

# for freesurfer
if [ $pc_name == "tym" ]; then
export SUBJECTS_DIR=/disk3/Work/Processed_data/freesurfer;
export FREESURFER_HOME=/usr/local/freesurfer;
source $FREESURFER_HOME/SetUpFreeSurfer.sh;
fi
if [ $pc_name == "timmy" ]; then
export SUBJECTS_DIR=/home/tim/Work/Processed_data/freesurfer;
export FREESURFER_HOME=/home/tim/Work/Soft/freesurfer/;
source $FREESURFER_HOME/SetUpFreeSurfer.sh;
fi

# for camino
export MANPATH=/home/tim/camino/man:$MANPATH
export PATH=/home/tim/camino/bin:$PATH

# camino to trackvis
export CAMINO2TRK=/home/tim/camino-trackvis-0.2.8.1

# for trackvis and dtk
export DTDIR="/home/tim/dtk"
export DSI_PATH="/home/tim/dtk/matrices"
export PATH="${DTDIR}:${PATH}"

# mrtrix3 compilation
export QMAKESPEC=/usr/share/qt4/mkspecs/linux-g++/
export PATH=$PATH:/usr/share/qt4/bin/
export PATH=/home/tim/Work/Soft/mrtrix3/bin/:$PATH
export PATH=/home/tim/Work/Soft/mrtrix3/scripts/:$PATH

# mne
export MNE_ROOT=/home/tim/Work/Soft/MNE-2.7.3-3268-Linux-x86_64
source $MNE_ROOT/bin/mne_setup_sh

# dsi_studio
export DSI_STUDIO_FA_TEMPLATE=/usr/local/pkg/dsi_studio/20120919/NTU90_QA.nii.gz
alias dsistudio=/usr/local/pkg/dsistudio/20120919/dsi_studio


# mrtrix_work
if [ $pc_name == "tym" ]; then
export PATH=/opt/mrtrix/bin/:$PATH;
fi
# mrtrix_home
if [ $pc_name == "timmy" ]; then
#export PATH=/usr/lib/mrtrix/bin/:$PATH;
export PATH=/home/tim/Work/Soft/mrtrix3/bin:$PATH
fi

# for brightness
alias bgt1='xrandr --output DVI-I-1 --brightness 0.1'
alias bgt2='xrandr --output DVI-I-1 --brightness 0.2'
alias bgt3='xrandr --output DVI-I-1 --brightness 0.3'
alias bgt4='xrandr --output DVI-I-1 --brightness 0.4'
alias bgt5='xrandr --output DVI-I-1 --brightness 0.5'
alias bgt6='xrandr --output DVI-I-1 --brightness 0.6'
alias bgt7='xrandr --output DVI-I-1 --brightness 0.7'
alias bgt8='xrandr --output DVI-I-1 --brightness 0.8'
alias bgt9='xrandr --output DVI-I-1 --brightness 0.9'
alias bgt0='xrandr --output DVI-I-1 --brightness 1.0'
alias bgg1='xrandr --output DP-1 --brightness 0.1'
alias bgg2='xrandr --output DP-1 --brightness 0.2'
alias bgg3='xrandr --output DP-1 --brightness 0.3'
alias bgg4='xrandr --output DP-1 --brightness 0.4'
alias bgg5='xrandr --output DP-1 --brightness 0.5'
alias bgg6='xrandr --output DP-1 --brightness 0.6'
alias bgg7='xrandr --output DP-1 --brightness 0.7'
alias bgg8='xrandr --output DP-1 --brightness 0.8'
alias bgg9='xrandr --output DP-1 --brightness 0.9'
alias bgg0='xrandr --output DP-1 --brightness 1.0'
# for brightness home
alias bgu1='xrandr --output DVI-I-2 --brightness 0.1'
alias bgu2='xrandr --output DVI-I-2 --brightness 0.2'
alias bgu3='xrandr --output DVI-I-2 --brightness 0.3'
alias bgu4='xrandr --output DVI-I-2 --brightness 0.4'
alias bgu5='xrandr --output DVI-I-2 --brightness 0.5'
alias bgu6='xrandr --output DVI-I-2 --brightness 0.6'
alias bgu7='xrandr --output DVI-I-2 --brightness 0.7'
alias bgu8='xrandr --output DVI-I-2 --brightness 0.8'
alias bgu9='xrandr --output DVI-I-2 --brightness 0.9'
alias bgu0='xrandr --output DVI-I-2 --brightness 1.0'

# alias cluster
alias cl='ssh -Y tim@139.124.148.56'

# alias anatomist
alias anatomist='/home/tim/Work/Soft/brainvisa-4.3.0/anatomist'

# alias matlab work
if [ $pc_name == "work" ]; then
alias matlab='/home/tim/Matlab/bin/matlab -nodesktop';
fi
# matlab home
if [ $pc_name == "home" ]; then
alias matlab=/usr/local/MATLAB/R2013a/bin/matlab;
fi


# cd TVB
alias TVB='cd /home/tim/Work/Models/python/TVB/'

# alias shorcuts
alias pro='cd /disk3/Work/Processed_data'
alias dat='cd /disk2/Work/DATA'
alias sim='cd /disk2/Work/Simulations'
alias mod='cd /home/tim/Work/Models'
alias hcp='cd /disk3/Work/Processed_data/HCP/100307/'
alias freem="sync; su -c 'echo 3 > /proc/sys/vm/drop_caches'"
alias tvb='cd /home/tim/Work/Models/python/TVB/'
alias tsci='cd /home/tim/Work/Models/python/TVB/trunk/scientific_library/tvb/simulator'

# for kile
#export KDEDIRS=$HOME/kile-install:$KDEDIRS
#$HOME/kile-install/bin/kile

# alias display
alias fj='ancda; export DISPLAY=:0;ipython --pylab'
