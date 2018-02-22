Install Nginx apt-get install nginx

Install below plugin by going to Manage Jenkins>>>manage plugin

SSH plugin
Git plugin

-----------------complete-----------------------------------------------------------------
SSH Remote by using jenkin job---

install ssh plugin
in Global secirity enable ssh server fixed (give ssh port)

configure system
in SSH remote Host
give details of Hostname ( destination IP eg - Vagrnat machine)
ssh port of destination machine
add credential of destnation
select kind (SSH username with private key)
destination user name (root )
give private key of source server
and add
check connection
save and apply
create an Item 
In Build Env select execute shell scrit on remote host using SSH
In Build select execute shell scrit on remote host using SSH and give SSH site (destination)
Build the job
------------------------complete-------------------------------------------------------------

GIT Tag with parameters---

create and item
select project is parameterised
select the string parameter
1--Give parameter name (tag name)
2--Give parameter name (branch name)

In SCM select GIT
give remote repo URL
In build execute shell script
#!/bin/bash


git checkout $Branch_Name


git tag $Tag_Name

execute job ( Build with parameter)
give Tag name  and branch name

Build

--------------complete-----------------------------------------------------------------------------

crete an Intem
In SCM select the GIT and enter the Repo url

In Build execute shell with below commands

git remote add origin https://github.com/ot-training/jenkins.git

git remote add jenkin https://github.com/ot-training/jenkins.git

git remote add jenkin1 https://github.com/ot-training/jenkins.git

git remote add jenkin2 https://github.com/ot-training/jenkins.git

execute Job

Install plugin Deploy to container

create a deploy job
Select project with parameter with string
Tag_Name and add
In Build Env select execute shell scrit on remote host using SSH
In Build select execute shell scrit on remote host using SSH and give SSH site (destination)
Command :-

git clone https://github.com/ot-training/jenkins.git

cd jenkins/attendees/assignments/day7/

cp index.html /usr/local/nginx-1.13.8/html/

echo "Hello Ninjas!! This is Kavit" > index.html

git add index.html

git commit -m "Updated index.html"

git tag $Tag_Name

Execute the Job

------------------complete-------------------------------------------------------------

shared workspace plugin for common workspace

give same URL in SCM tab which we gave in the code stability job so that we can use same worksapce

Create Job

select the workspace as shared

give same URL in SCM tab which we gave in the code stability job so that we can use same worksapce

Select project with parameter with string
Tag_Name and add
In Build Env select execute shell scrit on remote host using SSH
In Build select execute shell scrit on remote host using SSH and give SSH site (destination)
Command :-

git clone https://github.com/ot-training/jenkins.git

cd jenkins/attendees/assignments/day7/

cp index.html /usr/local/nginx-1.13.8/html/

echo "Hello Ninjas!! This is Kavit" > index.html

git add index.html

git commit -m "Updated index.html"

git tag $Tag_Name
scp /root/.jenkins/workspace/code_coverage_Job/Spring3HibernateApp/target/Spring3HibernateApp.war root@192.168.33.10:/usr/local/apache-tomcat-8.5.27/webapps/

Execute the Job

-------------------complete--------------------------------------------------------------------

Install NodeJS
wget http://nodejs.org/dist/v0.10.30/node-v0.10.30.tar.gz
tar xzvf node-v* && cd node-v*
sudo yum install gcc gcc-c++

./configure

make
sudo make install


git clone https://github.com/kavitnarwal/node-js-sample.git
 
cd node-js-sample/ ( goto location where NOdejs reside and start NPM -/usr/local/node-0.10.30/bin/npm start
Install pm2 /usr/local/node-0.10.30/bin/npm install pm2 -g ( To start/stop node js)
/usr/local/node-0.10.30/bin/pm2 start index.js - Here we are starting the index.js

make the tar file (tar -cvf node-js-sample.tar node-js-sample)




---------------------------complete-------------------------------------------------

v