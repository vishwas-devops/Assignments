Refrence >>>> https://github.com/ansible/ansible/issues/5241
         >>>> https://supportex.net/blog/2014/10/ansible-add-swap-linux-box/


- hosts: 192.168.33.11
 tasks:
 - name: create the file to be used for swap
   command: dd if=/dev/zero of=/mnt/swapfile count=4096 bs=1MiB
   when: ansible_swaptotal_mb == "0"
 - name: format the file for swap
   command: mkswap /mnt/swapfile
   when: ansible_swaptotal_mb == "0"
 - name: change swap file permissions
   file: path=/mnt/swapfile owner=root group=root mode=0600
   when: ansible_swaptotal_mb == "0"
 - name: add the file to the system as a swap file
   command: swapon /mnt/swapfile
   when: ansible_swaptotal_mb == "0"

 - name: create the file to be used for swap
   command: dd if=/dev/zero of=/mnt/swapfile count=4096 bs=1MiB
   when: ansible_swaptotal_mb != "0"
 - name: format the file for swap
   command: mkswap /mnt/swapfile
   when: ansible_swaptotal_mb != "0"
 - name: change swap file permissions
   file: path=/mnt/swapfile owner=root group=root mode=0600
   when: ansible_swaptotal_mb != "0"
 - name: add the file to the system as a swap file
   command: swapon /mnt/swapfile
   when: ansible_swaptotal_mb != "0"
 - name: make swap space permanent
   mount: src=/mnt/swapfile name=swap fstype=swap state=present opts=defaults passno=0 dump=0
   when: ansible_swaptotal_mb != "0
