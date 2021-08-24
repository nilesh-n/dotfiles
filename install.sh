#!/usr/bin/env bash

dots=~/dotfiles

# tmux
ln -sf $dots/tmux/tmux.conf ~/.tmux.conf
#ln -sf $dots/tmux/tmuxline-tomorrow.conf ~/.tmuxline.conf
ln -sf $dots/tmux/tmuxline-gruvbox.conf ~/.tmuxline.conf

# vim
ln -sf $dots/vim/vimrc ~/.vimrc
ln -sf $dots/vim/ ~/.vim

# nvim
ln -sf $dots/nvim/init.vim ~/.config/nvim/init.vim
ln -sf $dots/nvim/lua ~/.config/nvim/lua

# ruby
ln -sf $dots/ruby/gemrc ~/.gemrc
ln -sf $dots/ruby/irbrc ~/.irbrc
ln -sf $dots/ruby/rspec ~/.rspec

# git
ln -sf $dots/git/gitignore_global ~/.gitignore_global
