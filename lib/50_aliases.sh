dfs_log sourcing 50_aliases.sh

# terminal mode only, not gui
alias emacs="emacs -nw"

gdumb(){
  cat - | gnuplot "$@" -e 'set terminal dumb; plot "<cat"'
}
alias xa="xargs -n1"
alias grep="grep --color=auto"
alias qb="qutebrowser"
alias jc="jupyter-console"

alias bookis="papis -l books"
alias conis="papis -l contacts"
alias datis="papis -l datasheets"
alias vapis="papis --pick-lib --picktool vim gui --vim"
alias theis="papis -l /home/tsatsoulis/Documents/papers"
alias fixis="papis -l /home/bumblebee/Documents/Papers"
alias rawpapis="papis -c ~/.papis/simple-config"

alias pp="panplot"

rgrep() { grep -r "$@"; }
igrep() { grep -i "$@"; }
irgrep() { grep -ir "$@"; }

zat() {
  for i in $@; do
    [[ -f $i ]] && file=$i
  done
  [[ -n ${file} ]] &&
  zathura --data-dir=$(dirname $file)/.zathura/ $@ ||
  zathura $@
}

urxvt-font-change() {
  # example $@ = xft:Mono:size=30
  local size="$@"
  set -x
  printf '\e]710;%s\007' "$size"
  set +x
}
