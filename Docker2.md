Docket Assignment 2

Run a docker container from "hello-world" image. :-

[root@web01 ~]# 
[root@web01 ~]# docker run hello-world
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
ca4f61b1923c: Pull complete 
Digest: sha256:97ce6fa4b6cdc0790cda65fe7290b74cfebd9fa0c9b8c38e979330d547d22ce1
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://cloud.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/engine/userguide/

[root@web01 ~]# 
[root@web01 ~]# 



Pull "alpine" image from docker registry and see if image is available in your local image list. :-


[root@web01 ~]# docker pull alpine
Using default tag: latest
latest: Pulling from library/alpine
ff3a5c916c92: Pull complete 
Digest: sha256:7df6db5aa61ae9480f52f0b3a06a140ab98d427f86d8d5de0bedab9b8df6b1c0
Status: Downloaded newer image for alpine:latest
[root@web01 ~]# 
[root@web01 ~]# 
[root@web01 ~]# docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
kavitnarwal/java    test1               8a912ef63f8b        4 hours ago         209MB
test1               latest              8a912ef63f8b        4 hours ago         209MB
ubuntu              latest              f975c5035748        3 weeks ago         112MB
alpine              latest              3fd9065eaf02        2 months ago        4.15MB
hello-world         latest              f2a91732366c        4 months ago        1.85kB
[root@web01 ~]# 
[root@web01 ~]# 
[root@web01 ~]# 


Pull some specific version of docker "alpine" image from docker registry. :-


[root@web01 ~]# docker pull alpine:3.6
3.6: Pulling from library/alpine
605ce1bd3f31: Pull complete 
Digest: sha256:3d44fa76c2c83ed9296e4508b436ff583397cac0f4bad85c2b4ecc193ddb5106
Status: Downloaded newer image for alpine:3.6
[root@web01 ~]# 
[root@web01 ~]# 
[root@web01 ~]# docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
kavitnarwal/java    test1               8a912ef63f8b        4 hours ago         209MB
test1               latest              8a912ef63f8b        4 hours ago         209MB
ubuntu              latest              f975c5035748        3 weeks ago         112MB
alpine              latest              3fd9065eaf02        2 months ago        4.15MB
alpine              3.6                 77144d8c6bdc        2 months ago        3.97MB
hello-world         latest              f2a91732366c        4 months ago        1.85kB
[root@web01 ~]# 
[root@web01 ~]# 
[root@web01 ~]# 


Run a docker container from local image "alpine" and run an inline command "ls -l" while running container. :-


[root@web01 ~]# 
[root@web01 ~]# docker run -d -it 3fd9065eaf02 ls -la
37959a1f4415d0d8a00b906248198f81b26ab1bc50709e3cc15d4d6927db8141
[root@web01 ~]# 
[root@web01 ~]# 
[root@web01 ~]# docker ps -a
CONTAINER ID        IMAGE               COMMAND                  CREATED              STATUS                      PORTS               NAMES
37959a1f4415        3fd9065eaf02        "ls -la"                 11 seconds ago       Exited (0) 10 seconds ago                       awesome_stonebraker
2b3ad7bacfdf        alpine              "--name linux-alpine…"   About a minute ago   Created                                         brave_archimedes
50b07b072d31        hello-world         "/hello"                 6 minutes ago        Exited (0) 6 minutes ago                        optimistic_jones
281ad7e8728b        ubuntu              "useradd kavit"          5 hours ago          Exited (9) 5 hours ago                          dazzling_pike
d2a64e1df3fd        ubuntu              "/bin/bash"              5 hours ago          Up 5 hours                                      gracious_booth
7f9669c199a3        ubuntu              "/bin/bash"              5 hours ago          Up 5 hours                                      sharp_newton
d434613852ef        ubuntu              "/bin/bash"              6 hours ago          Up 6 hours                                      kavit1
[root@web01 ~]# 

Try to take login to container created using "alpine" image. :-

[root@web01 ~]# 
[root@web01 ~]# docker exec -it 37959a1f4415 /bin/bash
Error response from daemon: Container 37959a1f4415d0d8a00b906248198f81b26ab1bc50709e3cc15d4d6927db8141 is not running
[root@web01 ~]# 
[root@web01 ~]# 

Detach yourself from the container without making it exit/container kill. :-

[root@web01 ~]# docker exec -it d2a64e1df3fd /bin/bash
I have no name!@d2a64e1df3fd:/$ 
I have no name!@d2a64e1df3fd:/$ 
I have no name!@d2a64e1df3fd:/$ 
I have no name!@d2a64e1df3fd:/$ 
I have no name!@d2a64e1df3fd:/$ read escape sequence
[root@web01 ~]# 

Press ctrl+pq for same.


Check running containers and see if you can find out the stopped containers. :-


[root@web01 ~]# 
[root@web01 ~]# docker ps 
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
d2a64e1df3fd        ubuntu              "/bin/bash"         5 hours ago         Up 5 hours                              gracious_booth
7f9669c199a3        ubuntu              "/bin/bash"         5 hours ago         Up 5 hours                              sharp_newton
d434613852ef        ubuntu              "/bin/bash"         7 hours ago         Up 7 hours                              kavit1
[root@web01 ~]# 
[root@web01 ~]# 


[root@web01 ~]# docker ps -f "status=exited"
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS                      PORTS               NAMES
37959a1f4415        3fd9065eaf02        "ls -la"            31 minutes ago      Exited (0) 9 minutes ago                        awesome_stonebraker
50b07b072d31        hello-world         "/hello"            38 minutes ago      Exited (0) 38 minutes ago                       optimistic_jones
281ad7e8728b        ubuntu              "useradd kavit"     5 hours ago         Exited (9) 5 hours ago                          dazzling_pike
[root@web01 ~]# 
[root@web01 ~]# 


Stop running container. :-


[root@web01 ~]# docker ps -a
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                      PORTS               NAMES
37959a1f4415        3fd9065eaf02        "ls -la"                 32 minutes ago      Exited (0) 10 minutes ago                       awesome_stonebraker
2b3ad7bacfdf        alpine              "--name linux-alpine…"   33 minutes ago      Created                                         brave_archimedes
50b07b072d31        hello-world         "/hello"                 39 minutes ago      Exited (0) 39 minutes ago                       optimistic_jones
281ad7e8728b        ubuntu              "useradd kavit"          5 hours ago         Exited (9) 5 hours ago                          dazzling_pike
d2a64e1df3fd        ubuntu              "/bin/bash"              5 hours ago         Up 5 hours                                      gracious_booth
7f9669c199a3        ubuntu              "/bin/bash"              5 hours ago         Up 5 hours                                      sharp_newton
d434613852ef        ubuntu              "/bin/bash"              7 hours ago         Up 7 hours                                      kavit1
[root@web01 ~]# 
[root@web01 ~]# 
[root@web01 ~]# docker stop d2a64e1df3fd

d2a64e1df3fd
[root@web01 ~]# 
[root@web01 ~]# 
[root@web01 ~]# 
[root@web01 ~]# docker ps -a
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                      PORTS               NAMES
37959a1f4415        3fd9065eaf02        "ls -la"                 33 minutes ago      Exited (0) 10 minutes ago                       awesome_stonebraker
2b3ad7bacfdf        alpine              "--name linux-alpine…"   34 minutes ago      Created                                         brave_archimedes
50b07b072d31        hello-world         "/hello"                 39 minutes ago      Exited (0) 39 minutes ago                       optimistic_jones
281ad7e8728b        ubuntu              "useradd kavit"          5 hours ago         Exited (9) 5 hours ago                          dazzling_pike
d2a64e1df3fd        ubuntu              "/bin/bash"              5 hours ago         Exited (0) 2 seconds ago                        gracious_booth
7f9669c199a3        ubuntu              "/bin/bash"              5 hours ago         Up 5 hours                                      sharp_newton
d434613852ef        ubuntu              "/bin/bash"              7 hours ago         Up 7 hours                                      kavit1
[root@web01 ~]# 
[root@web01 ~]# 


Start container that was stopped earlier. :-

[root@web01 ~]# docker start d2a64e1df3fd
d2a64e1df3fd
[root@web01 ~]# 
[root@web01 ~]# 
[root@web01 ~]# docker ps -a
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                      PORTS               NAMES
37959a1f4415        3fd9065eaf02        "ls -la"                 34 minutes ago      Exited (0) 12 minutes ago                       awesome_stonebraker
2b3ad7bacfdf        alpine              "--name linux-alpine…"   35 minutes ago      Created                                         brave_archimedes
50b07b072d31        hello-world         "/hello"                 41 minutes ago      Exited (0) 41 minutes ago                       optimistic_jones
281ad7e8728b        ubuntu              "useradd kavit"          5 hours ago         Exited (9) 5 hours ago                          dazzling_pike
d2a64e1df3fd        ubuntu              "/bin/bash"              5 hours ago         Up 2 seconds                                    gracious_booth
7f9669c199a3        ubuntu              "/bin/bash"              5 hours ago         Up 5 hours                                      sharp_newton
d434613852ef        ubuntu              "/bin/bash"              7 hours ago         Up 7 hours                                      kavit1
[root@web01 ~]# 


Try to remove "alpine" image from your local system. :-


[root@web01 ~]# docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
test1               latest              8a912ef63f8b        4 hours ago         209MB
kavitnarwal/java    test1               8a912ef63f8b        4 hours ago         209MB
ubuntu              latest              f975c5035748        3 weeks ago         112MB
alpine              latest              3fd9065eaf02        2 months ago        4.15MB
alpine              3.6                 77144d8c6bdc        2 months ago        3.97MB
hello-world         latest              f2a91732366c        4 months ago        1.85kB
[root@web01 ~]# 
[root@web01 ~]# 

[root@web01 ~]# docker rmi -f 3fd9065eaf02
Untagged: alpine:latest
Untagged: alpine@sha256:7df6db5aa61ae9480f52f0b3a06a140ab98d427f86d8d5de0bedab9b8df6b1c0
Deleted: sha256:3fd9065eaf02feaf94d68376da52541925650b81698c53c6824d92ff63f98353
[root@web01 ~]# 
[root@web01 ~]# 
[root@web01 ~]# docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
kavitnarwal/java    test1               8a912ef63f8b        4 hours ago         209MB
test1               latest              8a912ef63f8b        4 hours ago         209MB
ubuntu              latest              f975c5035748        3 weeks ago         112MB
alpine              3.6                 77144d8c6bdc        2 months ago        3.97MB
hello-world         latest              f2a91732366c        4 months ago        1.85kB
[root@web01 ~]# 

Again pull "alpine" image from docker registry. :-

[root@web01 ~]# docker pull alpine
Using default tag: latest
latest: Pulling from library/alpine
ff3a5c916c92: Already exists 
Digest: sha256:7df6db5aa61ae9480f52f0b3a06a140ab98d427f86d8d5de0bedab9b8df6b1c0
Status: Downloaded newer image for alpine:latest
[root@web01 ~]# 
[root@web01 ~]# 
[root@web01 ~]# docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
test1               latest              8a912ef63f8b        4 hours ago         209MB
kavitnarwal/java    test1               8a912ef63f8b        4 hours ago         209MB
ubuntu              latest              f975c5035748        3 weeks ago         112MB
alpine              latest              3fd9065eaf02        2 months ago        4.15MB
alpine              3.6                 77144d8c6bdc        2 months ago        3.97MB
hello-world         latest              f2a91732366c        4 months ago        1.85kB
[root@web01 ~]# 


Take interactive login to bash while running docker container from "alpine" image. :-

[root@web01 ~]# docker run -d -it 3fd9065eaf02 
ee4eaffff0baaa25392dae8152a751087630151a2e0edc0b4e35738c6060ac5e
[root@web01 ~]# 
[root@web01 ~]# 
[root@web01 ~]# docker ps -a
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                         PORTS               NAMES
ee4eaffff0ba        3fd9065eaf02        "/bin/sh"                6 seconds ago       Up 5 seconds                                       elegant_panini
02e3e463a4c1        3fd9065eaf02        "/bin/bash"              2 minutes ago       Created                                            priceless_euler
a30499fa154e        3fd9065eaf02        "/bin/bash"              7 minutes ago       Created                                            clever_hopper
37959a1f4415        3fd9065eaf02        "ls -la"                 About an hour ago   Exited (0) 24 minutes ago                          awesome_stonebraker
2b3ad7bacfdf        alpine              "--name linux-alpine…"   About an hour ago   Created                                            brave_archimedes
50b07b072d31        hello-world         "/hello"                 About an hour ago   Exited (0) About an hour ago                       optimistic_jones
281ad7e8728b        ubuntu              "useradd kavit"          5 hours ago         Exited (9) 5 hours ago                             dazzling_pike
d2a64e1df3fd        ubuntu              "/bin/bash"              6 hours ago         Up 12 minutes                                      gracious_booth
7f9669c199a3        ubuntu              "/bin/bash"              6 hours ago         Up 6 hours                                         sharp_newton
d434613852ef        ubuntu              "/bin/bash"              7 hours ago         Up 7 hours                                         kavit1
[root@web01 ~]# 
[root@web01 ~]# 

[root@web01 ~]# docker exec -it ee4eaffff0ba /bin/sh
/ # 
/ # 
/ # 
/ # 


Run command inside container: echo "hello world" > hello.txt ls :-

[root@web01 ~]# docker exec -it ee4eaffff0ba /bin/sh
/ # 
/ # 
/ # 
/ # 
/ # echo "hello world" > hello.txt ls
/ # 
/ # 
/ # ls
bin        hello.txt  media      root       srv        usr
dev        home       mnt        run        sys        var
etc        lib        proc       sbin       tmp
/ # 
/ # 
/ # 
/ # cat hello.txt 
hello world ls
/ # 
/ # 


Take exit from same container without killing the container. :-

Press ctrl+p+q

Run another container using below command and check if you can find hello.txt within this container. You should find container isolations from step 3-5. docker container run alpine ls



[root@web01 ~]# 
[root@web01 ~]# docker run -d -it 3fd9065eaf02 
886696533f0ddbe19ddaca5bfcefee9951d156a2e6c57f9aa3237b75dcd29fb0
[root@web01 ~]# 
[root@web01 ~]# 
[root@web01 ~]# docker ps -a
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                         PORTS               NAMES
886696533f0d        3fd9065eaf02        "/bin/sh"                4 seconds ago       Up 3 seconds                                       dazzling_sinoussi
ee4eaffff0ba        3fd9065eaf02        "/bin/sh"                14 minutes ago      Up 14 minutes                                      elegant_panini
02e3e463a4c1        3fd9065eaf02        "/bin/bash"              16 minutes ago      Created                                            priceless_euler
a30499fa154e        3fd9065eaf02        "/bin/bash"              22 minutes ago      Created                                            clever_hopper
37959a1f4415        3fd9065eaf02        "ls -la"                 About an hour ago   Exited (0) 39 minutes ago                          awesome_stonebraker
2b3ad7bacfdf        alpine              "--name linux-alpine…"   About an hour ago   Created                                            brave_archimedes
50b07b072d31        hello-world         "/hello"                 About an hour ago   Exited (0) About an hour ago                       optimistic_jones
281ad7e8728b        ubuntu              "useradd kavit"          6 hours ago         Exited (9) 6 hours ago                             dazzling_pike
d2a64e1df3fd        ubuntu              "/bin/bash"              6 hours ago         Up 27 minutes                                      gracious_booth
7f9669c199a3        ubuntu              "/bin/bash"              6 hours ago         Up 6 hours                                         sharp_newton
d434613852ef        ubuntu              "/bin/bash"              7 hours ago         Up 7 hours                                         kavit1
[root@web01 ~]# docker exec -it 886696533f0d /bin/sh
/ # 
/ # 
/ # ls
bin    etc    lib    mnt    root   sbin   sys    usr
dev    home   media  proc   run    srv    tmp    var
/ # 


Stop a container using Container ID. :-

[root@web01 ~]# docker ps -a
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                         PORTS               NAMES
886696533f0d        3fd9065eaf02        "/bin/sh"                2 minutes ago       Up 2 minutes                                       dazzling_sinoussi
ee4eaffff0ba        3fd9065eaf02        "/bin/sh"                16 minutes ago      Up 16 minutes                                      elegant_panini
02e3e463a4c1        3fd9065eaf02        "/bin/bash"              19 minutes ago      Created                                            priceless_euler
a30499fa154e        3fd9065eaf02        "/bin/bash"              24 minutes ago      Created                                            clever_hopper
37959a1f4415        3fd9065eaf02        "ls -la"                 About an hour ago   Exited (0) 41 minutes ago                          awesome_stonebraker
2b3ad7bacfdf        alpine              "--name linux-alpine…"   About an hour ago   Created                                            brave_archimedes
50b07b072d31        hello-world         "/hello"                 About an hour ago   Exited (0) About an hour ago                       optimistic_jones
281ad7e8728b        ubuntu              "useradd kavit"          6 hours ago         Exited (9) 6 hours ago                             dazzling_pike
d2a64e1df3fd        ubuntu              "/bin/bash"              6 hours ago         Up 29 minutes                                      gracious_booth
7f9669c199a3        ubuntu              "/bin/bash"              6 hours ago         Up 6 hours                                         sharp_newton
d434613852ef        ubuntu              "/bin/bash"              7 hours ago         Up 7 hours                                         kavit1
[root@web01 ~]# 
[root@web01 ~]# 
[root@web01 ~]# docker stop 886696533f0d
886696533f0d
[root@web01 ~]# 
[root@web01 ~]# docker ps -a
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                         PORTS               NAMES
886696533f0d        3fd9065eaf02        "/bin/sh"                2 minutes ago       Exited (137) 2 seconds ago                         dazzling_sinoussi
ee4eaffff0ba        3fd9065eaf02        "/bin/sh"                17 minutes ago      Up 17 minutes                                      elegant_panini
02e3e463a4c1        3fd9065eaf02        "/bin/bash"              19 minutes ago      Created                                            priceless_euler
a30499fa154e        3fd9065eaf02        "/bin/bash"              24 minutes ago      Created                                            clever_hopper
37959a1f4415        3fd9065eaf02        "ls -la"                 About an hour ago   Exited (0) 41 minutes ago                          awesome_stonebraker
2b3ad7bacfdf        alpine              "--name linux-alpine…"   About an hour ago   Created                                            brave_archimedes
50b07b072d31        hello-world         "/hello"                 About an hour ago   Exited (0) About an hour ago                       optimistic_jones
281ad7e8728b        ubuntu              "useradd kavit"          6 hours ago         Exited (9) 6 hours ago                             dazzling_pike
d2a64e1df3fd        ubuntu              "/bin/bash"              6 hours ago         Up 29 minutes                                      gracious_booth
7f9669c199a3        ubuntu              "/bin/bash"              6 hours ago         Up 6 hours                                         sharp_newton
d434613852ef        ubuntu              "/bin/bash"              7 hours ago         Up 7 hours                                         kavit1
[root@web01 ~]# 


Start same container using ID and exec a command "echo 'hello world!'" in docker container without instantiating a new container. :-

[root@web01 ~]# docker start 886696533f0d
886696533f0d
[root@web01 ~]# 

[root@web01 ~]# docker exec -it 886696533f0d /bin/sh
/ # echo "hello world!"
hello world!
/ # read escape sequence
[root@web01 ~]# docker exec -it 886696533f0d /bin/sh 
/ # "echo 'hello world!'"
/bin/sh: echo 'hello world!': not found
/ # 
/ # echo "hello world!"
hello world!
/ # 


Inspect already downloaded "alpine" docker image using docker inspect command. :-

[root@web01 ~]# docker inspect 3fd9065eaf02
[
    {
        "Id": "sha256:3fd9065eaf02feaf94d68376da52541925650b81698c53c6824d92ff63f98353",
        "RepoTags": [
            "alpine:latest"
        ],
        "RepoDigests": [
            "alpine@sha256:7df6db5aa61ae9480f52f0b3a06a140ab98d427f86d8d5de0bedab9b8df6b1c0"
        ],
        "Parent": "",
        "Comment": "",
        "Created": "2018-01-09T21:10:58.579708634Z",
        "Container": "30e1a2427aa2325727a092488d304505780501585a6ccf5a6a53c4d83a826101",
        "ContainerConfig": {
            "Hostname": "30e1a2427aa2",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
            ],
            "Cmd": [
                "/bin/sh",
                "-c",
                "#(nop) ",
                "CMD [\"/bin/sh\"]"
            ],
            "ArgsEscaped": true,
            "Image": "sha256:fbef17698ac8605733924d5662f0cbfc0b27a51e83ab7d7a4b8d8a9a9fe0d1c2",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": null,
            "OnBuild": null,
            "Labels": {}
        },
        "DockerVersion": "17.06.2-ce",
        "Author": "",
        "Config": {
            "Hostname": "",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
            ],
            "Cmd": [
                "/bin/sh"
            ],
            "ArgsEscaped": true,
            "Image": "sha256:fbef17698ac8605733924d5662f0cbfc0b27a51e83ab7d7a4b8d8a9a9fe0d1c2",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": null,
            "OnBuild": null,
            "Labels": null
        },
        "Architecture": "amd64",
        "Os": "linux",
        "Size": 4147781,
        "VirtualSize": 4147781,
        "GraphDriver": {
            "Data": {
                "MergedDir": "/var/lib/docker/overlay2/a89127b97e590db248eb9f17ece06c99551bd15684b48f6447ded2d87966c83f/merged",
                "UpperDir": "/var/lib/docker/overlay2/a89127b97e590db248eb9f17ece06c99551bd15684b48f6447ded2d87966c83f/diff",
                "WorkDir": "/var/lib/docker/overlay2/a89127b97e590db248eb9f17ece06c99551bd15684b48f6447ded2d87966c83f/work"
            },
            "Name": "overlay2"
        },
        "RootFS": {
            "Type": "layers",
            "Layers": [
                "sha256:cd7100a72410606589a54b932cabd804a17f9ae5b42a1882bd56d263e02b6215"
            ]
        },
        "Metadata": {
            "LastTagTime": "0001-01-01T00:00:00Z"
        }
    }
]
[root@web01 ~]# 


Tag your local "alpine" image with name "myimage" along with version 1.0 :-

[root@web01 ~]# docker tag 3fd9065eaf02 kavitnarwal/java:myname
[root@web01 ~]# docker tag 3fd9065eaf02 kavitnarwal/java:1.0
[root@web01 ~]# 
[root@web01 ~]# 
[root@web01 ~]# docker images 
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
kavitnarwal/java    test1               8a912ef63f8b        5 hours ago         209MB
test1               latest              8a912ef63f8b        5 hours ago         209MB
ubuntu              latest              f975c5035748        3 weeks ago         112MB
kavitnarwal/java    1.0                 3fd9065eaf02        2 months ago        4.15MB
kavitnarwal/java    myname              3fd9065eaf02        2 months ago        4.15MB
alpine              latest              3fd9065eaf02        2 months ago        4.15MB
alpine              3.6                 77144d8c6bdc        2 months ago        3.97MB
hello-world         latest              f2a91732366c        4 months ago        1.85kB
[root@web01 ~]# 
[root@web01 ~]# 






















