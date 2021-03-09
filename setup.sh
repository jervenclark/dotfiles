#!/bin/zsh
# title           : setup.sh
# description     : Initial setup
# author		      : Jerven Clark Chua
# email           : jervenclark@gmail.com
# date            : 2020-07-17
# version         : 0.0.1
# usage		        : ./setup.sh
# notes           :
# zsh_version     : 5.8
#===============================================================================


# define directory
DOTFILES_DIR=`dirname $(realpath $0)`

# update python, pip
yes | sudo pacman -Sy ansible python python-pip

# install aur ansible module
ansible-galaxy install kewlfft.aur
