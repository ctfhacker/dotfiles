source ~/.profile
# Personal commands
alias ls='exa'
alias l='exa'
alias ll='exa -la'
alias xxd='hexyl'
alias tree='lsd -la --tree'
alias sl=ls
alias dc=cd
alias i=ipython

alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# alias cat='bat --theme "Monokai Extended" --paging never'
alias cat='bat --theme "Monokai Extended"'


alias windev32='cd /mnt/c/users/rando; cmd.ese /k "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" amd64_x86'
alias windev='cd /mnt/c/users/rando; cmd.exe /k "C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\VC\Auxiliary\Build\vcvarsx86_amd64.bat"'

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

alias et16='eval $(docker-machine env default); docker run -v /Users/user/vmshare:/root/vmshare -v /Users/user/ctfs:/root/host-share -v /tmp/.X11-unix:/tmp/.X11-unix --rm --privileged -it --workdir=/root ctfhacker/epictreasure:16.04'
alias et19='eval $(docker-machine env default); docker run -v /Users/user/vmshare:/root/vmshare -v /Users/user/ctfs:/root/host-share -v /tmp/.X11-unix:/tmp/.X11-unix --rm --privileged -it --workdir=/root ctfhacker/epictreasure:19.04'
alias wasabi='docker run --rm -t -v /Users/user/ctfs:/root/host-share wasabi'

alias eth='eval $(docker-machine env default); docker run -v /home/ctfhacker/ethdev:/root/host-share --rm --privileged -it --workdir=/root ethylene'

alias moflow='eval $(docker-machine env default); docker run -v /home/ctfhacker/ctfs:/root/host-share --privileged -it --workdir=/moflow moflow/moflow-0.8'
alias docker-restart='docker-machine restart default; eval $(docker-machine env default)'

# alias pbcopy='xclip -selection clipboard'
# alias pbpaste='xclip -selection clipboard -o'

alias cgc='cd ~/ctfs/cgc; vagrant up; vagrant ssh'
alias binja='cd ~/binaryninja; ./binaryninja'

alias vim=hx

# --Go--
# export GOPATH=$HOME/LocalCode/go
# export PATH=$PATH:$GOPATH/bin

# export GOROOT=`go env GOROOT` # b/c installed via Homebrew
# export PATH=$PATH:$GOROOT/bin

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/.virtualenv-project-home

# --Python--
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

export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

setxkbmap -option "ctrl:nocaps"

source $HOME/.cargo/env

export CARGO_REGISTRIES_CRATES_IO_PROTOCOL=sparse
export PATH="$PATH:/mnt/c/Program Files/IDA 7.0"
export PATH="$PATH:/home/user/clang/bin"
export PATH="$PATH:/home/user/zig"
export PATH="$PATH:/home/user/workspace/zls/zig-out/bin"
export LD_LIBRARY_PATH="$LD_LIBRAYR_PATH:/home/user/clang/lib"
. "$HOME/.cargo/env"
