Multiple OS patching with ansiblee >>>>>https://www.youtube.com/watch?v=7al0yehXa_g

List all installed modules with
ansible-doc --list

Document a particular module with
ansible-doc <module>

Show playbook snippet for specified module
ansible-doc -i <module>

Run ansible hostname -m setup, but in particular:

•ansible_distribution
•ansible_distribution_release
•ansible_distribution_version
•ansible_fqdn
•ansible_hostname
•ansible_os_family
•ansible_pkg_mgr
•ansible_default_ipv4.address
•ansible_default_ipv6.address

Ping all hosts except the 'control' host using the --limit option---

Limit to one host
ansible-playbook playbooks/PLAYBOOK_NAME.yml --limit "host1"
ansible -m ping "host1,host2"

Limit to multiple hosts
ansible-playbook playbooks/PLAYBOOK_NAME.yml --limit "host1,host2"

Refeerence for Basic commands with module >>> https://www.youtube.com/watch?v=lRwGkO3PtB8----http://docs.ansible.com/ansible/latest/intro_adhoc.html---

Fetch and display only the "virtual" subset of facts for each host---

root@vagrant-ubuntu- trusty-64:~# ansible all -m setup -a "gather_subset=virtual"

ansible all -m setup -- tree /etc/facts | grep hostname

ansible all -a "uptime"

Java installation :-

ansible test -m apt_repository -a "repo=ppa:webupd8team/java state=present"
ansible  test -m debconf -a 'name=oracle-java8-installer question=shared/accepted-oracle-license-v1-1 value=true vt
ype=select'
ansible app -m apt -a "name=oracle-java8-installer state=latest"



---
- hosts: app
  tasks:

  - name: Install java 8 preresequesits
    apt: name=python-software-properties

  - name: Add Java 8 repository
    apt_repository: repo='ppa:webupd8team/java'

  - name: Agree to oracle license
    debconf: name=oracle-java8-installer question=shared/accepted-oracle-license-v1-1 vtype=select value=true

  - name: Install Java 8
    apt: name=oracle-java8-installer force=yes


EPEL ( Extra Packages for Enterprise Linux ) ---- Provides lots of open source packages to install via Yum and it is open source

Refreence for EPEL >>>> https://gist.github.com/mariusv/71e6e75941d495956234    and    https://gist.github.com/mariusv/71e6e75941d495956234


vi /etc/ansible/hosts

[web]
192.168.33.12

[app]
192.168.33.11


--- 
 - hosts: web
   become_user: root 
   tasks: 
 
 
   - name: Install EPEL repo. 
     yum: 
       name: https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
       state: present 
 
   - name: Import EPEL GPG key. 
     rpm_key: 
       key: /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-{{ ansible_distribution_major_version }} 
       state: present 



Cron Job with ansible :-

* * * * * we use 5 star to set the cron job
* * * * * command to be executed
- - - - -
| | | | |
| | | | ----- Day of week (0 - 7) (Sunday=0 or 7)
| | | ------- Month (1 - 12)
| | --------- Day of month (1 - 31)
| ----------- Hour (0 - 23)
------------- Minute (0 - 59)

 For Localhost :-

vi cron_file.sh and put the task there 
( vi /var/log/ninja_vishwas )

crontab -e to edit the cron job and put belo infor there

# cron job for every minute
*****  root /etc/ansible/cronfile.sh >/etc/ansible>vishu

                                   OR ( For Ansible )
We can make a playbook cron.yml to execute this cron job on you remotee host ( in my case 192.168.33.12 )

--- 
 - hosts: web
   become_user: root 
   tasks:

   - name: cron job for every minute
       cron:
          name: cleanup-elasticsearch-indexes
          minute: 0
          hour: 0
          job: /etc/ansible/cron_file.sh
          state: present  
    
                
    







