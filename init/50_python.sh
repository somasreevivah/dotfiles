

if ! type pip3 2>&1 > /dev/null ; then
  dfs_error "No pip found..."
  return 1
fi

PYTHON3_PACKAGES_LOCAL=(
  shellpic
  tldr
  rtv
  pyfiglet
  cppman
  ranger-fm
  mps-youtube
)
PIP3=pip3


for package in ${PYTHON3_PACKAGES_LOCAL[@]} ; do
  if ${PIP3} list | grep -i ${package} 2>&1 ;then
    continue
  fi
  ${PIP3} install --user ${package}
done

#vim-run: bash %
