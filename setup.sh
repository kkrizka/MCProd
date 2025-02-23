if [[ `basename $PWD` != "MCProd" ]]; then echo "Execute from MCProd dir"; exit; fi

export prodBase=$PWD
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${prodBase}/lib
export PATH=$PATH:$prodBase/bin

if [[ $HOSTNAME == "login.snowmass21.io" ]]; then
    #important
    module load python/2.7.15
    module load py-numpy/1.15.2-py2.7
    module load py-six/1.11.0-py2.7
    #. /cvmfs/sft.cern.ch/lcg/app/releases/ROOT/6.22.08/x86_64-centos7-gcc48-opt/bin/thisroot.sh
    source /cvmfs/sft.cern.ch/lcg/releases/LCG_99/ROOT/v6.22.06/x86_64-centos7-gcc10-opt/ROOT-env.sh
    
    #convenient
    module load emacs
else
    which root >> /dev/null
    if [[ $? -ne 0 ]]; then
	echo "Please ensure ROOT is available and retry"
	exit
    fi
fi
