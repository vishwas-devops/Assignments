Script to stop the instance---------------
------------------------------------------


#!/bin/bash

echo "Please enter instance tag you want to stop."

read instance_tag

echo $instance_tag

if [ "$instance_tag" == "boot-order: 1" ]
then

echo "stop $instance_tag"

aws ec2 stop-instances --instance-ids  i-045c5af85e063b175

aws ec2 stop-instances --instance-ids i-046b0f6ff7625f877

aws ec2 stop-instances --instance-ids i-06a80f39bb50f97c2

fi

if [ "$instance_tag" == "boot-order: 2" ]
then

echo "stop $instance_tag"

aws ec2 stop-instances --instance-ids i-046b0f6ff7625f877

aws ec2 stop-instances --instance-ids i-06a80f39bb50f97c2

aws ec2 stop-instances --instance-ids i-045c5af85e063b175

fi

if [ "$instance_tag" == "boot-order: 3" ]
then

echo "stop $instance_tag"

aws ec2 stop-instances --instance-ids i-06a80f39bb50f97c2

aws ec2 stop-instances --instance-ids i-046b0f6ff7625f877

aws ec2 stop-instances --instance-ids i-045c5af85e063b175

fi


Script to start the instance---------------
------------------------------------------

#!/bin/bash

echo "Please enter instance tag you want to start."

read instance_tag

echo $instance_tag

if [ "$instance_tag" == "boot-order: 1" ]
then

echo "stop $instance_tag"

aws ec2 start-instances --instance-ids  i-045c5af85e063b175

aws ec2 start-instances --instance-ids i-046b0f6ff7625f877

aws ec2 start-instances --instance-ids i-06a80f39bb50f97c2

fi

if [ "$instance_tag" == "boot-order: 2" ]
then

echo "stop $instance_tag"

aws ec2 start-instances --instance-ids i-046b0f6ff7625f877

aws ec2 start-instances --instance-ids i-06a80f39bb50f97c2

aws ec2 start-instances --instance-ids i-045c5af85e063b175

fi

if [ "$instance_tag" == "boot-order: 3" ]
then

echo "stop $instance_tag"

aws ec2 start-instances --instance-ids i-06a80f39bb50f97c2

aws ec2 start-instances --instance-ids i-046b0f6ff7625f877

aws ec2 start-instances --instance-ids i-045c5af85e063b175

fi

---------------------------------------------------------------------------------------------------------------------------------------

now you need to host the website thtrough roles of Nginx

create instance
while creating the instance go to advanced >>> in user data tab put below commands

yum install ansible

cd /etc/ansible/

git clone https://github.com/vishwas-devops/AWS4.git
ansible-playbook nginx_roles.yml

echo "Hi, I am vishwas" > /usr/share/nginx/html/index.html

now while launching it will install ansible and also host the website mentioning "Hi, I am vishwas" 

----------------------------------------------------------------------------------------------------------------------------------------

First of all your friend need to create a user through IAM with Management console access
Now provide EC2 full access to that user 
and give take thet user name from your friend along with Account ID for login
Now you can launch the instance in your friend's account.

---------------------------------------------------------------------------------------------------------------------------------------