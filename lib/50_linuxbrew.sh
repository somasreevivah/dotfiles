
[[ $(hostname) = pccq* || $(hostname) = bridge ]] || return 0

# Until LinuxBrew is fixed, the following is required.
# See: https://github.com/Homebrew/linuxbrew/issues/47
#export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/local/lib64/pkgconfig:/usr/lib64/pkgconfig:/usr/lib/pkgconfig:/usr/lib/x86_64-linux-gnu/pkgconfig:/usr/lib64/pkgconfig:/usr/share/pkgconfig:$PKG_CONFIG_PATH
## Setup linux brew
export LINUXBREWHOME=$HOME/.linuxbrew
export PATH=$LINUXBREWHOME/bin:$PATH
export PATH=/home/gallo/.linuxbrew/sbin:$PATH
export MANPATH=$LINUXBREWHOME/man:$MANPATH
export PKG_CONFIG_PATH=$LINUXBREWHOME/lib64/pkgconfig:$LINUXBREWHOME/lib/pkgconfig:$PKG_CONFIG_PATH
export LD_LIBRARY_PATH=$LINUXBREWHOME/lib64:$LINUXBREWHOME/lib:$LD_LIBRARY_PATH


if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

