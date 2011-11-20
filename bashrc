
# Git
if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  . /usr/local/etc/bash_completion.d/git-completion.bash
  GIT_PS1_SHOWDIRTYSTATE=true
  export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\W\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '
fi

