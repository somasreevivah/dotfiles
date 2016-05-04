
##########################
#  LOCALE CONFIGURATION  #
##########################




if dfs_is_cluster_abakus; then
  #I do not know if this is necessary
  export LC_CTYPE=C
else
  export LC_ALL=en_GB.utf8
fi
