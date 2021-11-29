#!/usr/bin/env bash

# Install apt packages
sudo apt install -y stow neovim tmux git cmake htop pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3

# Install config
for d in $(ls); do stow $d; done

## INSTALL coc.nvim

# set -o nounset    # error when referencing undefined variable
# set -o errexit    # exit when command fails

# Install latest nodejs
if [ ! -x "$(command -v node)" ]; then
    curl --fail -LSs https://install-node.now.sh/latest | sh
    export PATH="/usr/local/bin/:$PATH"
    # Or use package manager, e.g.
    # sudo apt-get install nodejs
fi

# Use package feature to install coc.nvim

# for vim8
mkdir -p ~/.vim/pack/coc/start
cd ~/.vim/pack/coc/start
curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz | tar xzfv -

# Install extensions
mkdir -p ~/.config/coc/extensions
cd ~/.config/coc/extensions
if [ ! -f package.json ]
then
  echo '{"dependencies":{}}'> package.json
fi

# Change extension names to the extensions you need
npm install coc-snippets --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod

# Install Rust and binaries
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install Rust utilities
~/.cargo/bin/cargo install git-delta ripgrep lsd fd-find hexyl bat exa alacritty

# Install vim plugins
/usr/bin/nvim +PluginInstall

