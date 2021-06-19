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
