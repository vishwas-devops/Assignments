Search for "centos" image on docker using commandline :-

docker search centos

Apply a filter on search result to show entries for images having 3 stars:-

docker search --stars=3 --no-trunc centos

Limit out search result to 10 entries only:-

docker search --limit 10 --no-trunc centos

Format the search result to get output containing only name,description and is_official values:-

docker search --format "table {{.Name}}\t{{.IsAutomated}}\t{{.IsOfficial}}" centos

Pull an image named "centos" from dockerhub:-

docker pull centos

docker tag 2d194b392dd1 mycentos:version1.1

login to docker acctoun 

docker login:-
username: ***
password: ***



docker tag 2d194b392dd1 vishwasdevops/mycentos:version1

docker push vishwasdevops/mycentos:version1

dockerhub >>> link --- https://hub.docker.com/r/vishwasdevops/mycentos/tags/
