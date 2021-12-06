#!/bin/bash

if [[ `basename $PWD` != "MCProd" ]]; then echo "Execute from MCProd dir"; exit; fi

source setup.sh

cd MG5_aMC_v3_1_1
#rm -rf step*
rm -rf step2

#python ./bin/mg5_aMC < ../lepMult/step1.mg
python ./bin/mg5_aMC < ../lepMult/step2.mg

#gunzip step1/Events/run_0?/unweighted_events.lhe.gz
gunzip step2/Events/run_0?_decayed_1/unweighted_events.lhe.gz

echo
cat step1/Events/run_01/unweighted_events.lhe | grep "\-15  1" | wc -l
cat step1/Events/run_02/unweighted_events.lhe | grep "\-15  1" | wc -l
cat step2/Events/run_01_decayed_1/unweighted_events.lhe | grep "\-15  1" | wc -l
cat step2/Events/run_02_decayed_1/unweighted_events.lhe | grep "\-15  1" | wc -l

cd ..
