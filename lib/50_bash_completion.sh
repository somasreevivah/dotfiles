
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
    . ${path}/bash_completion.d/*
  fi
done




