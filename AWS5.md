First we need to inmstall boto which is a official AWS SDK for Python, It supports all AWS cloud services.
Boto In Detail >>>> http://searchaws.techtarget.com/definition/Boto
               >>>> https://cloudacademy.com/blog/boto-python-automate-aws-services/
               >>>> http://boto.cloudhackers.com/en/latest/


create a key pair using ansible :-


First of all install boto by using below mention command.


pip2.7 install boto


pip2.7 install boto3


root@197NODNB:/etc/ansible# cat aws_new_key_pair.yml 

- hosts: 127.0.0.1

  sudo: yes

  tasks:

  - name: example ec2 key

    ec2_key:

      name: example 

      state: present 

      region: us-east-1 

root@197NODNB:/etc/ansible# 


create one security group that would allow you to ssh into the instance :-



root@197NODNB:/etc/ansible# cat aws_new_SG.yml 

- hosts: 127.0.0.1

  sudo: yes

  tasks:

  - name: Create new SG

    ec2_group:

       name: example

       description: an example EC2 group

       vpc_id: vpc-dfb323a7

       region: us-east-1

       state: present

#  - name: Create a new key pair

#    shell: |

#      aws ec2 create-security-group --group-name linux2_SG --description "My security group"

      

root@197NODNB:/etc/ansible#


root@197NODNB:/etc/ansible# cat aws_new_SG_allow_ssh.yml 

- hosts: 127.0.0.1

  sudo: yes

  tasks:

  - name: Create SSH security group

    ec2_group:

      name: "example"

      description: an example EC2 group (Use same description which we use in SG creation.)

      group_id: sg-4a2f723c

      region: us-east-1

      rules:

        - proto: tcp

          ports: 22

          cidr_ip: 0.0.0.0/0


root@197NODNB:/etc/ansible# 



using the key that you created, launch an instance in default vpc of N.virginia region with tags of your choice :-



root@197NODNB:/etc/ansible# cat aws_new_instance.yml

- hosts: 127.0.0.1

  sudo: yes

  tasks:

  - name: Create a new instance

    ec2:

      key_name: linux

      instance_type: t2.micro

      image: ami-1853ac65

      count: 1

      region: us-east-1

      vpc_subnet_id: subnet-d373e298

      assign_public_ip: yes

      group_id: sg-a2bae8d4

      instance_tags:

       Name: linux5

root@197NODNB:/etc/ansible#

