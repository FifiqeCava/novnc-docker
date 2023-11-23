# novnc-docker

noVNC Display files for Docker container that works on windows using browser. Useful for containered gui apps/software

  

This work is mostly inspired by [theasp](https://github.com/theasp/docker-novnc)

Trying to make some changes to improve the Vulnerabilities shown by the docker scout.

 

 / | Vulnerabilities  | Image size | 
   --- | --- | --- 
Original |  ```6C:15H:16M:79L``` | ~ 608M
modified | ```0C:4H:5M:4L``` | ~ 749M

## How to build and test on local machine

<br> Prepare the image on local machine </br>
<details markdown="1">
	<summary>Using git raw file</summary>
    
    docker image build https://raw.githubusercontent.com/aarsht7/novnc-docker/main/Dockerfile --tag <image-name-tag>
    
</details>  

<details markdown="1">
	<summary>Pull it from DockerHub</summary>
    
    docker pull 1at7/novnc:latest
    
</details>  

<details markdown="1">
	<summary>Using git clone</summary>
    
    git clone  https://github.com/aarsht7/novnc-docker 
    cd novnc-docker 
    docker image build --tag <image-name-tag> .
    
</details>

<br> Run it on the local machine </br>


```
docker run -d --rm --name=novnc --env="DISPLAY_WIDTH=1920" --env="DISPLAY_HEIGHT=1080" --env="RUN_XTERM=yes" --name=novnc -p=<ip>:8080:8080 <image-name-tag>
```

Note: If you have used docker pull, then \<image-name-tag\> will remain `1at7/novnc:latest` . \<ip\> is for security purpose and not exposing the port to the internet. You can ofcourse leave it blank but it can be anything that you prefer. for an example (127.111.123.1)

For more info on the risk of exposing them  [read this](https://docs.docker.com/network/#published-ports)

After running the above coomand, open the brovwer and go to the http://\<ip\>:8080/vnc.html 
After connecting, you should see the teminal running in the browser that is straming from docker.

For using it with another docker, start this docker and for the other docker, simply setup the environment variable for the DISPLAY to the `novnc:0.0`

