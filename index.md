Welcome to the Deploying-CPE-Container-V5.5.3 Tutorial

This Project explains how to deploy IBM FileNet P8 Content Platform Engine(CPE) Container V5.5.3 to the Red Hat Open Shift cluster

### <B>Software's</B>

Db2 Enterprise V11.1.1.1<br/>
Open LDAP<br/>
Red Hat OpenShift (RHOCP) 3.11<br/>
Red Hat Enterprise Linux (RHEL) 7.7 (64-bit)<br/>
ICP4A19.0.1-ecm.tgz
<br/><br/>
Red Hat Open Shift is configured in the following servers
<table>
  <tr><td>VM</td><td>RHCOCP Node type</td><td>IP address</td><td>IP address</td></tr>
  <tr><td>VM1- OCP master</td><td>Master</td><td>10.0.0.1</td><td>master.cp4a.com</td></tr>
  <tr><td>VM2- OCP compute1</td><td>Compute</td><td>10.0.0.2</td><td>compute1.cp4a.com</td></tr>
  <tr><td>VM3- OCP compute 2</td><td>Compute</td><td>10.0.0.3</td><td>compute2.cp4a.com</td></tr>  
</table>
<br/><br/>
### URLs
<br/>
OpenShift web console:https://master.cp4a.com:8443<br/>
LDAP console: https://master.cp4a.com:6443<br/>
Administrative console for Content Engine (ACCE)
http://master.cp4a.com:<http NodePort>/acce<br/>

### Step 1 Create New Project
<br/>
Login to the open shift console using CLI<br/>
#oc login https://console.cp4a.com:8443 -u admin -p passw0rd<br/>
Get the status of the Nodes<br/>
#oc get nodes<br/>
Create a new project cpe-lab<br/>
#oc new-project cpe-lab<br/>

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

### Step3 Prepare the database required by Content Platform Engine
Go to the db2 folder and list its contents<br/>
```
#cd /root/labfiles/cpelab/db2
```
```
#ls
```
Make the database scripts executable, and copy them to the home directory of the Db2 instance user, who can access the database.<br/>
```
#chmod +x *.sh
```
```
#cp *.sh /home/db2admin
```
Switch to the db2admin directory and list the contents to verify that the scripts were copied successfully.<br/>
```
#cd /home/db2admin
```
```
#ls
```
Run the setfilenetworkload.sh script for the Db2 configuration.<br/>
```
#su - db2admin ./setfilenetworkload.sh
```
Create the GCDDB database by running the create_gcddb.sh script.<br/>
```
#su - db2admin ./create_gcddb.sh
```
Create the OS1DB database by running the create_os1db.sh script. <br/>
```
#su - db2admin ./create_os1db.sh
```
Verify that the GCDDB and the OS1DB databases are listed by executing the following command<br/>
```
#su - db2admin ./db2_list_databases.sh
```
Add the java archives for accessing the Db2 server.Copy the Db2 Client files into the persistent volume directory configDropins_overrides.<br/>
```
#cp /opt/ibm/db2/V11.1/java/db2jcc* /nfs/cpe-lab/configDropins_overrides
```
Switch back to the /root/labfiles/cpelab/db2 folder.<br/>
```
#cd /root/labfiles/cpelab/db2
```
Copy the XML files to the configDropins_overrides directory <br/>
```
#cp *.xml /nfs/cpe-lab/configDropins_overrides
```
