
### Step4 Create Persistent Volumes
Login to the Open LDAP console URL: https://console.cp4a.com:6443<br/>
Create the users mentioned in /root/labfiles/cpelab/ldap/p8users.ldif
Go to the folder /root/labfiles/cpelab/ldap/ and copy the file ldap_TDS.xml to the configDropins_overrides directory.
```
#cd /root/labfiles/cpelab/ldap
#ls
#cp ldap_TDS.xml /nfs/cpe-lab/configDropins_overrides
```
