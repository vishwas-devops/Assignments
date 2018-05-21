Docker Assignment 1
-------------------

Use official shell script to install and configure Docker on your control machine

curl https://get.docker.com | bash


Start Docker service and check status of the same

service docker start

[root@web01 ~]# service docker start
Redirecting to /bin/systemctl start docker.service


service docker status

[root@web01 ~]# service docker status
Redirecting to /bin/systemctl status docker.service
● docker.service - Docker Application Container Engine
   Loaded: loaded (/usr/lib/systemd/system/docker.service; disabled; vendor preset: disabled)
   Active: active (running) since Mon 2018-04-02 09:25:17 UTC; 2h 47min ago
     Docs: https://docs.docker.com
 Main PID: 4323 (dockerd)
   Memory: 231.7M
   CGroup: /system.slice/docker.service
           ├─4323 /usr/bin/dockerd
           ├─4327 docker-containerd --config /var/run/docker/containerd/containerd.toml
           ├─5097 docker-containerd-shim -namespace moby -workdir /var/lib/docker/containerd/daemon/io.containerd.runtime.v1.linux/moby/d434...
           ├─8926 docker-containerd-shim -namespace moby -workdir /var/lib/docker/containerd/daemon/io.containerd.runtime.v1.linux/moby/7f96...
           └─9090 docker-containerd-shim -namespace moby -workdir /var/lib/docker/containerd/daemon/io.containerd.runtime.v1.linux/moby/d2a6...

Apr 02 11:54:07 web01 dockerd[4323]: time="2018-04-02T11:54:07Z" level=info msg="shim docker-containerd-shim started" address="/cont...id=10444
Apr 02 11:54:27 web01 dockerd[4323]: time="2018-04-02T11:54:27Z" level=info msg="shim reaped" id=41d13e8ab3edc6039458a1c9400903302da...d/tasks"
Apr 02 11:54:27 web01 dockerd[4323]: time="2018-04-02T11:54:27.097671009Z" level=info msg="ignoring event" module=libcontainerd name...kDelete"
Apr 02 11:58:09 web01 dockerd[4323]: time="2018-04-02T11:58:09.240907071Z" level=error msg="Upload failed: denied: requested access ... denied"
Apr 02 11:58:09 web01 dockerd[4323]: time="2018-04-02T11:58:09.247020179Z" level=info msg="Attempting next endpoint for push after e... denied"
Apr 02 11:58:11 web01 dockerd[4323]: time="2018-04-02T11:58:11.892774008Z" level=info msg="failed to mount layer sha256:db584c622b50c3b8f9b8...
Apr 02 11:58:12 web01 dockerd[4323]: time="2018-04-02T11:58:12.926280042Z" level=info msg="failed to mount layer sha256:52f389ea437ebf419d1c...
Apr 02 11:58:14 web01 dockerd[4323]: time="2018-04-02T11:58:14.017289059Z" level=info msg="failed to mount layer sha256:52a7ea2bb533dc2a9161...
Apr 02 11:58:15 web01 dockerd[4323]: time="2018-04-02T11:58:15.378416985Z" level=info msg="failed to mount layer sha256:88888b9b1b5b7bce5db4...
Apr 02 11:58:16 web01 dockerd[4323]: time="2018-04-02T11:58:16.623197055Z" level=info msg="failed to mount layer sha256:a94e0d5a7c404d0e6fa1...
Hint: Some lines were ellipsized, use -l to show in full.


Enable Docker service to start at every machine reboot

chkconfig docker on
systemctl enable docker


Display Docker version

[root@web01 ~]# docker version
Client:
 Version:	18.03.0-ce
 API version:	1.37
 Go version:	go1.9.4
 Git commit:	0520e24
 Built:	Wed Mar 21 23:09:15 2018
 OS/Arch:	linux/amd64
 Experimental:	false
 Orchestrator:	swarm

Server:
 Engine:
  Version:	18.03.0-ce
  API version:	1.37 (minimum version 1.12)
  Go version:	go1.9.4
  Git commit:	0520e24
  Built:	Wed Mar 21 23:13:03 2018
  OS/Arch:	linux/amd64
  Experimental:	false


Configure non root user to run docker commands without sudo

[root@web01 ~]# docker exec -it d434613852ef /bin/bash
root@d434613852ef:/# useradd test12
root@d434613852ef:/# exit
exit
[root@web01 ~]# docker exec -u test12 -it d434613852ef /bin/bash
test12@d434613852ef:/$ free -m


System Information

CONTAINER ID        NAME                CPU %               MEM USAGE / LIMIT   MEM %               NET I/O             BLOCK I/O           PIDS
d2a64e1df3fd        gracious_booth      0.00%               452KiB / 488.4MiB   0.09%               732B / 0B           0B / 0B             1
7f9669c199a3        sharp_newton        0.00%               456KiB / 488.4MiB   0.09%               732B / 0B           6.21MB / 0B         1
d434613852ef        kavit1              0.00%               472KiB / 488.4MiB   0.09%               806B / 0B           20.2MB / 416kB      1



Check whether you can access/download images from DockerHub or not

First create account on docker 

now you can push and pull your images to Docker HUB

vim Dockerfile
FROM ubuntu
MAINTAINER kavit
RUN apt-get update -y
RUN apt-get install nginx -y

docker build -t test1

docker tag 8a912ef63f8b kavitnarwal/java:test1

docker push kavitnarwal/java:test1



