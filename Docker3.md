Pull nginx image from dockerhub. :-

[root@web01 ~]# docker pull nginx

Using default tag: latest

latest: Pulling from library/nginx

2a72cbf407d6: Pull complete

e19f9e910af9: Pull complete

2f3d26a87e79: Pull complete

Digest: sha256:d0468eaec1ef818af05f85ac00e484fd5a2ae75dd567dc9f7ccf5f68a60351fb

Status: Downloaded newer image for nginx:latest

[root@web01 ~]#

[root@web01 ~]# docker images

REPOSITORY TAG IMAGE ID CREATED SIZE

nginx latest c5c4e8fa2cf7 Less than a second ago 109MB

kavitnarwal/java test1 8a912ef63f8b 15 hours ago 209MB

test1 latest 8a912ef63f8b 15 hours ago 209MB

ubuntu latest f975c5035748 3 weeks ago 112MB

kavitnarwal/java 1.0 3fd9065eaf02 2 months ago 4.15MB

kavitnarwal/java myname 3fd9065eaf02 2 months ago 4.15MB

alpine latest 3fd9065eaf02 2 months ago 4.15MB

alpine 3.6 77144d8c6bdc 2 months ago 3.97MB

hello-world latest f2a91732366c 4 months ago 1.85kB

[root@web01 ~]#

Run a container from nginx image and map container port 80 to system port 80. :-

[root@web01 ~]# docker run -d -it -p 80:80 nginx

e235fac2e8bf10c9a9d6dca96f1afc88885e502986912ab6fdbe98312296738e

docker: Error response from daemon: driver failed programming external connectivity on endpoint blissful_chaplygin (a4283f6094d571222e2ae57ffc3f9322ccefa06105fe6eb2916e752a91df3fb0): Error starting userland proxy: listen tcp 0.0.0.0:80: bind: address already in use.

[root@web01 ~]#

[root@web01 ~]#

[root@web01 ~]#

[root@web01 ~]#

[root@web01 ~]#

[root@web01 ~]# docker run -d -it -p 90:80 nginx

56ce13c0517fa69917d9be917425239cf02034123e85242e9a7e0c8d353fa19c

[root@web01 ~]#

[root@web01 ~]#

Display all mapped ports on nginx image. :-

[root@web01 ~]# docker ps

CONTAINER ID IMAGE COMMAND CREATED STATUS PORTS NAMES

56ce13c0517f nginx "nginx -g 'daemon of…" About a minute ago Up About a minute 0.0.0.0:90->80/tcp reverent_lichterman

886696533f0d 3fd9065eaf02 "/bin/sh" 11 hours ago Up 10 hours dazzling_sinoussi

ee4eaffff0ba 3fd9065eaf02 "/bin/sh" 11 hours ago Up 11 hours elegant_panini

d2a64e1df3fd ubuntu "/bin/bash" 16 hours ago Up 11 hours gracious_booth

7f9669c199a3 ubuntu "/bin/bash" 16 hours ago Up 16 hours sharp_newton

d434613852ef ubuntu "/bin/bash" 18 hours ago Up 18 hours kavit1

[root@web01 ~]#

[root@web01 ~]#

Run a docker container named "containexpose" from nginx image and expose port 80 of container to outer world without mapping it to any of system port. :-

[root@web01 ~]# docker run -d -it --expose=80 --name containexpose c5c4e8fa2cf7

b2a32b734bc3813e2f369bc8c230247d9de951e63986facef1ff95ebc7f911c9

[root@web01 ~]#

[root@web01 ~]#

Create docker volume named "dbvol" :-

[root@web01 ~]#

[root@web01 ~]# docker volume create dbvol

dbvol

[root@web01 ~]#

[root@web01 ~]#

Run docker container from wordpress image and mount "dbvol" to /var/lib/mysql :-

[root@web01 ~]# docker pull wordpress

Using default tag: latest

latest: Pulling from library/wordpress

2a72cbf407d6: Already exists

273cd543cb15: Pull complete

ec5ac8875de7: Pull complete

9106e19b56c1: Pull complete

ee2f70ac7c7d: Pull complete

7257ad6985e8: Pull complete

18f5c2055da2: Pull complete

85293a6fdd80: Pull complete

9e797eeb0c14: Pull complete

09b55b88e646: Pull complete

2cd18314711e: Pull complete

88b610931a5f: Pull complete

b90052b881e9: Pull complete

36317e1f49af: Pull complete

6dbef1d5801a: Pull complete

f98e14d31e08: Pull complete

dbc1b2b39588: Pull complete

280991283b71: Pull complete

5c4360fbc4f6: Pull complete

0623bccc9390: Pull complete

Digest: sha256:f331400d93624662b6fba461023b0f6a239fcd784d5a04333cead2a15c7cc160

Status: Downloaded newer image for wordpress:latest

[root@web01 ~]#

[root@web01 ~]#

[root@web01 ~]#

[root@web01 ~]#

[root@web01 ~]# docker images

REPOSITORY TAG IMAGE ID CREATED SIZE

nginx latest c5c4e8fa2cf7 Less than a second ago 109MB

kavitnarwal/java test1 8a912ef63f8b 16 hours ago 209MB

test1 latest 8a912ef63f8b 16 hours ago 209MB

wordpress latest 53046cdd8f97 11 days ago 408MB

ubuntu latest f975c5035748 3 weeks ago 112MB

kavitnarwal/java 1.0 3fd9065eaf02 2 months ago 4.15MB

kavitnarwal/java myname 3fd9065eaf02 2 months ago 4.15MB

alpine latest 3fd9065eaf02 2 months ago 4.15MB

alpine 3.6 77144d8c6bdc 2 months ago 3.97MB

hello-world latest f2a91732366c 4 months ago 1.85kB

[root@web01 ~]#

[root@web01 ~]#

[root@web01 ~]#

[root@web01 ~]# docker run -d -it -v /var/lib/docker/volumes/dbvol:/var/lib/mysql 53046cdd8f97 /bin/bash

68e555e90437902639de22d277fbde079fb1855460c5049be366ccd17b5f3bfc

[root@web01 ~]#

[root@web01 ~]# docker exec -it 68e555e90437 /bin/bash

root@68e555e90437:/var/www/html#

root@68e555e90437:~# cd /var/lib/

root@68e555e90437:/var/lib# ls mysql/

_data

root@68e555e90437:/var/lib#

root@68e555e90437:/var/lib# cd mysql/

root@68e555e90437:/var/lib/mysql# ll

bash: ll: command not found

root@68e555e90437:/var/lib/mysql# ls

_data

root@68e555e90437:/var/lib/mysql#

root@68e555e90437:/var/lib/mysql#

root@68e555e90437:/var/lib/mysql# cd _data/

root@68e555e90437:/var/lib/mysql/_data# ls

root@68e555e90437:/var/lib/mysql/_data#

root@68e555e90437:/var/lib/mysql/_data#

root@68e555e90437:/var/lib/mysql/_data# cd ..

root@68e555e90437:/var/lib/mysql# ls

_data

root@68e555e90437:/var/lib/mysql#

root@68e555e90437:/var/lib/mysql#

root@68e555e90437:/var/lib/mysql# cd _data/

root@68e555e90437:/var/lib/mysql/_data# touch test

root@68e555e90437:/var/lib/mysql/_data#

root@68e555e90437:/var/lib/mysql/_data# touch test2

root@68e555e90437:/var/lib/mysql/_data#

root@68e555e90437:/var/lib/mysql/_data#

root@68e555e90437:/var/lib/mysql/_data# ls

test test2

root@68e555e90437:/var/lib/mysql/_data#

[root@web01 ~]# cd /var/lib/docker/volumes/dbvol

[root@web01 dbvol]# ll

total 0

drwxr-xr-x. 2 root root 31 Apr 3 04:37 _data

[root@web01 dbvol]#

[root@web01 dbvol]# cd _data/

[root@web01 _data]# ll

total 0

-rw-r--r--. 1 root root 0 Apr 3 04:37 test

-rw-r--r--. 1 root root 0 Apr 3 04:37 test2

[root@web01 _data]#

Display all docker volumes. :-

[root@web01 ~]# docker volume ls

DRIVER VOLUME NAME

local 0c1e93cbd62e2e39ab79e63264d1a5269b6196061b3e44a47aaeaf9f7c9b7499

local dbvol

local e01d84e8cd6849fefe3f38c619d9e6f77d28269eb4fd8b2a842495c72b80b338

[root@web01 ~]#

[root@web01 ~]#

Create another docker volume named "testvol" :-

[root@web01 ~]#

[root@web01 ~]# docker volume create testvol

testvol

[root@web01 ~]#

[root@web01 ~]#

[root@web01 ~]# docker volume ls

DRIVER VOLUME NAME

local 0c1e93cbd62e2e39ab79e63264d1a5269b6196061b3e44a47aaeaf9f7c9b7499

local dbvol

local e01d84e8cd6849fefe3f38c619d9e6f77d28269eb4fd8b2a842495c72b80b338

local testvol

[root@web01 ~]#

[root@web01 ~]#

[root@web01 ~]#

Remove docker volume "testvol" :-

[root@web01 ~]#

[root@web01 ~]# docker volume rm testvol

testvol

[root@web01 ~]#

[root@web01 ~]# docker volume ls

DRIVER VOLUME NAME

local 0c1e93cbd62e2e39ab79e63264d1a5269b6196061b3e44a47aaeaf9f7c9b7499

local dbvol

local e01d84e8cd6849fefe3f38c619d9e6f77d28269eb4fd8b2a842495c72b80b338

[root@web01 ~]#

Run a container in detached mode with name "db" from image "training/postgres" :-

[root@web01 ~]# docker run -d --name db training/postgres

595942f2cfa95dbbca034a289ad0e1e20c4c1672095a089c26122b565ec51e29

[root@web01 ~]#

[root@web01 ~]#

[root@web01 ~]# docker ps

CONTAINER ID IMAGE COMMAND CREATED STATUS PORTS NAMES

595942f2cfa9 training/postgres "su postgres -c '/us…" 13 seconds ago Up 7 seconds 5432/tcp db

68e555e90437 53046cdd8f97 "docker-entrypoint.s…" About an hour ago Up About an hour 80/tcp frosty_galileo

e883603277fa 53046cdd8f97 "docker-entrypoint.s…" About an hour ago Up About an hour 80/tcp unruffled_mcclintock

b2a32b734bc3 c5c4e8fa2cf7 "nginx -g 'daemon of…" 2 hours ago Up 2 hours 80/tcp containexpose

56ce13c0517f nginx "nginx -g 'daemon of…" 2 hours ago Up 2 hours 0.0.0.0:90->80/tcp reverent_lichterman

886696533f0d 3fd9065eaf02 "/bin/sh" 13 hours ago Up 13 hours dazzling_sinoussi

ee4eaffff0ba 3fd9065eaf02 "/bin/sh" 13 hours ago Up 13 hours elegant_panini

d2a64e1df3fd ubuntu "/bin/bash" 18 hours ago Up 13 hours gracious_booth

7f9669c199a3 ubuntu "/bin/bash" 18 hours ago Up 18 hours sharp_newton

d434613852ef ubuntu "/bin/bash" 20 hours ago Up 20 hours kavit1

[root@web01 ~]#

[root@web01 ~]#

Run another container in detached mode with name "web" from image "training/webapp", link container "db" with alias "mydb" to this container and finally pass an inline command "python app.py" while running container. :-

[root@web01 ~]# docker run -d -P --name web --link db:mydb training/webapp python app.py

6590f323053443345260254515b9e1c8e5ab310de74d73bd2089420b8b6b8a47

[root@web01 ~]#

[root@web01 ~]#

[root@web01 ~]# docker ps

CONTAINER ID IMAGE COMMAND CREATED STATUS PORTS NAMES

6590f3230534 training/webapp "python app.py" 7 seconds ago Up 3 seconds 0.0.0.0:32768->5000/tcp web

595942f2cfa9 training/postgres "su postgres -c '/us…" 59 seconds ago Up 53 seconds 5432/tcp db

68e555e90437 53046cdd8f97 "docker-entrypoint.s…" About an hour ago Up About an hour 80/tcp frosty_galileo

e883603277fa 53046cdd8f97 "docker-entrypoint.s…" About an hour ago Up About an hour 80/tcp unruffled_mcclintock

b2a32b734bc3 c5c4e8fa2cf7 "nginx -g 'daemon of…" 2 hours ago Up 2 hours 80/tcp containexpose

56ce13c0517f nginx "nginx -g 'daemon of…" 2 hours ago Up 2 hours 0.0.0.0:90->80/tcp reverent_lichterman

886696533f0d 3fd9065eaf02 "/bin/sh" 13 hours ago Up 13 hours dazzling_sinoussi

ee4eaffff0ba 3fd9065eaf02 "/bin/sh" 13 hours ago Up 13 hours elegant_panini

d2a64e1df3fd ubuntu "/bin/bash" 18 hours ago Up 13 hours gracious_booth

7f9669c199a3 ubuntu "/bin/bash" 18 hours ago Up 18 hours sharp_newton

d434613852ef ubuntu "/bin/bash" 20 hours ago Up 20 hours kavit1

[root@web01 ~]#

Take a bash terminal in "web" container. :-

[root@web01 ~]# docker exec -it 6590f3230534 /bin/bash

root@6590f3230534:/opt/webapp#

root@6590f3230534:/opt/webapp#

root@6590f3230534:/opt/webapp#

Test container linking by doing a ping to "mydb" :-

root@6590f3230534:/opt/webapp#

root@6590f3230534:/opt/webapp# ping mydb

PING mydb (172.17.0.11) 56(84) bytes of data.

64 bytes from mydb (172.17.0.11): icmp_seq=1 ttl=64 time=0.144 ms

64 bytes from mydb (172.17.0.11): icmp_seq=2 ttl=64 time=0.202 ms

64 bytes from mydb (172.17.0.11): icmp_seq=3 ttl=64 time=0.197 ms

^C

--- mydb ping statistics ---

3 packets transmitted, 3 received, 0% packet loss, time 1998ms

rtt min/avg/max/mdev = 0.144/0.181/0.202/0.026 ms

root@6590f3230534:/opt/webapp#

root@6590f3230534:/opt/webapp# ping db

PING mydb (172.17.0.11) 56(84) bytes of data.

64 bytes from mydb (172.17.0.11): icmp_seq=1 ttl=64 time=0.201 ms

64 bytes from mydb (172.17.0.11): icmp_seq=2 ttl=64 time=0.233 ms

^C

--- mydb ping statistics ---

2 packets transmitted, 2 received, 0% packet loss, time 999ms

rtt min/avg/max/mdev = 0.201/0.217/0.233/0.016 ms

root@6590f3230534:/opt/webapp#