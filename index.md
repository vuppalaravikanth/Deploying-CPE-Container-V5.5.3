Welcome to the Deploying-CPE-Container-V5.5.3 Tutorial

This Project explains how to deploy IBM FileNet P8 Content Platform Engine(CPE) Container V5.5.3 to the Red Hat Open Shift cluster

### Software's

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

### URLs
OpenShift web console:https://master.cp4a.com:8443<br/>
LDAP console: https://master.cp4a.com:6443<br/>
Administrative console for Content Engine (ACCE)
http://master.cp4a.com:<http NodePort>/acce<br/>

### *[Step 1 : Create New Project](NewProject.md)*
  
### *[Step 2 : Create Persistent Volumes](CreatePersistentVolumes.md)*
  
### *[Step 3 : Prepare the database required by Content Platform Engine](CreateDatabase.md)*
  
### *[Step 4 : Prepare LDAP required by Content Platform Engine](LDAP.md)*
  
### *[Step 5 : Load the Content Platform Engine docker images for Cloud Pak for Automation](LoadCPEDockerImage.md)*
  
### *[Step 6 : Deploy the Content Platform Engine container](DeployCPEDockerContainer.md)*

### *[Step 7 : Verify successful Content Platform Engine deployment](VerifyInstallation.md)*

### *[Step 8 : Access the running Content Platform Engine container](AccessCPEContainer.md)*  
  

