
fkf() {
  ssh gallo@mz4.fkf.mpg.de $@
}

dfs_is_on_mpi_fkf || return 1

aba() {
  ssh abakus01 $@
}


####################
#  MaxPlanck stuff  #
####################



test -s ~/.alias && . ~/.alias || true

ulimit -s unlimited
module purge
module load  mpi.intel/5.1.2 ifort/16.0.1

# set p4vasp environment variables
export PATH=$PATH:$HOME/opt/p4vasp/bin
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/home/gallo/opt/boost/boost_1_55_0/stage/lib/

#set ase environment 
export PYTHONPATH=$PYTHONPATH:$HOME/lib/python/site-packages/ase
export PATH=$PATH:$HOME/lib/python/site-packages/ase/tools
export PATH=$PATH:/usr/local/server/bin/
export PATH=$PATH:$HOME/software/vpqrs/src/vtstscripts/

#set my local python
export PYTHONPATH=$PYTHONPATH:$HOME/lib/python/site-packages/

# For Wien2k
export PATH=$PATH:/usr/local/fkf/WIEN2000_13/SLES11/
export WIENROOT=/usr/local/fkf/WIEN2000_13/SLES11/
export EDITOR=vi

# Perl stuff 
#PATH="/home/gallo/perl5/bin${PATH+:}${PATH}"; export PATH;
#PERL5LIB="/home/gallo/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
#PERL_LOCAL_LIB_ROOT="/home/gallo/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
#PERL_MB_OPT="--install_base \"/home/gallo/perl5\""; export PERL_MB_OPT;
#PERL_MM_OPT="INSTALL_BASE=/home/gallo/perl5"; export PERL_MM_OPT;

# ALIASES
abacd() {
  echo "cd $PWD" > $HOME/.ssh_cd

}
abac() {
  ssh abakus01 "cd ${PWD} ; $@"
}
alias molpro='/usr/local/fkf/Molpro/Molpro_OpenSuSE/molprop_2012_1_Linux_x86_64_i8/bin/molpro'

export OMP_NUM_THREADS=1
