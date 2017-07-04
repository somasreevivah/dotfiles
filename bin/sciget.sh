#! /usr/bin/env bash

#link=ttp://sci-hub.io/10.1103/PhysRevLett.52.997
link=$1
output_pdf=output.pdf

log() {
  echo "$(basename $0)> $@"
}

if [[ ! ${link} =~ http* ]]; then
  link="http://sci-hub.io/$link"
fi

pdf_url=http:$(curl -s ${link} | grep -Eom1 '//[^ ]+\.pdf')

echo
log "link = ${link}"
log "pdf_url = ${pdf_url}"
echo

if [[ -z ${pdf_url} ]]; then
  exit 1
fi

cat <<EOF

 ____   ____ ___      _   _ _   _ ____  
/ ___| / ___|_ _|    | | | | | | | __ ) 
\___ \| |    | |_____| |_| | | | |  _ \ 
 ___) | |___ | |_____|  _  | |_| | |_) |
|____/ \____|___|    |_| |_|\___/|____/ 
                                        

        Downloading...


EOF

wget ${pdf_url} -O ${output_pdf}

if ! file ${output_pdf} | grep PDF ; then
  log "${output_pdf} is not a pdf, going to the website"
  ${BROWSER} ${pdf_url}
  read -p "Robots ready? (y/N)" -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    log "Downloading again ..."
    wget ${pdf_url} -O ${output_pdf}
    if ! file ${output_pdf} | grep PDF ; then
      log "There was a problem downloading the file"
      rm ${output_pdf}
      exit 1
    fi
  else
    log "Exiting.."
    rm ${output_pdf}
    exit 0
  fi
  REPLY= # unset REPLY after using it
fi

#vim-run: bash % 10.1103/PhysRevLett.52.997
#vim-run: bash % http://sci-hub.io/10.1103/PhysRevLett.52.997
