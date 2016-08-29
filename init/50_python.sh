



if ! type pip 2>&1 > /dev/null ; then
  dfs_error "No pip found..."
  return 1
fi

PYTHON_PACKAGES_LOCAL=(
shellpic
tldr
pyfiglet
)


for package in ${PYTHON_PACKAGES_LOCAL[@]} ; do
  if pip list | grep -i ${package} 2>&1 ;then
    continue
  fi
  pip install --user ${package}
done

#vim-run: bash %
