
### Step2 Create Persistent Volumes
Go to the pv folder<br/>
  ```
#cd /root/labfiles/cpelab/pv
  ```
pv folder contains two files mkyaml.sh and allyamls.sh... Provide the executable permission with the below command<br/>
```
#chmod +x *.sh
```
The allyamls.sh script makes a reference to the mkyaml.sh script that in turn creates a new create_pvs.yaml file. Then, you run the newly created create_pvs.yaml file that creates the persistent volumes and persistent volume claims.<br/>
```
#./allyamls.sh
```
notify the NFS server to update the exported directories<br/>
```
#exportfs -arv
```
You are now ready to apply the created yaml file with the generated definitions of all persistent volumes and persistent volume claims<br/>
```
#oc apply -f create_pvs.yaml
```
Query the persistent volume claims to verify that several pv and pvc are created<br/>
```
#oc get pvc
```
Login to the Open shift Container Platform --> Cluster Console --> Storage --> Persistent Volumes<br/>
Verify the 7 PV are created.
