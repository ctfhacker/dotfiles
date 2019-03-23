# Personal commands
alias ls='exa -lh'
alias l='exa -lh'
alias ll='exa -lah'
alias xxd='hexyl'
alias tree='exa -la -T'
alias sl=ls
alias dc=cd
alias i=ipython

alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# alias cat='bat --theme "Monokai Extended" --paging never'
alias cat='bat --theme "Monokai Extended"'

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
alias et='eval $(docker-machine env default); docker run -v /Users/cduplant/ctfs:/root/host-share -v /tmp/.X11-unix:/tmp/.X11-unix --rm --privileged -it --workdir=/root ctfhacker/epictreasure'
alias et-test='eval $(docker-machine env default); docker run -v /Users/cduplant/ctfs:/root/host-share -v /tmp/.X11-unix:/tmp/.X11-unix --rm --privileged -it --workdir=/root et-test'
alias wasabi='docker run --rm -t -v /Users/cduplant/ctfs:/root/host-share wasabi'

alias eth='eval $(docker-machine env default); docker run -v /home/ctfhacker/ethdev:/root/host-share --rm --privileged -it --workdir=/root ethylene'

alias moflow='eval $(docker-machine env default); docker run -v /home/ctfhacker/ctfs:/root/host-share --privileged -it --workdir=/moflow moflow/moflow-0.8'
alias docker-restart='docker-machine restart default; eval $(docker-machine env default)'

# alias pbcopy='xclip -selection clipboard'
# alias pbpaste='xclip -selection clipboard -o'

alias cgc='cd ~/ctfs/cgc; vagrant up; vagrant ssh'
alias binja='cd ~/binaryninja; ./binaryninja'

# --Go--
export GOPATH=$HOME/LocalCode/go
export PATH=$PATH:$GOPATH/bin

export GOROOT=`go env GOROOT` # b/c installed via Homebrew
export PATH=$PATH:$GOROOT/bin

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/.virtualenv-project-home

if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

if [ -f /Users/user/Library/Python/2.7/bin/virtualenvwrapper.sh ]; then
    source /Users/user/Library/Python/2.7/bin/virtualenvwrapper.sh
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
