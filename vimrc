
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
set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

" Plugin.
NeoBundle 'docunext/closetag.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/zencoding-vim.git'
NeoBundle 'othree/eregex.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vinarise'
NeoBundle 'spolu/dwm.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'vim-scripts/savevers.vim'
NeoBundle 'vim-scripts/sudo.vim'
NeoBundle 'vim-scripts/YankRing.vim'

" Syntax.
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'hallison/vim-markdown'
NeoBundle 'vim-scripts/actionscript.vim--Leider'

" Color scheme.
NeoBundle 'imsizon/wombat.vim'

syntax on
filetype plugin indent on
"}}}

" Apperance."{{{

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
" eregex.vim
nnoremap / :M/
nnoremap ? :M?
nnoremap ,/ /
nnoremap ,? ?

" neocomplcache
let g:neocomplcache_enable_at_startup=1

" open-browser.vim
let g:netrw_nogx=1  " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" savevers.vim
set patchmode=.clean
let savevers_types='*'
let savevers_dirs=&backupdir
let versdiff_no_resize=1
nmap <silent> <F5> :VersDiff -<CR>
nmap <silent> <F6> :VersDiff +<CR>
nmap <silent> <Leader>vq :VersDiff -c<CR>

" tagbar
nnoremap <silent> <leader>l :TagbarToggle<CR>

" unite.vim
let g:unite_enable_start_insert=1
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

" vim-powerline
set laststatus=2  " Always show the statusline
set t_Co=256  " Explicitly tell vim that the terminal supports 256 colors

" vim-quickrun
let g:quickrun_config={}
let g:quickrun_config['markdown']={
      \ 'type': 'markdown/pandoc',
      \ 'cmdopt': '-s',
      \ 'outputter': 'browser'
      \ }

" vim-yankring
let g:yankring_history_dir='~/.vim'

" vimfiler
let g:vimfiler_as_default_explorer=1

" vimshell
nnoremap <silent> ,is :VimShell<CR>
nnoremap <silent> ,ipy :VimShellInteractive python<CR>
nnoremap <silent> ,irb :VimShellInteractive irb<CR>
" eval current line.
vmap <silent> ,ss :VimShellSendString<CR>
" eval selection.
nnoremap <silent> ,ss <S-v>:VimShellSendString<CR>
"}}}

" vim:set foldmethod=marker :
