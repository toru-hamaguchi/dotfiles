
## Homebrew
export PATH=/usr/local/bin:/usr/local/sbin/:$PATH

## z.sh
. `brew --prefix`/etc/profile.d/z.sh
function precmd () {
  z --add "$(pwd -P)"
}

