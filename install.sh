#!/usr/bin/env bash

# Install apt packages
sudo apt install -y stow neovim tmux git cmake htop pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3

# Install config
for d in $(ls); do stow $d; done

# Install Rust and binaries
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install Rust utilities
~/.cargo/bin/cargo install git-delta ripgrep lsd fd-find hexyl bat exa alacritty
