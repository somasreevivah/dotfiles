#! /usr/bin/env bash

url=$(cut -d " " -f 1 <<<"$@")
cmd=$(cut -d " " -f 2- <<<"$@")

if grep "%s" <<<"${cmd}" > /dev/null; then
  cmd=$(echo "${cmd}" | sed "s*%s*$(sed "s/\*/\\\*/g" <<<$url)*g")
else
  cmd="${cmd} ${url}"
fi

echo "url: ${url}"
echo "cmd: ${cmd}"

${cmd}


#vim-run: bash % https://google.com echo %s

