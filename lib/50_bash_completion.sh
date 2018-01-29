dfs_log sourcing 50_bash_completion.sh
# I will ignore it until I find out what is slowing
# down the sourcing of the bahsrc

#ETC IS slowing everything down

COMPLETION_PATHS=(
/etc/
$HOME/.local/etc/
$HOME/.config/
$HOME/local/etc/
)

for path in ${COMPLETION_PATHS[@]} ; do
  if [ -f ${path}/bash_completion ]; then
    dfs_log "  sourcing ${path}/bash_completion"
    . ${path}/bash_completion
  elif [ -d ${path}/bash_completion.d ]; then
    for script in  ${path}/bash_completion.d/*; do
      dfs_log "  sourcing script ${script}"
      . ${script}
    done
  fi
done




