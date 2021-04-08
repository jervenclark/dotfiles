#!/bin/zsh
# title           : utilities.zsh
# description     : Custom general utility functions
# author          : Jerven Clark Chua
# email           : jervenclark@gmail.com
# date            : 2020-07-17
# version         : 0.0.1
# usage           : source utilities.zsh
# notes           :
# zsh_version     : 5.8
#===============================================================================


#-------------------------------------------------------------------------------
# Custom utility functions
#-------------------------------------------------------------------------------
# generate password
generate-password() {
    echo `cut -c 1-$1 <<< $(/usr/bin/openssl rand -base64 32)`
}

# display color schemes
color-scheme() {
    T='TiP'   # The test text

    echo -e "\n                 40m     41m     42m     43m\
     44m     45m     46m     47m";

    for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
               '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
               '  36m' '1;36m' '  37m' '1;37m';
    do FG=${FGs// /}
       echo -en " $FGs \033[$FG  $T  "
       for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
       do echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m";
       done
       echo;
    done
    echo

}

# reload zsh
src() {
      local cache="$ZSH_CACHE_DIR"
      autoload -U compinit zrecompile
      compinit -i -d "$cache/zcomp-$HOST"

      for f in ${ZDOTDIR:-~}/.zshrc "$cache/zcomp-$HOST";
    do
            zrecompile -p $f && command rm -f $f.zwc.old
      done

      # Use $SHELL if available; remove leading dash if login shell
      [[ -n "$SHELL" ]] && exec ${SHELL#-} || exec zsh
}

# check command
has() {
    readonly txtreset="$(tput -T $TERM sgr0)"
    readonly txtbold="$(tput -T $TERM bold)"
    readonly txtblack="$(tput -T $TERM setaf 0)"
    readonly txtred="$(tput -T $TERM setaf 1)"
    readonly txtgreen="$(tput -T $TERM setaf 2)"
    readonly txtyellow="$(tput -T $TERM setaf 3)"
    readonly txtblue="$(tput -T $TERM setaf 4)"
    readonly txtpurple="$(tput -T $TERM setaf 5)"
    readonly txtcyan="$(tput -T $TERM setaf 6)"
    readonly txtwhite="$(tput -T $TERM setaf 7)"

    # unicode "✗"
    readonly fancyx='\342\234\227'
    # unicode "✓"
    readonly checkmark='\342\234\223'

    readonly pass="${txtbold}${txtgreen}${checkmark}${txtreset}"
    readonly fail="${txtbold}${txtred}${fancyx}${txtreset}"

    invalid_count=0
    for command in "$@"
    do
        if (( $+commands[$command] ));
        then
            printf "${pass} $command\n"
        else
            printf "${fail} $command\n"
            let "invalid_count = $invalid_count + 1"
        fi
    done
    return "${invalid_count}"
}

# cheapwatch
#!/bin/sh

notrolex() {
    while true ; do
        clear
        printf "[%s] Output of %s:\n" "$(date)" "$*"
        ${SHELL-/bin/zsh} -c "$*"
        sleep 1
    done
}
