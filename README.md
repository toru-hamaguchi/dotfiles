# dotfiles

## About
My dotfiles.

## Installation
```bash
$ git clone https://github.com/toru-hamaguchi/dotfiles ~/dotfiles --recursive
```

Create directories.

```bash
$ mkdir -p ~/.config/fish
$ mkdir -p ~/.vim/backup
$ mkdir -p ~/.vim/swap
```

Link files.

```bash
$ ln -s ~/dotfiles/bashrc ~/.bashrc
$ ln -s ~/dotfiles/bash_profile ~/.bash_profile
$ ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
$ ln -s ~/dotfiles/vimrc ~/.vimrc
$ ln -s ~/dotfiles/neobundle.vim ~/.vim/neobundle.vim
$ ln -s ~/dotfiles/config/fish/config.fish ~/.config/fish/config.fish
```
