#!/bin/zsh
# title           : hooks.zsh
# description     : ZSH hook functions
# author		      : Jerven Clark Chua
# email           : jervenclark@gmail.com
# date            : 2020-07-17
# version         : 0.0.1
# usage		        : source hooks.zsh
# notes           :
# zsh_version     : 5.8
#===============================================================================


#-------------------------------------------------------------------------------
# ZSH hooks
#-------------------------------------------------------------------------------
# change present working directory hook
chpwd() {
    configure-virtualenv;
    git-switch-identity > /dev/null 2>&1;
}
