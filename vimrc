
" VIM expects to be run from a POSIX shell.
if $SHELL =~ '/fish$'
  set shell=sh
endif

" Basics. "{{{
set backup
set swapfile
set backupdir=~/.vim/backup
set directory=~/.vim/swap
"}}}

" vundle."{{{
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/neobundle.vim/
endif

filetype plugin indent off

call neobundle#begin(expand('~/.vim/bundle/'))

" Plugin.
NeoBundle 'docunext/closetag.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'mattn/jscomplete-vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'groenewege/vim-less'
NeoBundle 'Shougo/vimproc.vim', {
  \ 'build': {
  \   'windows': 'make -f make_mingw32.mak',
  \   'cygwin': 'make -f make_cygwin.mak',
  \   'mac': 'make -f make_mac.mak',
  \   'unix': 'make -f make_unix.mak',
  \   }
  \ }
NeoBundle 'tpope/vim-surround'
NeoBundle 'LeafCage/yankround.vim'

" Syntax.
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'hallison/vim-markdown'

" Color scheme.
NeoBundle 'gh:svjunic/RadicalGoodSpeed.vim.git'
NeoBundle 'vim-scripts/Wombat'

filetype plugin indent on
syntax enable

call neobundle#end()

NeoBundleCheck
"}}}

" Apperance."{{{
colorscheme radicalgoodspeed
"colorscheme wombat

" Zenkaku space.
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" Highlight cursor line.
set cursorline
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

" Line number.
set number

" Indent.
set tabstop=2 shiftwidth=2 softtabstop=0
"}}}

" Edit."{{{
set expandtab

" Strip tailing space.
autocmd BufWritePre * :%s/\s\+$//ge
" Tab -> space on write.
autocmd BufWritePre * :%s/\t/  /ge
"}}}

" Key mapping."{{{
imap <C-@> <C-[>
imap jj <Esc>
nmap <Esc><Esc> :nohlsearch<CR><Esc>
"}}}

" Plugin settings."{{{
" emmet
let g:user_emmet_expandabbr_key='<c-e>'
let g:user_emmet_settings={
  \ 'indentation': '  ',
  \ 'lang': 'ja',
  \}

" jscomplete-vim
autocmd FileType javascript
  \ :setl omnifunc=jscomplete#CompleteJS
let g:jscomplete_use=['dom','es6th']

" lightline.vim
set laststatus=2  " Always show the statusline
let g:lightline={
  \ 'component': {
  \   'readonly': '%{&readonly?"⭤":""}',
  \   }
  \ }

" neocomplcache
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_smart_case=1

" unite.vim
let g:unite_enable_start_insert=1
nnoremap <silent> ,ub :<c-u>Unite buffer<CR>
nnoremap <silent> ,uf :<c-u>UniteWithBufferDir -buffer-name=files file<CR>
"}}}
