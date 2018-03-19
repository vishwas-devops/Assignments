How to create VPC through Wizard -----------
--------------------------------------------

Go to VPC service click to create VPC you will get 3 options.
As per assignment select 2nd option ( one public subnet and one private subnet with VPN connection )

It will create Natgateway , routetables also

Now Go to EC2 service and launch two instance one Windows ( in public subnet ) and one Linux ( in private subnet )
In SG you need to open some ports ( ICMPIPV4 , ssh , http , https , RDP )
Use same SG for both the Machines ( optional )

Now you will be able to ping both machine with each other

To login to Linux machine through putty when your base machine is Windows follow below link :-

https://www.youtube.com/watch?v=bi7ow5NGC-U


To login to Linux machine through putty when your base machine is ubuntu and mac user follow below link :-

https://www.youtube.com/watch?v=v0g1M5bb9u4

Now if you want to access you linux machine which is in private subnet you need to fir RDP on windows ( in public subnet ) then from there you can follow below link 
https://www.youtube.com/watch?v=bi7ow5NGC-U

Why we are doing this because if you are able to do SSH on private machine also then why we will make VPC then.

Note* - We are using NAT gateway for private subnet so we need 1 elastic IP for this.
---------------------------------------------------------------------------------------------------------------------------------------------------------------------

Refrence for AWS CLI VPC creation and deletion >>>> https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/vpc-subnets-commands-example.html
                                               >>>> https://www.youtube.com/watch?v=b1lYoSoJ76s

Now delete both the instances and do above things with Amazon CLI

First you need to install AWS cli ( Follow below link )

https://www.youtube.com/watch?v=Pk5x1diFwg8

Now you need to configure AWS by typing 

aws configure

you will get below prompt

C:\>aws configure
AWS Access Key ID [None]:

you need to put your key id then security key then default region 

Now you are in you aws account through AWS CLI

Now you need to launch Machine ( EC2 instance )

First Create Key pair if you do not have otherwise use previous one----
 
aws ec2 create-key-pair --key-name Ninja_Key.pem --query 'KeyMaterial' --output text > Ninja_Key.pem

The create SG if you do not have otherwise use previous one-------

aws ec2 create-security-group --group-name SSHAccess --description "Security group for SSH access" --vpc-id vpc-2f09a348

Lauching Instance in public you should give subnet id with which you attach IGW

aws ec2 run-instances --image-id <ami -id / OS id> --count 1 --instance-type t2.micro --key-name Ninja_Key --security-group-ids sg-e1fb8c9a --subnet-id subnet-b46032ec

Lauching Instance in private you should give subnet id with which you attach NAT GW

aws ec2 run-instances --image-id <ami -id / OS id> --count 1 --instance-type t2.micro --key-name Ninja_Key --security-group-ids sg-e1fb8c9a --subnet-id subnet-b46032ec





