### Step 7: Verify successful Content Platform Engine deployment

Check the status of the pod.
```
#oc get pods
```
Verify that there is one row for the cpe pod. Examine the status of the pod as it is being created. It takes few minutes for the pod to start and get into a Running status.<br/>
Run the below command to check deployment and get detailed information about the deployment.
```
#oc describe deployment cpe-lab
```
Run the command to check the replica and return the information that a pod is created.
```
#oc describe replicaset cpe-lab
```
Run the below command to view the pod creation messages and watch for errors.
```
#oc describe pod cpe-lab
```
The successful installation results in a running CPE container. Make sure that the status is Running for the pod.
```
#oc get pods
```
*[Home](index.md)*
