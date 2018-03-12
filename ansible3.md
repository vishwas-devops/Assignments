Ad-Hoc commands for Assignment 3
-----------------------------------------------------------------

ansible all -m file -a " state=directory path=/tmp/ninja
ansible <node name> -a " hostnamectl set-hostname ninja "
ansible <HOST_GROUP> -m setup -a "filter=ansible_distribution*"
ansible web -m yum " name=httpd state=version "
ansible web -m service " name=httpd state=restarted "
ansible 192.168.33.11  -a "service apache2 status"
ansible all -m service -a " name=apache2 state=restarted "
Virtual hosting >>> https://www.digitalocean.com/community/tutorials/how-to-set-up-apache-virtual-hosts-on-ubuntu-16-04
ansible ubuntu -m lineinfile -a "dest=/etc/apache2/ports.conf regexp='^#Listen 80' replace='Listen 8082'"
ansible app -m service " name=apache2 state=restarted "
ansible ubuntu -m lineinfile -a "dest=/etc/nginx/nginx.conf regexp='listen 80 default_server' line='listen 8080 default_server'
ansible ubuntu -m copy -a "src=/etc/ansible/reverse_proxy.conf dest=/etc/nginx/"






