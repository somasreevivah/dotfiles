#! /usr/bin/env bash

#link=ttp://sci-hub.io/10.1103/PhysRevLett.52.997
link=$1
output_pdf=output.pdf

if [[ ! ${link} =~ http* ]]; then
  link="http://sci-hub.io/$link"
fi

pdf_url=$(wget $link -qO - | grep -Eom1 'http://[^ ]+\.pdf')

echo
echo "sciget: pdf_url = ${pdf_url}"
echo

if [[ -z ${pdf_url} ]]; then
  exit 1
fi

cat <<EOF


        Downloading...


EOF

wget ${pdf_url} -O ${output_pdf}

if ! file ${output_pdf} | grep PDF ; then
  echo "sciget: ${output_pdf} is not a pdf, going to the website"
  ${BROWSER} ${pdf_url}
  read -p "Robots ready? (y/N)" -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "sciget: Downloading again ..."
    wget ${pdf_url} -O ${output_pdf}
    if ! file ${output_pdf} | grep PDF ; then
      echo "sciget: There was a problem downloading the file"
      rm ${output_pdf}
      exit 1
    fi
  else
    echo "sciget: Exiting.."
    rm ${output_pdf}
    exit 0
  fi
  REPLY= # unset REPLY after using it
fi

#vim-run: bash % 10.1103/PhysRevLett.52.997
#vim-run: bash % http://sci-hub.io/10.1103/PhysRevLett.52.997
