Assignment 1

Create a file named index.js with below content.

index.js

var os = require("os"); var hostname = os.hostname(); console.log("hello from " + hostname);

Create a file named Dockerfile and write code as per the steps mentioned.

Use alpine image.

Add Author/Maintainer name in DockerFile

run commands -> apk update & apk add nodejs

copy current directory to /app

change your working directory to /app

specify the default command to be run upon container creation as mentioned below. node index.js

Build image from Dockerfile.

Tag image with name "hello:v0.1"

[root@web01 ~]#

[root@web01 ~]# docker build -t "hello:v0.1" .

Sending build context to Docker daemon 59.57MB

Step 1/7 : FROM alpine

---> 3fd9065eaf02

Step 2/7 : MAINTAINER vishwas

---> Using cache

---> 9af72264ce39

Step 3/7 : RUN apk update

---> Running in b8d33d5bde45

fetch http://dl-cdn.alpinelinux.org/alpine/v3.7/main/x86\_64/APKINDEX.tar.gz

fetch http://dl-cdn.alpinelinux.org/alpine/v3.7/community/x86\_64/APKINDEX.tar.gz

v3.7.0-142-gd44bbad626 [http://dl-cdn.alpinelinux.org/alpine/v3.7/main]

v3.7.0-143-g92b326003a [http://dl-cdn.alpinelinux.org/alpine/v3.7/community]

OK: 9051 distinct packages available

Removing intermediate container b8d33d5bde45

---> abb5710022dd

Step 4/7 : RUN apk add nodejs

---> Running in f088920e270b

(1/10) Installing ca-certificates (20171114-r0)

(2/10) Installing nodejs-npm (8.9.3-r1)

(3/10) Installing c-ares (1.13.0-r0)

(4/10) Installing libcrypto1.0 (1.0.2o-r0)

(5/10) Installing libgcc (6.4.0-r5)

(6/10) Installing http-parser (2.7.1-r1)

(7/10) Installing libssl1.0 (1.0.2o-r0)

(8/10) Installing libstdc++ (6.4.0-r5)

(9/10) Installing libuv (1.17.0-r0)

(10/10) Installing nodejs (8.9.3-r1)

Executing busybox-1.27.2-r7.trigger

Executing ca-certificates-20171114-r0.trigger

OK: 61 MiB in 21 packages

Removing intermediate container f088920e270b

---> 7c8c8fa34038

Step 5/7 : COPY index.js /app/

---> 797b23315fa8

Step 6/7 : WORKDIR "/app"

Removing intermediate container f8b6adb95af9

---> fa5583fe13ca

Step 7/7 : CMD node index.js

---> Running in e047988733ce

Removing intermediate container e047988733ce

---> a92187fde2df

Successfully built a92187fde2df

Successfully tagged hello:v0.1

[root@web01 ~]#

[root@web01 ~]#

[root@web01 ~]# docker images

REPOSITORY TAG IMAGE ID CREATED SIZE

nginx latest c5c4e8fa2cf7 Less than a second ago 109MB

hello v0.1 a92187fde2df 10 seconds ago 50.2MB

vishwasdevops/java test1 8a912ef63f8b 28 hours ago 209MB

test1 latest 8a912ef63f8b 28 hours ago 209MB

wordpress latest 53046cdd8f97 11 days ago 408MB

ubuntu latest f975c5035748 3 weeks ago 112MB

vishwasdevops/java 1.0 3fd9065eaf02 2 months ago 4.15MB

vishwasdevops/java myname 3fd9065eaf02 2 months ago 4.15MB

alpine latest 3fd9065eaf02 2 months ago 4.15MB

alpine 3.6 77144d8c6bdc 2 months ago 3.97MB

hello-world latest f2a91732366c 4 months ago 1.85kB

training/webapp latest 6fae60ef3446 2 years ago 349MB

training/postgres latest 6fa973bb3c26 3 years ago 365MB

[root@web01 ~]#

[root@web01 ~]# vim Dockerfile

[root@web01 ~]#

[root@web01 ~]#

[root@web01 ~]#

[root@web01 ~]# cat Dockerfile

FROM alpine

MAINTAINER kavit

RUN apk update

RUN apk add nodejs

COPY index.js /app/

WORKDIR "/app"

CMD node index.js

[root@web01 ~]#

[root@web01 ~]# docker exec -it 8fdb7c707a8a /bin/sh

/app #

/app #

/app #

/app #

/app # node index.js

hello from 8fdb7c707a8a

/app #

/app #

/app # read escape sequence

[root@web01 ~]#

Assignment 2

Create a DockerFile.

Use Ubuntu latest image.

Add your name as a Manintainer.

Update local packages using command (apt-get update).

Install nodejs package.

Install npm package.

Create a symlink using command (ln -s /usr/bin/nodejs /usr/bin/node).

Trigger a command (npm install -g http-server)

Add any test index.html file from local at /usr/apps/hello-docker/index.html on container.

change your working directory to /usr/apps/hello-docker/.

Run a command (http-server -s) on every container initialization.

Build your dockerfile and tag it with "yourname:docker-web"

Run a docker container from the image that you have just created and map container 8080 port to host 8080 port.(8080:8080)

Try accessing your webpage using "http://<virtualmachine_ipaddress>:8080/index.html" URL.

Delete docker container and image from local.

[root@web01 ~]# cat Dockerfile

FROM ubuntu

MAINTAINER kavit

RUN apt-get update -y

RUN apt-get install nodejs -y

RUN apt-get install npm -y

COPY index.html /usr/apps/hello-docker/index.html

WORKDIR "/usr/apps/hello-docker/"

CMD ln -s /usr/bin/nodejs /usr/bin/node

CMD npm install -g http-server

[root@web01 ~]#

[root@web01 ~]# docker images

REPOSITORY TAG IMAGE ID CREATED SIZE

nginx latest c5c4e8fa2cf7 Less than a second ago 109MB

vishwasdevops docker-web 7ef2585618c6 39 seconds ago 439MB

hello v0.1 a92187fde2df 21 minutes ago 50.2MB

<none> <none> def6ba621a2c 25 minutes ago 50.2MB

vishwasdevops/java test1 8a912ef63f8b 28 hours ago 209MB

test1 latest 8a912ef63f8b 28 hours ago 209MB

wordpress latest 53046cdd8f97 11 days ago 408MB

ubuntu latest f975c5035748 3 weeks ago 112MB

vishwasdevops/java 1.0 3fd9065eaf02 2 months ago 4.15MB

vishwasdevops/java myname 3fd9065eaf02 2 months ago 4.15MB

alpine latest 3fd9065eaf02 2 months ago 4.15MB

alpine 3.6 77144d8c6bdc 2 months ago 3.97MB

hello-world latest f2a91732366c 4 months ago 1.85kB

training/webapp latest 6fae60ef3446 2 years ago 349MB

training/postgres latest 6fa973bb3c26 3 years ago 365MB

[root@web01 ~]#

[root@web01 ~]# docker run -d -it --name vishwas-nodejs -p 8080:8080 7ef2585618c6 http-server -s

8d472e3296f2af69fd7732aff4032962f4eb463410ac6893d0d7af717ba9a04c

[root@web01 ~]#