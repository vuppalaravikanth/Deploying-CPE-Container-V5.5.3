#!/bin/sh

dir=$1; shift
size=$1; shift
name=$1; shift
server=`hostname`
namespace=$1;shift

echo creating $dir

mkdir $dir -p

chown 50001:50000 -R $dir
chmod -R 777 $dir

cat <<EOF | sed s!NAME!$name! | sed s!SIZE!$size! | sed s!DIR!$dir! | sed s!SERVER!$server! | sed s!NSP!$namespace! >> create_pvs.yaml
{
  "kind": "PersistentVolume",
  "apiVersion": "v1",
  "metadata": {
    "name": "NAME-pv",
    "labels": {}
  },
  "spec": {
    "storageClassName": "NAME",
    "capacity": {
      "storage": "SIZE"
    },
    "accessModes": [
      "ReadWriteMany"
    ],
    "persistentVolumeReclaimPolicy": "Retain",
    "nfs": {
      "path": "DIR",
      "server": "SERVER"
    }
  }
}

{
  "kind": "PersistentVolumeClaim",
  "apiVersion": "v1",
  "metadata": {
    "name": "NAME-pvc",
    "namespace": "NSP"
  },
  "spec": {
    "storageClassName": "NAME",
    "resources": {
      "requests": {
        "storage": "SIZE"
      }
    },
    "accessModes": [
      "ReadWriteMany"
    ]
  }
}

EOF
