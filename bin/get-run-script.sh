#! /usr/bin/env bash

cat <<'EOF'
#! /bin/bash
# @ job_name = test_5
# @ job_type=MPICH
# @ output = job1.$(host).$(jobid).$(stepid).out
# @ error =  job1.$(host).$(jobid).$(stepid).out
# @ class = 168h
# @ restart = no
# @ node = 1
# @ total_tasks = 16
# @ queue

. /usr/share/modules/init/bash
module add ifort/16.0.1
module add mpi.intel/5.1.2
module list

VASP="mpiexec.hydra -bootstrap ll $HOME/bin/vasp_nc"
echo ${VASP}





$VASP

EOF
