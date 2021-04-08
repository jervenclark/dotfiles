#!/bin/zsh
# title           : python.zsh
# description     : Custom functions, aliases, and variables related to python
# author          : Jerven Clark Chua
# email           : jervenclark@gmail.com
# date            : 2020-07-17
# version         : 0.0.1
# usage           : source python.zsh
# notes           :
# zsh_version     : 5.8
#===============================================================================


#-------------------------------------------------------------------------------
# Configure pyenv
#-------------------------------------------------------------------------------
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"


#-------------------------------------------------------------------------------
# Custom virtualenv functions
#-------------------------------------------------------------------------------
# activate/deactivatee virtualenv
configure-virtualenv() {
    if [ -d $PWD/venv ];
    then
        source $PWD/venv/bin/activate
        VIRTUAL_ENV_WORKDIR=$PWD
    elif [[ "$PWD" != "$VIRTUAL_ENV_WORKDIR"* ]] && [ "$VIRTUAL_ENV" ];
    then
        deactivate
        unset VIRTUAL_ENV_WORKDIR
    fi
}


#-------------------------------------------------------------------------------
# Custom aliases
#-------------------------------------------------------------------------------
# build python package
alias pyb='python setup.py sdist bdist_wheel'
