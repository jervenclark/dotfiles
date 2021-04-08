#!/bin/zsh
# title           : git.zsh
# description     : Custom git functions and aliases
# author          : Jerven Clark Chua
# email           : jervenclark@gmail.com
# date            : 2020-07-17
# version         : 0.0.1
# usage           : source git.zsh
# notes           :
# zsh_version     : 5.8
#===============================================================================


#-------------------------------------------------------------------------------
# Custom git functions
#-------------------------------------------------------------------------------
# commit using user-defined date
git-backtrack () {
    new_date="$1"
    switch="$2"
    _DATE="$(date -d $1)"
    echo $_DATE
    GIT_AUTHOR_DATE="$_DATE" GIT_COMMITTER_DATE="$_DATE" git commit "${@:2}"
}

# commit using user-defined date
git-backtrack-amend () {
    new_date="$1"
    switch="$2"
    _DATE="$(date -d $1)"
    echo $_DATE
    GIT_AUTHOR_DATE="$_DATE" GIT_COMMITTER_DATE="$_DATE" git commit --amend --no-edit --reset-author "${@:2}"
}

# switch ssh identity by directory
git-switch-identity() {
    ssh-add -D
    if [[ "$PWD" == "/home/jervenclark/Projects/tti"* ]]; then
        ssh-add ~/.ssh/id_rsa_tti
    else
        ssh-add ~/.ssh/id_rsa
    fi
}


# generate random n-commits
git-generate-commits () {
    for i in {1..$1};
    do
        filename=`cut -c 1-8 <<< $(/usr/bin/openssl rand -base64 32)`
        echo $RANDOM >> $filename
        git add $filename
        git commit -m "-- $RANDOM commit to $filename --"
    done
}

#-------------------------------------------------------------------------------
# Git aliases
#-------------------------------------------------------------------------------
# full log with author and commit dates
alias glgl='git log --graph --pretty=fuller'

# git pull with submodules
alias glrs='git pull --recurse-submodules'
