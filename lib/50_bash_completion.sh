

COMPLETION_PATH=${HOME}/.config/bash_completion.d


[[ ! -d ${COMPLETION_PATH} ]] && return 1


for COMPLETION_FILE in ${COMPLETION_PATH}/* ; do
  source ${COMPLETION_FILE}
done
