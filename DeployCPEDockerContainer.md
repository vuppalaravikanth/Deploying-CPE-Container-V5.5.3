### Deploy the Content Platform Engine container
Go to the deploy folder and view its content.
```
#cd /root/labfiles/cpelab/deploy
#ls
```
The deploy folder contains the Helm chart and values.yaml file. Open the values.yaml file using any text editor.<br/>
Check the image tag in the vlaues.yaml file. The image tag contains details for accessing the CPE container<br/>
Check the dataVolume section. The dataVolume specification has been adapted to match the names of the persistent volume claims, which were created by the script before.<br/>
Delete old secret, if present.
```
#oc delete secret admin.registrykey -n cpe-lab
```
Create an authentication token for the internal docker registry to connect to the internal docker registry.
```
#oc whoami -t
```
Create a new secret
```
oc create secret docker-registry admin.registrykey
--docker-server=docker-registry.default.svc:5000 --docker-username=admin
--docker-password='<token>' --docker-email=ecmtest@ibm.edu -n cpe-lab
```
Verify correct installation of the admin.registrykey. Check the output and confirm that the password returned is the same token value that you entered before.
```
oc get secret admin.registrykey --output="jsonpath={.data.\.dockerconfigjson}" |
base64 --decode
```
Run the command to use gedit.
```
export EDITOR=gedit
```
Run the command to update the namespace.
```
oc edit namespace cpe-lab
```
In the editor, find the following two lines:
```
openshift.io/sa.scc.supplemental-groups: 1000130000/10000
openshift.io/sa.scc.uid-range: 1000130000/10000
```
Change the 1000130000/10000 value to 500/1000099999 for both the lines.
```
openshift.io/sa.scc.supplemental-groups: 500/1000099999
openshift.io/sa.scc.uid-range: 500/1000099999
```
Add privileges to the CPE project.
```
oc adm policy add-scc-to-user privileged -z default
```
Verify that you are in the /root/labfiles/cpelab/deploy folder.<br>
```
pwd
```
List the contents of the deploy folder and verify that ibm-dba-contentservices-3.0.0.tgz helm chart is listed.
```
ls
```
Install the CPE helm chart by using the helm command. Make sure to enter the entire command in a single line.
```
helm install ibm-dba-contentservices-3.0.0.tgz --name cpe-lab --namespace
cpe-lab --values values.yaml
```
If everything went well, the CPE container is deployed in few minutes

