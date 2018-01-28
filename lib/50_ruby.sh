dfs_log sourcing 50_ruby.sh


for p in ${HOME}/.gem/ruby/*; do
  PATH=$PATH:${p}/bin
done
export PATH
