#!/bin/sh
cd ${0%/*}

sudo pacman -S zsh zsh-completions &&
sudo cp zshrc_preset /etc/zshrc &&
sudo cp -r zsh_extensions /etc/zsh_extensions &&
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
