dfs::is_on_mpi_fkf || return 1

####################
#  MaxPlanck stuff  #
####################



test -s ~/.alias && . ~/.alias || true

ulimit -s unlimited
module purge
module load  mpi.intel/5.1.2 ifort/16.0.1
export OMP_NUM_THREADS=1

# set p4vasp environment variables
export PATH=$PATH:/home/gallo/opt/p4vasp/bin

#set ase environment 
export PYTHONPATH=$PYTHONPATH:$HOME/lib/python/site-packages/ase
export PATH=$PATH:$HOME/lib/python/site-packages/ase/tools

#set my local python
export PYTHONPATH=$PYTHONPATH:$HOME/lib/python/site-packages/

export PATH=$PATH:/home/gallo/.local/bin
