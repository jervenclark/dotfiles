#!/bin/zsh
# title           : overrides.zsh
# description     : Overrides for built-in linux commands
# author          : Jerven Clark Chua
# email           : jervenclark@gmail.com
# date            : 2020-07-17
# version         : 0.0.1
# usage           : source overrides.zsh
# notes           :
# zsh_version     : 5.8
#===============================================================================


#-------------------------------------------------------------------------------
# Override cat
#-------------------------------------------------------------------------------
# cat with syntax highlighting
alias cat='bat --style=plain'

# cat with line numbers
alias catl='bat'


#-------------------------------------------------------------------------------
# Override ls
#-------------------------------------------------------------------------------
# list, size, type, git
alias l='exa -lbF --git'

# remap default ls
alias ls='exa'

# long list
alias ll='exa -lbGF --git'

# list hidden only
alias lh='exa -lbFda --git .*'

# long list, modified date sort
alias llm='exa -lbGd --git --sort=modified'

# all list
alias la='exa -lbhHigmuSa --time-style=long-iso --git --color-scale'

# all + extended list
alias lx='exa -lbhHigmuSa@ --time-style=long-iso --git --color-scale'

# one column, just names
alias lS='exa -1'

# tree
alias lt='exa --tree --level=2'


#-------------------------------------------------------------------------------
# Override ping
#-------------------------------------------------------------------------------
# stop ping at 4 counts
alias ping='ping -c 4'


#-------------------------------------------------------------------------------
# Override cp
#-------------------------------------------------------------------------------
# make copy recursive the default
alias cp='cp -R'


#-------------------------------------------------------------------------------
# Custom aliases
#-------------------------------------------------------------------------------
# tree
alias tree='tree -C'

# safe rm
alias del='trash -v'

# pipe to grep
alias -g G="| grep"

# pipe to less
alias -g L="| less"

# pipe to xclip
alias -g X="| xclip -sel clip"

# silence command output
alias -g NUL="> /dev/null 2>&1"

# add public-ip
alias public-ip='curl http://ipecho.net/plain; echo'

# parse i3 config for keybindings
alias parse-i3cheatsheet="egrep ^bind $HOME/.i3/config | cut --d ' ' -f 2- | sed 's/ / /' | column -ts $'\t' | pr -2 -w 160 -t | less"

alias i3cheatsheet="catl $HOME/.i3/cheatsheet.org"

alias update-spacemacs="/usr/bin/emacs --batch -l ~/.emacs.d/init.el --eval='(configuration-layer/update-packages t)'"

alias screenlayout-single="$HOME/.screenlayout/screenlayout-single.sh"

alias doom="$HOME/.emacs.d/bin/doom"
