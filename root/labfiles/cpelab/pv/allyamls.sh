#!/bin/sh

./mkyaml.sh /nfs/cpe-lab/configDropins_overrides 1Gi cpe-lab-icp-cfgstore cpe-lab
./mkyaml.sh /nfs/cpe-lab/log 5Gi cpe-lab-icp-logstore cpe-lab
./mkyaml.sh /nfs/cpe-lab/FileNet 5Gi cpe-lab-icp-fnlogstore cpe-lab
./mkyaml.sh /nfs/cpe-lab/lib_bootstrap 1Gi cpe-lab-icp-bootstrapstore cpe-lab
./mkyaml.sh /nfs/cpe-lab/temp 1Gi cpe-lab-icp-textextstore cpe-lab
./mkyaml.sh /nfs/cpe-lab/icmrules 1Gi cpe-lab-icp-icmrulesstore cpe-lab
./mkyaml.sh /nfs/cpe-lab/asa 10Gi cpe-lab-icp-filestore cpe-lab

echo run exportfs -arv
echo then run oc apply -f create_pvs.yaml
