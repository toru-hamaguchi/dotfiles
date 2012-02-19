
## Japanese settings.
export LANG=ja_JP.UTF-8



## Auto complete.
autoload -U compinit
compinit



## Prompt.
autoload colors
colors

case ${UID} in
0)
  PROMPT="[%{${fg[blue]}%}%n@%m%{${reset_color}%}] %{${fg[blue]}%}#%{${reset_color}%} "
  PROMPT2="%B%{${fg[blue]}%}%_#%{${reset_color}%}%b "
  SPROMPT="%B%{${fg[blue]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
  RPROMPT="%{${fg[blue]}%}[%/]%{${reset_color}%}"
  ;;
*)
  PROMPT="[%n@%m] %{${fg[blue]}%}#%{${reset_color}%} "
  PROMPT2="%B%{${fg[blue]}%}%_#%{${reset_color}%}%b "
  SPROMPT="%B%{${fg[blue]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
  RPROMPT="%{${fg[blue]}%}[%/]%{${reset_color}%}"
  ;;
esac



## Misc.
setopt prompt_subst

setopt nobeep

setopt long_list_jobs

setopt list_types

setopt auto_resume

setopt auto_list

setopt list_packed

## No dups commands.
setopt hist_ignore_dups

## Auto pushd.
setopt autopushd

## No pushd dups.
setopt pushd_ignore_dups

## Use "#, ~, ^" as meta chars in file name.
setopt extended_glob

## Switch auto completion with TAB.
setopt auto_menu

## Record zsh times.
setopt extended_history

## Expand =command
setopt equals

## Auto complete equal subsets.
setopt magic_equal_subst

## Verify history.
setopt hist_verify

## Numeric sort.
setopt numeric_glob_sort

## Print 8 bit.
setopt print_eight_bit

## Share history.
setopt share_history

## Enable cursor selection.
zstyle ':completion:*:default' menu select=1

## Colors.
#eval `dircolors`
export LSCOLORS=ExFxCxdxBxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

## Auto cd.
setopt auto_cd

## Auto brace.
setopt auto_param_keys

## Auto append directory slash.
setopt auto_param_slash

## Spell check.
setopt correct

## Alias.
setopt complete_aliases

case ${OSTYPE} in
freebsd*|darwin*)
  alias ls="ls -G -w"
  ;;
linux*)
  alias ls="ls --color"
  ;;
esac

export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

## No auto slash remove.
setopt noautoremoveslash

## Seach.
export TEXT_BROWSER=w3m

function _space2p20 {
  echo $@ | sed -e "s/ /%20/g"
}

function _space2plus {
  echo $@ | sed -e "s/ /+/g"
}

function google {
  ${TEXT_BROWSER} "http://www.google.co.jp/search?q="`_space2plus $@`"&lh=ja"
}

