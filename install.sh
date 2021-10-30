#!/bin/bash

function fail() {
    echo ❌ Error occured. Exiting installation.
    exit 1
}

echo ℹ️ Install directory is $(echo ~)

echo ➡️  Downloading and installing Oh-My-Zsh! ...
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" < <(echo exit) || fail
source ~/.zshrc

echo ➡️  Downloading Synthax Highlighting plugin...
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting || fail

echo ➡️  Downloading Autocompletion plugin...
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions || fail

echo ➡️  Downloading zsh completions plugin...
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

echo ➡️  Downloading git open plugin...
git clone https://github.com/paulirish/git-open.git ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/git-open

echo ➡️  Downloading Starship...
curl -fsSL https://starship.rs/install.sh | zsh

ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ls -sf ~/dotfiles/.config ~/.config

echo 🍻 Enjoy your fresh new zsh terminal! 🍻

exit 0