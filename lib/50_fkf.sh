dfs::is_on_mpi_fkf || return 1

####################
#  MaxPlanck stuff  #
####################



test -s ~/.alias && . ~/.alias || true

ulimit -s unlimited
module purge
module load  mpi.intel/5.1.2 ifort/16.0.1

# set p4vasp environment variables
export PATH=$PATH:/home/gallo/opt/p4vasp/bin

#set ase environment 
export PYTHONPATH=$PYTHONPATH:$HOME/lib/python/site-packages/ase
export PATH=$PATH:$HOME/lib/python/site-packages/ase/tools

#set my local python
export PYTHONPATH=$PYTHONPATH:$HOME/lib/python/site-packages/

export PATH=$PATH:/home/gallo/.local/bin


# Perl stuff 
PATH="/home/gallo/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="/home/gallo/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/gallo/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/gallo/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/gallo/perl5"; export PERL_MM_OPT;

# ALIASES
alias aba="ssh abakus01"

export LANG=C
export LC_CTYPE=C
export OMP_NUM_THREADS=1
