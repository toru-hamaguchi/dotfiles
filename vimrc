
""" Basics
set backup
set swapfile
set backupdir=~/.vim/backup
set directory=~/.vim/swap



""" vundle
set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

" Plugin
NeoBundle 'chrismetcalf/vim-yankring'
NeoBundle 'docunext/closetag.vim'
NeoBundle 'gregsexton/MatchTag'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'mattn/zencoding-vim.git'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'othree/eregex.vim'
NeoBundle 'pangloss/vim-javascript'
" TODO: mbyte-IME
"NeoBundle 'Raimondi/delimitMate'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'vim-scripts/savevers.vim'
NeoBundle 'vim-scripts/sudo.vim'

" Syntax
NeoBundle 'hallison/vim-markdown'
NeoBundle 'vim-scripts/actionscript.vim--Leider'

" Color scheme
NeoBundle 'imsizon/wombat.vim'

filetype plugin indent on



""" Status line
if winwidth(0) >= 120
  set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %F%=[%{GetB()}]\ %l,%c%V%8P
else
  set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %f%=[%{GetB()}]\ %l,%c%V%8P
endif

augroup InsertHook
  autocmd!
  autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
  autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

function! GetB()
  let c = matchstr(getline('.'), '.', col('.') - 1)
  let c = iconv(c, &enc, &fenc)
  return String2Hex(c)
endfunction
" help eval-examples
" The function Nr2Hex() returns the Hex string of a number.
func! Nr2Hex(nr)
  let n = a:nr
  let r = ""
  while n
    let r = '0123456789ABCDEF'[n % 16] . r
    let n = n / 16
  endwhile
  return r
endfunc
" The function String2Hex() converts each character in a string to a two
" character Hex string.
func! String2Hex(str)
  let out = ''
  let ix = 0
  while ix < strlen(a:str)
    let out = out . Nr2Hex(char2nr(a:str[ix]))
    let ix = ix + 1
  endwhile
  return out
endfunc



""" Apperance
set number

" Zenkaku space
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" Highlight cursor line
set cursorline
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END



""" Indent
set tabstop=2 shiftwidth=2 softtabstop=0



""" Search
nmap <Esc><Esc> :nohlsearch<CR><Esc>



""" Edit
set expandtab

" Strip tailing space
autocmd BufWritePre * :%s/\s\+$//ge
" Tab -> space
autocmd BufWritePre * :%s/\t/  /ge



""" eregex.vim
nnoremap / :M/
nnoremap ? :M?
nnoremap ,/ /
nnoremap ,? ?



""" neocomplcache
let g:neocomplcache_enable_at_startup=1



""" savevers.vim
set patchmode=.clean
let savevers_types='*'
let savevers_dirs=&backupdir
let versdiff_no_resize=1
nmap <silent> <F5> :VersDiff -<CR>
nmap <silent> <F6> :VersDiff +<CR>
nmap <silent> <Leader>vq :VersDiff -c<CR>



""" tagbar
nnoremap <silent> <leader>l :TagbarToggle<CR>



""" unite.vim
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



""" vim-indent-guides
"let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1



""" vim-surround
" TODO: Temporary.
autocmd VimEnter * xunmap s



""" vim-quickrun
let g:quickrun_config={}
let g:quickrun_config['markdown']={
      \ 'type': 'markdown/pandoc',
      \ 'cmdopt': '-s',
      \ 'outputter': 'browser'
      \ }


""" vim-yankring
let g:yankring_history_dir='~/.vim'



""" vimfiler
let g:vimfiler_as_default_explorer=1



""" vimshell
nnoremap <silent> ,is :VimShell<CR>
nnoremap <silent> ,ipy :VimShellInteractive python<CR>
nnoremap <silent> ,irb :VimShellInteractive irb<CR>
" eval current line.
vmap <silent> ,ss :VimShellSendString<CR>
" eval selection.
nnoremap <silent> ,ss <S-v>:VimShellSendString<CR>



