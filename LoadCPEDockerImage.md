### Load the Content Platform Engine docker images for Cloud Pak for Automation
Copy the image (ICP4A19.0.1-ecm.tgz) for ICP4A that are located under /root/labfiles/cp4a folder
```
#cd /root/labfiles/cp4a
#ls
```
Create a directory under /root/labfiles/cp4a and call it ecm.
```
#mkdir ecm
#cd ecm
```
Unpack the CP4A distribution file for the containers of the Enterprise Content Management system. The file name is ICP4A19.0.1-ecm.tgz.
```
#tar xvfz ../ICP4A19.0.1-ecm.tgz
```
It takes few minutes for all the images to be extracted. Verify that 5 images are extracted to the ecm folder<br/>
Make sure you are in ecm folder.
```
#ecm
```
Create a login token for the internal docker registry to connect to the internal docker registry.
```
#oc whoami -t
```
Log in to the internal docker registry by using an authentication token.
```
#docker login docker-registry.default.svc:5000 -u admin -p ‘<token>’
```
Open the manifest.json file under the ecm folder. Load the CPE image and push it to the internal docker registry.
```
#docker load < images/11f11b46d1bb531fa5f40938aba118fa42052c6f4e655d0c3733a33f990e2e27.tar.gz
```
Wait until the image is completely loaded into the docker registry. The command outputs the name of the image which it loads<br/>
Using the docker tag command, give the container an additional tag pointing to the RHOCP docker repository.
```
#docker tag cpe:ga-553-p8cpe docker-registry.default.svc:5000/cpe-lab/cpe:ga-553-p8cpe
```
Push the image to the RHOCP docker registry. It takes several minutes for the images to load.
```
#docker push docker-registry.default.svc:5000/cpe-lab/cpe:ga-553-p8cpe
```
To finish the configuration of the files in the configDropins_overrides directory, assign the files to the user id 50001, and the group id 50000.
```
#cd /nfs/cpe-lab/configDropins_overrides/
#chown 50001:50000 *
#chmod 755 *
```
Verify the permission and group change displays correctly.
```
#ls -l
```
![image](https://user-images.githubusercontent.com/1942588/122633765-33f96e80-d0a8-11eb-85ab-58e9a38713dc.png)

You are now ready to deploy the CPE container.

*[Home](index.md)*
