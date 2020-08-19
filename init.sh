#!/bin/bash

real_user=$SUDO_USER

apt -y full-upgrade
apt -y install git vim tmux zsh

# Copied from https://missing.csail.mit.edu/2020/editors/
# "Many programs use the GNU Readline library for their command-line interface."
# "Readline supports (basic) Vim emulation too, which can be enabled by adding the following line to the ~/.inputrc file:"
echo "set editing-mode vi" >> /home/$real_user/.inputrc

# Add some basic Vim plugins, recommended by the MIT missing semester class
mkdir -p /home/$real_user/.vim/pack/vendor/start

cd /home/$real_user/.vim/pack/vendor/start

sudo -u $real_user git clone https://github.com/ctrlpvim/ctrlp.vim
sudo -u $real_user git clone https://github.com/mileszs/ack.vim
sudo -u $real_user git clone https://github.com/scrooloose/nerdtree
sudo -u $real_user git clone https://github.com/easymotion/vim-easymotion
# With this setting, for example, the Python REPL will support Vim bindings.

cd /home/$real_user/

sudo -u $real_user git clone --recursive https://github.com/sorin-ionescu/prezto.git /home/$real_user

ln -s /home/$real_user/dotfiles/vimrc /home/$real_user/.vimrc
ln -s /home/$real_user/dotfiles/tmux.config /home/$real_user/.tmux.config
ln -s /home/$real_user/dotfiles/zdot/zshenv /home/$real_user/.zshenv
ln -s /home/$real_user/dotfiles/zdot/zprofile /home/$real_user/.zprofile
ln -s /home/$real_user/dotfiles/zdot/zshrc /home/$real_user/.zshrc
ln -s /home/$real_user/dotfiles/zdot/zlogin /home/$real_user/.zlogin
ln -s /home/$real_user/dotfiles/zdot/zlogout /home/$real_user/.zlogout
ln -s /home/$real_user/dotfiles/zdot/zpreztorc /home/$real_user/.zpreztorc

sudo -u $real_user zsh
