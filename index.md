Welcome to the Deploying-CPE-Container-V5.5.3 Tutorial

This Project explains how to deploy IBM FileNet P8 Content Platform Engine(CPE) Container V5.5.3 to the Red Hat Open Shift cluster

<B>Software's</B>

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
<B>URLs</B><br/>
OpenShift web console: https://master.cp4a.com:8443<br/>
LDAP console: https://master.cp4a.com:6443<br/>
Administrative console for Content Engine (ACCE): http://master.cp4a.com:<http NodePort>/acce<br/>
<br/><br/>  
<B>Step 1: Create New Project</B><br/>
Login to the open shift console using CLI<br/>
#oc login https://console.cp4a.com:8443 -u admin -p passw0rd<br/>
Get the status of the Nodes<br/>
#oc get nodes<br/>
Create a new Project cpe-lab<br/>
#oc new-project cpe-lab<br/>

<br/><br/>
<B>Step 2: Create Persistent Volumes</B><br/>
Go to the pv folder<br/>
#cd /root/labfiles/cpelab/pv<br/>
pv folder contains two files mkyaml.sh and allyamls.sh... Provide the executable permission with the below command<br/>
#chmod +x *.sh<br/>
The allyamls.sh script makes a reference to the mkyaml.sh script that in turn creates a new create_pvs.yaml file. Then, you run the newly created create_pvs.yaml file that creates the persistent volumes and persistent volume claims.<br/>
#./allyamls.sh<br/>
notify the NFS server to update the exported directories<br/>
#exportfs -arv<br/>
You are now ready to apply the created yaml file with the generated definitions of all persistent volumes and persistent volume claims<br/>
#oc apply -f create_pvs.yaml<br/>
Query the persistent volume claims to verify that several pv and pvc are created<br/>
#oc get pvc<br/>
Login to the Open shift Container Platform --> Cluster Console --> Storage --> Persistent Volumes<br/>
Verify the 7 PV are created.
 
  
 
  
