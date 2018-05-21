All needs to be done using ansible modules with jenkins There will be three jenkins jobs, Provisioning, Build, Deployment.

Provisioning:-

Provision application servers, for example - java, tomcat are required for a java project.

This job will be a separate job and can be executed to any machine on requirement.

First of all create playbooks for java and tomcat installation.

- hosts: app
 
  sudo: yes

  tasks:

   - name: install tomcat on centos

     yum:

     name: tomcat

     state: present

     when: ansible_os_family == "RedHat"

   - name: install tomcat on Ubuntu

     apt:
   
     name: tomcat

     state: present

     when: ansible_os_family == "Debian"

   - name: start tomcat

     service:

     name: tomcat

     state: started

- hosts: all

  sudo: yes

  tasks:

   - name: install java on centos

     yum:

     name: java

     state: present

     when: ansible_os_family == "RedHat"

   - name: install java on Ubuntu

     apt:

     name: java

     state: present

     when: ansible_os_family == "Debian"

>>> After that create a new job in jenkins
>>> Select Build and invoke ansible playbook

>>> Give path of playbooks you want to run.

>>> Build and Deployment Job will be in downstream relationship.

Build:-
-------------
Build any Project - can be java or any other language using jenkins. :-

create a new item. clone code from github. run mvn compile.

Deployment:-

Create a down stream deployment job to the build job .

In the deployment job , deploy the artifact (war in case of java) to the application server (tomcat/joboss)

using ansible in the downstream job. :-

Ansible play book will include health check also, (status code == 200) , if health check fails, job should also fail. :-

create a new ansible playbook :-

 - hosts: all

   sudo: yes
 
   tasks:

    - copy: src={{ item.src }} dest={{ item.dest }}

      with_items:

        - { src: '/etc/ansible/sample.war', dest: '/var/lib/tomcat/webapps/' }
    - name: restart tomcat

      service:

      name: tomcat

      state: restarted

    - name: health-check

      uri:

      get_url: "{{ item.name }}"

      with_items:

       - { name: 'http://192.168.33.11:8080&#39; }

       - { name: 'http://192.168.33.12:8080&#39; }

      status_code: 200