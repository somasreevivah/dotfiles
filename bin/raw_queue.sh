#!/bin/bash
# Author: Alejandro Gallo <aamsgallo@gmail.com> 2017-04-12 16:05

# "Checking if in abakus... "
if [[ ! $HOSTNAME =~ abakus ]]; then
  ABA="ssh abakus01"
else
  ABA=
fi

queue(){
  ${ABA} llq -W -f %dq %dd %o %jn %id %st %h %p %c %nh
  ${ABA} llstatus -L machine
}

list_idle_nodes(){
  local counter=0
  ${ABA} queue | grep Idle | grep -v Name | grep -v abakus01 |\
  while read line; do
    let counter+=1
    echo -e "$counter)\t"$line | cut -d " " -f 1
  done
}

llq_min(){
  local headers=/tmp/llq_headers.txt
  llq -x -d > $headers
  ${ABA} llq -W -f %dq %dd %o %jn %id %st %h %p %c %nh |
  awk '{ \
  if ($8 == "R"){ \
    A="R"; \
    USER=$5; \
    JOB=$7; \
    MACHINE=$9; \
    name=$6; \
    printf "+%s %s %s (%s) %s\n", USER, A, MACHINE, name, JOB; \
  } \
  else if ($6=="I"){ \
    A="W"; \
    USER=$3; \
    JOB=$5; \
    MACHINE=$7; \
    name=$4; \
    printf "-%s %s %s (%s) %s\n", USER, A, MACHINE,  name, JOB; \
  } \
}' | {
  while read line; do
    jobid=$(echo $line | awk '{print $NF}' |
      sed "s/abakus01\.//; s/\.0.*//" | tr -d "\r")
    tasks=$(
      sed -n "/"${jobid}"/,/total_tasks/s/.*total_tasks\s*=//p" $headers
      )
    #[[ -z "${tasks}" ]] && tasks="??"
    echo ${line} |
    awk '{ \
      for (i=1; i< NF; ++i) { \
        printf "%s ", $i; \
      } \
    }';
    echo "${jobid} ${tasks}@$((tasks/16))"
  done
  }
}

window() {
  echo ""
  echo "$1"
  sed "s/./=/g" <<<"$1"
}

main(){
  window "Idle nodes ($(list_idle_nodes | wc -l)) $(date)" "red" "33%"
  paste <(list_idle_nodes)

  window "Queue ($(llq | grep abakus | wc -l) jobs)" "green" "67%"
  llq_min |
  sort    |
  column -t

}

main


# vim: fdm=marker
