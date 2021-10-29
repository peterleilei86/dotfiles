#!/usr/bin/env bash

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

ln -sf ~/dotfiles/zshrc ~/.zshrc

echo 🍻 Enjoy your fresh new zsh terminal! 🍻

exit 0