#!/bin/zsh
# title           : docker.zsh
# description     : Custom docker aliases and overrides
# author          : Jerven Clark Chua
# email           : jervenclark@gmail.com
# date            : 2020-07-17
# version         : 0.0.1
# usage           : source docker.zsh
# notes           :
# zsh_version     : 5.8
#===============================================================================


#-------------------------------------------------------------------------------
# Docker environment variables
#-------------------------------------------------------------------------------
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1


#-------------------------------------------------------------------------------
# Docker aliases
#-------------------------------------------------------------------------------
# concise docker ps
alias dkps='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}"'

# list and remove exited containers
alias dkrm='docker ps -aqf "status=exited" | xargs docker rm'

# docker
alias dk='docker'

#-------------------------------------------------------------------------------
# Docker compose aliases
#-------------------------------------------------------------------------------
# docker-compose shorthand
alias dcc='docker-compose'

# exec shorthand
alias dce='docker-compose exec'

# run shorthand
alias dcr='docker-compose run --rm'

# logs shorthand
alias dcl='docker-compose logs -f'
alias dclt='docker-compose logs -f --tail=0'

# up daemon shorthand
alias dcu='docker-compose up -d'

# down shorthand
alias dcd='docker-compose down'

# docker stop shorthand
alias dcs='docker-compose stop'

# dockerized django
alias dcj='docker-compose exec -u 1000 web python manage.py'
