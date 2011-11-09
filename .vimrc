
""" Basics
set nobackup
set noswapfile



""" vundle
set nocompatible
filetype off

set rtp+=~/.vim/vundle/
call vundle#rc()

Bundle 'Shougo/unite.vim'
Bundle 'thinca/vim-quickrun'
Bundle 'thinca/vim-ref'

filetype plugin on
filetype indent on



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
nmap <ESC><ESC> ;nohlsearch<CR><ESC>



""" Edit
set expandtab

" Strip tailing space
autocmd BufWritePre * :%s/\s\+$//ge
" Tab -> space
autocmd BufWritePre * :%s/\t/  /ge



