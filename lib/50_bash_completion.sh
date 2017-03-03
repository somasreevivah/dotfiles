
COMPLETION_PATHS=(
/etc/
$HOME/.local/etc/
$HOME/.config/
$HOME/local/etc/
)

for path in ${COMPLETION_PATHS[@]} ; do
  if [ -f ${path}/bash_completion ]; then
    . ${path}/bash_completion
  elif [ -d ${path}/bash_completion.d ]; then
    for script in  ${path}/bash_completion.d/*; do
      . ${script}
    done
  fi
done




