if [[ $(hostname) =~ abakus ]]; then
  return
fi
eval "$(register-python-argcomplete papis)"
