### Access the running Content Platform Engine container

Identify ports and URL for the running containers. Verify that containers are running and Find the port numbers<br/>
```
oc describe service cpe-lab
```
Note the node port. There are two of them. One for an http request and the other for an https request.

Access the Content Engine URLs
ACCE URL
```
http://master.cp4a.com:<http node port>/acce
```
Content Engine Ping Page
```
https://master.cp4a.com:<https NodePort>/FileNet/Engine
```
Content Engine Health Page
```
https://master.cp4a.com:<https NodePort>/P8CE/Health
```
Content Engine Web Service
```
http://master.cp4a.com:<https NodePort>/wsi/FNCEWS40MTOM/
```

