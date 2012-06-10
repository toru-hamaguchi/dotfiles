dotfiles
========

About
-----
My dotfiles.

Install
-------
    $ git clone https://github.com/toru-hamaguchi/dotfiles ~/dotfiles
    $ cd ~/dotfiles

Setup
-----
### Link files.
    $ ln -s ~/dotfiles/bashrc ~/.vim/.bashrc
    $ ln -s ~/dotfiles/bash_profile ~/.vim/.bash_profile
    $ ln -s ~/dotfiles/zshenv ~/.vim/.zshenv
    $ ln -s ~/dotfiles/zshrc ~/.vim/.zshrc
    $ ln -s ~/dotfiles/vimrc ~/.vimrc
    $ ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
    $ ln -s ~/dotfiles/gvimrc ~/.gvimrc
    $ ln -s ~/dotfiles/neobundle.vim ~/.vim/neobundle.vim

### Create directories.
    $ mkdir ~/.vim/backup
    $ mkdir ~/.vim/swap

### Init modules.
    $ git submodule init
    $ git submodule update

### make vimproc lib.
    $ cd ~/.vim/bundle/vimproc
    $ make -f make_xxx.mak

