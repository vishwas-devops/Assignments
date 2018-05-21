Create an Ansible playbook to rotate ssh keys. Explaination - Replacing the keys you're currently using with new keys, 
and removing the ability for old keys to be used to log into your systems.

Create a new key :-
----------------------

hosts: 192.168.33.11

sudo: yes

tasks:

name: Generate SSH keys

shell: ssh-keygen -b 2048 -t rsa -f /root/.ssh/id_rsa_root -q -N ""

args:

creates: /root/.ssh/id_rsa_root

Add new key to authorized_keys files on your nodes :-
-----------------------------------------------------------

hosts: 192.168.33.11

sudo: yes

tasks:

name: copy ssh public key

lineinfile:

path: /root/.ssh/authorized_keys

insertafter: EOF

line: 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCpenIPbyI9AV0QrfEDU7GTy4RB4MWlPPh/372AxE2daEbOJp3gBXrnI4EaSp25KjGsvlKJGcFc89O
/Xzin/u8jqaPhGLuSJqUFIPjrbfY68le0otE2GKR76hL92diixHpbgxJ17RrnsFZAC1c1rbzwrpVJILpyIRpNZ0xVrPHrYGvI2vffWex4ZQ1JZjzlbNXHH/nL9Fr2TB3fH5RoyVhMws
fwR6hto+bJKSy7hhP4VIeIjwvir9jSYRj2SPgmOGSkrz/n5Se0SKrHqKYgmPS01WTPGH5HGGT1qMjnzDNEEZ5VxgplfWztKmdWPEQKgYqDfSflei6e3j0pB8uOmZnp root@197NODNB'

backup: yes


hosts: 192.168.33.11

sudo: yes

tasks:

name: copy ssh public key

copy:

src: /root/.ssh/id_rsa_root.pub

dest: /root/.ssh/authorized_keys

follow: true

owner: root

group: root

mode: 0600

backup: yes


Test new key :-
------------------------------------

Add below mention line in hosts file.

192.168.33.11 ansible_ssh_private_key_file=/root/.ssh/id_rsa_root

Now it will ssh by using new ssh key pair.

Remove previous keys from authorized_keys files on your nodes. :-

hosts: 192.168.33.11

sudo: yes

tasks:

name: remove old ssh public key

lineinfile:

path: /root/.ssh/authorized_keys

state: absent

line: 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDVZT6Hy/t9ZvkAiut1X/H5ISb7QVKerCXbDyfEbfcUH5p5rKy3Jv35zNlbPwDXGh+B1ryr/BUeF8w7VGw2
NffAXuTWZlqazupGz5kFF53MHAS2a+mnyDyW9rrjv5hTyUHf3zvNLXRj886akcR+DNST9Oy5QwPirmtel6820AjIVL4mR+PV/bXtKmkVPUZdkHihrKhotWm5XgCLJ3p
jryqmwGzeNjC575cvdMdITHNBTIK9A1iht6STLqU/jRCKh2cExOLEdMcPU9B2a2BkghuVKGOGS7lxO2EFREOpwRi2zmtxpk0PkUSyvAIrs9m7eCzNDRs6rfdeUBV6vyt8kITx root@197NODNB18405'

backup: yes

again test the connectivity with the new keys. :-

First of all we will move /root/.ssh/id_rsa_root into /root/.ssh/id_rsa

Now try to ssh with new ssh key pair.