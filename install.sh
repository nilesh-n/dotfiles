#!/usr/bin/env bash

dots=~/dotfiles

# tmux
ln -sf $dots/tmux/tmux.conf ~/.tmux.conf
#ln -sf $dots/tmux/tmuxline-tomorrow.conf ~/.tmuxline.conf
ln -sf $dots/tmux/tmuxline-gruvbox.conf ~/.tmuxline.conf

# vim
ln -sf $dots/vim/vimrc ~/.vimrc
ln -sf $dots/vim/ ~/.vim

# ruby
ln -sf $dots/ruby/gemrc ~/.gemrc
ln -sf $dots/ruby/irbrc ~/.irbrc
ln -sf $dots/ruby/rspec ~/.rspec

# git
ln -sf $dots/git/gitignore_global ~/.gitignore_global
