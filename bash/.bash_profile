# Personal commands
alias ls='ls -G'
alias l='ls -Gl'
alias ll='ls -Gla '
alias sl=ls
alias dc=cd
alias i=ipython

alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# Reload bash_profile
alias reload='source ~/.bash_profile'

# Windows commands
alias cls=clear
alias copy=cp
alias move=mv
alias del=rm
alias dir=ls
alias findstr=grep

alias tmux='export TERM=screen-256color; tmux -2'

alias ips='ip a'
alias ipa='ip a'

export PYENV_ROOT="${HOME}/.pyenv"

alias et-pull='eval $(docker-machine env default); docker pull ctfhacker/epictreasure'
alias et='eval $(docker-machine env default); docker run -v /Users/cduplant/ctfs:/root/host-share --rm --privileged -it --workdir=/root ctfhacker/epictreasure'

alias eth='eval $(docker-machine env default); docker run -v /home/ctfhacker/ethdev:/root/host-share --rm --privileged -it --workdir=/root ethylene'

alias moflow='eval $(docker-machine env default); docker run -v /home/ctfhacker/ctfs:/root/host-share --privileged -it --workdir=/moflow moflow/moflow-0.8'
alias docker-restart='docker-machine restart default; eval $(docker-machine env default)'

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

alias cgc='cd ~/ctfs/cgc; vagrant up; vagrant ssh'
alias binja='cd ~/binaryninja; ./binaryninja'

alias aws-personal='ssh -i ~/.znc.pem ubuntu@54.148.111.51'

export GOPATH=${HOME}/.go
export GOROOT=${HOME}/go
export PATH="$GOROOT/bin:$GOPATH/bin:$PATH"

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/.virtualenv-project-home

if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

if [ -d "${PYENV_ROOT}" ]; then
    export PATH="${PYENV_ROOT}/bin:${PATH}"
    eval "$(pyenv init -)"
fi

# Load rust env
if [ -f $HOME/.cargo/env ]; then 
    source $HOME/.cargo/env
fi


source $HOME/.cargo/env
source ~/.bashrc

export PATH="$HOME/.cargo/bin:$PATH"
