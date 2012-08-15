dotfiles
========

About
-----
My dotfiles.

Install
-------
    $ git clone https://github.com/toru-hamaguchi/dotfiles ~/dotfiles --recursive

Setup
-----
### Link files.
    $ ln -s ~/dotfiles/bashrc ~/.bashrc
    $ ln -s ~/dotfiles/bash_profile ~/.bash_profile
    $ ln -s ~/dotfiles/zshrc ~/.zshrc
    $ ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
    $ ln -s ~/dotfiles/vimrc ~/.vimrc
    $ ln -s ~/dotfiles/gvimrc ~/.gvimrc
    $ ln -s ~/dotfiles/neobundle.vim ~/.vim/neobundle.vim

### Create directories.
    $ mkdir ~/.vim/backup
    $ mkdir ~/.vim/swap

### make vimproc lib.
    $ cd ~/.vim/bundle/vimproc
    $ make -f make_xxx.mak

