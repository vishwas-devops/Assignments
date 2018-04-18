1) Afetr moving /etc/sudoers file with /etc/sudoers.bkp 

   We noticed that while performing the sudo commands we are getting below error even we are not able to su to root.

   sudo: unable to stat /etc/sudoers: No such file or directory
   sudo: no valid sudoers sources found, quitting
   sudo: unable to initialize policy plugin

Now detach this vlume from the instance and attach it to othetr instance which is working fine

and mount it somewhere by below method.

[ec2-user@ip-172-31-34-125 ~]$ sudo fdisk -l
WARNING: fdisk GPT support is currently new, and therefore in an experimental phase. Use at your own discretion.

Disk /dev/xvda: 8589 MB, 8589934592 bytes, 16777216 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk label type: gpt


#         Start          End    Size  Type            Name
 1         4096     16777182      8G  Linux filesyste Linux
128         2048         4095      1M  BIOS boot parti BIOS Boot Partition
WARNING: fdisk GPT support is currently new, and therefore in an experimental phase. Use at your own discretion.

Disk /dev/xvdf: 8589 MB, 8589934592 bytes, 16777216 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk label type: gpt


#         Start          End    Size  Type            Name
 1         4096     16777182      8G  Linux filesyste Linux
128         2048         4095      1M  BIOS boot parti BIOS Boot Partition
[ec2-user@ip-172-31-34-125 ~]$


[ec2-user@ip-172-31-34-125 ~]$ lsblk
NAME    MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
xvda    202:0    0   8G  0 disk
+-xvda1 202:1    0   8G  0 part /
xvdf    202:80   0   8G  0 disk
+-xvdf1 202:81   0   8G  0 part
[ec2-user@ip-172-31-34-125 ~]$ mkfs.ext4 /dev/xvdf1
mke2fs 1.42.12 (29-Aug-2014)
Could not open /dev/xvdf1: Permission denied
[ec2-user@ip-172-31-34-125 ~]$ sudo mkfs.ext4 /dev/xvdf1
mke2fs 1.42.12 (29-Aug-2014)
/dev/xvdf1 contains a ext4 file system labelled '/'
        last mounted on / on Wed Mar 21 09:51:13 2018
Proceed anyway? (y,n) y
Creating filesystem with 2096635 4k blocks and 524288 inodes
Filesystem UUID: 0a27e387-16fe-4eaf-afb0-38c96c07ca56
Superblock backups stored on blocks:
        32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632

Allocating group tables: done
Writing inode tables: done
Creating journal (32768 blocks): done
Writing superblocks and filesystem accounting information: done

[ec2-user@ip-172-31-34-125 ~]$ mkdir /myvolume
mkdir: cannot create directory ‘/myvolume’: Permission denied
[ec2-user@ip-172-31-34-125 ~]$ sudo mkdir /myvolume
[ec2-user@ip-172-31-34-125 ~]$ mount /dev/xvdf1 /myvolume
mount: only root can do that
[ec2-user@ip-172-31-34-125 ~]$ sudo mount /dev/xvdf1 /myvolume
[ec2-user@ip-172-31-34-125 ~]$ df -h
Filesystem      Size  Used Avail Use% Mounted on
devtmpfs        488M   64K  488M   1% /dev
tmpfs           497M     0  497M   0% /dev/shm
/dev/xvda1      7.8G  1.1G  6.7G  14% /
/dev/xvdf1      7.8G   18M  7.4G   1% /myvolume


Now change the sudoers file from /etc/sudoers.bkp to /etc/sudoers

Again detach the volume from this instance and attach it to original one now you can verify everything is working fine


To mount partition automatically 

vi /etc/fstab

and put one line i.e. 

/dev/xvdf1 /myvolume ext4 defaults,nofail 0


-----------------------------------------------------------------------------------------------------------------

First of create a ec2 instance. 

Mention public ip of ec2 instance in hosts file of ansible.

Now open below mention file in ec2 instance. 

vim /etc/ssh/sshd_config

uncomment PermitRootLogin yes

Now create a role for nginx installation.

Run nginx role from ansible control machine. 

It will install nginx on ec2 instance. 


Execute this role in user data script while launching another instance :-

Run below mention commands on user data script.

yum install nginx

echo "Hi i am ninja and my name is vishwas" > /usr/share/nginx/html/index.html

write a jobDsl to start stop this instance through jenkins :-

Run below mention command for start and stop ec2 instance.

First of all create a user on aws.

Give ec2 full access to user.

Run aws configure command on server.

aws ec2 stop-instances --instance-ids i-0db40c3e20e6c2293

aws ec2 start-instances --instance-ids i-0db40c3e20e6c2293

---------------------------------------------------------------------------------------------------------

DSL job for same is following.

For stop instance. 

freeStyleJob('AWS_instance_stop') {
    steps {
  shell {
command('''\
#!/bin/bash
aws ec2 stop-instances --instance-ids i-0f380075e1f06fc41
'''.stripIndent()) 
}
  }
}

For start instance. 

freeStyleJob('AWS_instance_start') {
    steps {
  shell {
command('''\
#!/bin/bash
aws ec2 start-instances --instance-ids i-0f380075e1f06fc41
'''.stripIndent()) 
}
  }
}
