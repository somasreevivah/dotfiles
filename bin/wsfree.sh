#! /usr/bin/env bash


get_href() {
  while read line ; do
    echo $line;
  done \
  | sed 's/href/\nhref/g' \
  | grep href \
  | sed "s/href\s*=\s*\"//" \
  | sed "s/\".*//"
}


SERIE=${1}
SERIE=serie/futurama
BASE_URL=https://watchseriesfree.to
BASE_URL=https://seriesfree.to
PROVIDER=nowvideo
ISOLATE_2="open/cale"
DATA_FILE=${PROVIDER}_$(tr -d "/" <<<"${SERIE}").txt

URL=${BASE_URL}/${SERIE}/ 

curl -s ${URL} |
  get_href                    |
  grep html                   |
  while read episode; do
    echo "${episode}";
    echo ${episode}                          |
      tee -a ${DATA_FILE}                    |
      xargs -n1 -I {} curl -s ${BASE_URL}/{} |
      grep ${PROVIDER}                       |
      get_href                               |
      grep html                              |
      uniq                                   |
      grep ${ISOLATE_2}                      |
      head -1                                |
      xargs -n1 -I {} curl -s ${BASE_URL}/{} |
      grep ${PROVIDER}                       |
      get_href                               |
      tee -a ${DATA_FILE}
done


#vim-run: bash %  serie/Narcos
#vim-run: bash %  serie/futurama
#vim-run: bash %  season-2/narcos
