#! /usr/bin/env bash

searchWord=$HOME/hist_search
inBuffer=$HOME/hist_buffer
PROMPT="Pick:"

echo "" > ${inBuffer}
echo -n "" > ${searchWord}

clear_results() {
  local i
  for (( i = 1; i < (($(tput lines) -1)); i++ )); do
    tput cup ${i} 0
    tput dl1
  done
}

#initialize terminal
term_init(){
    POSX=0
    POSY=0
    tput init
    tput clear
}

create_buffer() {
  while read -r line; do
    echo ${line} >> ${inBuffer}
  done < "$1"
}

#call on SIGINT and SIGKILL
#it removes buffer before to stop
on_kill(){
    tput cup 0 0
    tput clear
    # Erase in-buffer
    exit 0
}
trap on_kill SIGINT SIGTERM

C_N=$(echo -n -e "\\x0e")
C_P=$(echo -n -e "\\x10")
ESC=$(echo -n -e "\\x1b")
BACKSPACE=$(echo -n -e "\\x7f")
ENTER=""

create_buffer "${1:-/dev/stdin}"

term_init

echo "asdf" > $(tty)

while : ; do

  tput cnorm                         # show cursor (normal)
  NO_REDRAW=
                                     # Print prompt
  tput cup 0 0
  tput setab 7
  tput setaf 0
  echo -n "${PROMPT}"
  tput setab 0
  tput setaf 7
  echo -n " "
  tput el                            # Clear to end of the line
  cat ${searchWord}                  # print out search
  IFS='' read -n 1 letter < /dev/tty # read in character
  tput civis                         # invisible cursor

  if [[ "${C_N}" = $(echo -ne "$letter") ]]; then
    tput cup ${arrow} 0
    echo -n " "
    [[ $arrow -lt $lines ]] && let arrow+=1
    NO_REDRAW=1
  elif [[ "${C_P}" = $(echo -ne "$letter") ]]; then
    tput cup ${arrow} 0
    echo -n " "
    [[ $arrow -gt 1 ]] && let arrow-=1
    NO_REDRAW=1
  elif [[ "${ESC}" = $(echo -ne "$letter") ]]; then
    on_kill
  elif [[ "${BACKSPACE}" = $(echo -ne "$letter") ]]; then
    sed -i 's/.$//g' ${searchWord}
  elif [[ "${ENTER}" = $(echo -ne "$letter") ]]; then
    tput clear
    sed -n ${arrow}p ~/grepped_test
    exit 0
  else
    echo -n "${letter}" >> $searchWord
  fi


  if [[ -z ${NO_REDRAW} ]]; then
    cat ${inBuffer} \
      | grep -E "$(cat ${searchWord})"  > ~/grepped_test
    clear_results
    lines=$(($(tput lines)-1))
    for (( i = 1; i < ${lines}; i++ )); do
      tput cup $i 2
      sed -n ${i}p  ~/grepped_test
    done
  fi

  #draw arrow
  tput cup ${arrow} 0
  tput setaf 1
  echo ">"
  tput setaf 7

done

#vim-run:  cat ~/.bash_history | ./%
#vim-run: bash %
#vim-run: cat ~/.bash_history | sed "/\#.*/d" | bash %
