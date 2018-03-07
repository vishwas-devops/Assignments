Install ansible by using pip, apt-get, Yum :-

By Using apt-get---
------------------------------------------
$ sudo apt-get update

$ sudo apt-get install software-properties-common

$ sudo apt-add-repository ppa:ansible/ansible

$ sudo apt-get update

$ sudo apt-get install ansible

By ussing pip---
---------------------------------------------
$ sudo easy_install pip

$ sudo pip install ansible

By using yum/rpm

$ git clone https://github.com/ansible/ansible.git

$ cd ./ansible

$ make rpm

$ sudo rpm -Uvh ./rpm-build/ansible-*.noarch.rpm

Configuration file basics :-
--------------------------------------------------------
ask_pass

This controls whether an Ansible playbook should prompt for a password by default. The default behavior is no:

ask_pass = True

If using SSH keys for authentication, it's probably not needed to change this setting.

ask_sudo_pass

Similar to ask_pass, this controls whether an Ansible playbook should prompt for a sudo password by default when sudoing. The default behavior is also no:

ask_sudo_pass = True

Users on platforms where sudo passwords are enabled should consider changing this setting.

ask_vault_pass

This controls whether an Ansible playbook should prompt for the vault password by default. The default behavior is no:

ask_vault_pass = True

force_handlers

This option causes notified handlers to run on a host even if a failure occurs on that host:

force_handlers = True

The default is False, meaning that handlers will not run if a failure has occurred on a host. This can also be set per play or on the command line. See Handlers and Failure for more details.

forks

This is the default number of parallel processes to spawn when communicating with remote hosts. Since Ansible 1.3, the fork number is automatically limited to the number of possible hosts at runtime, so this is really a limit of how much network and CPU load you think you can handle. Many users may set this to 50, some set it to 500 or more. If you have a large number of hosts, higher values will make actions across all of those hosts complete faster. The default is very very conservative:

forks = 5

fact_caching

This option allows you to configure fact caching. When a fact cache is enabled and there is valid data for a host, Ansible will use that rather than running an implicit setup job on a remote host.

The value of this option should be the name of a cache plugin. Current versions of Ansible include redis and jsonfile:

fact_caching = jsonfile

fact_caching_connection

This option tells Ansible where to cache facts. The value is plugin dependent. For the jsonfile plugin, it should be a path to a local directory. For the redis plugin, the value is a host:port:database triplet:

fact_caching_connection = localhost:6379:0

fact_caching_timeout

This option tells Ansible when to expire values from the cache. Setting this value to 0 effectively disables expiry, and a positive value is a TTL in seconds:

fact_caching_timeout = 86400

fact_path

This option allows you to globally configure a custom path for Local Facts (Facts.d) for the implied setup task when using implied fact gathering.

fact_path = /home/centos/ansible_facts.d

The default is to use the default from the setup module: /etc/ansible/facts.d This ONLY affects fact gathering triggered by a play when gather_facts: True.

gathering

the 'gathering' setting controls the default policy of facts gathering (variables discovered about remote systems).

The value 'implicit' is the default, which means that the fact cache will be ignored and facts will be gathered per play unless 'gather_facts: False' is set. The value 'explicit' is the inverse, facts will not be gathered unless directly requested in the play. The value 'smart' means each new host that has no facts discovered will be scanned, but if the same host is addressed in multiple plays it will not be contacted again in the playbook run. This option can be useful for those wishing to save fact gathering time. Both 'smart' and 'explicit' will use the fact cache:

gathering = smart

You can specify a subset of gathered facts, via the play's gather_facts directive, using the following option:

gather_subset = all

local_tmp

When Ansible gets ready to send a module to a remote machine it usually has to add a few things to the module: Some boilerplate code, the module's parameters, and a few constants from the config file. This combination of things gets stored in a temporary file until ansible exits and cleans up after itself. The default location is a subdirectory of the user's home directory. If you'd like to change that, you can do so by altering this setting:

local_tmp = ~/.ansible/tmp

Ansible will then choose a random directory name inside this location.

log_path

If present and configured in ansible.cfg, Ansible will log information about executions at the designated location. Be sure the user running Ansible has permissions on the logfile:

log_path=/var/log/ansible.log

This behavior is not on by default. Note that ansible will, without this setting, record module arguments called to the syslog of managed machines. Password arguments are excluded.

For Enterprise users seeking more detailed logging history, you may be interested in Ansible Tower.

lookup_plugins

This is a developer-centric feature that allows low-level extensions around Ansible to be loaded from different locations:

lookup_plugins = ~/.ansible/plugins/lookup_plugins/:/usr/share/ansible_plugins/lookup_plugins

remote_port

This sets the default SSH port on all of your systems, for systems that didn't specify an alternative value in inventory. The default is the standard 22:

remote_port = 22

remote_tmp

Ansible works by transferring modules to your remote machines, running them, and then cleaning up after itself. In some cases, you may not wish to use the default location and would like to change the path. You can do so by altering this setting:

remote_tmp = ~/.ansible/tmp

The default is to use a subdirectory of the user's home directory. Ansible will then choose a random directory name inside this location.

remote_user

This is the default username ansible will connect as for /usr/bin/ansible-playbook. Note that /usr/bin/ansible will always default to the current user if this is not defined:

remote_user = root

retry_files_enabled

This controls whether a failed Ansible playbook should create a .retry file. The default setting is True:

retry_files_enabled = False

retry_files_save_path

The retry files save path is where Ansible will save .retry files when a playbook fails and retry_files_enabled is True (the default). The default location is adjacent to the play (~/ in versions older than 2.0) and can be changed to any writeable path:

retry_files_save_path = ~/.ansible/retry-files

The directory will be created if it does not already exist.

roles_path

The roles path indicate additional directories beyond the 'roles/' subdirectory of a playbook project to search to find Ansible roles. For instance, if there was a source control repository of common roles and a different repository of playbooks, you might choose to establish a convention to checkout roles in /opt/mysite/roles like so:

roles_path = /opt/mysite/roles

Additional paths can be provided separated by colon characters, in the same way as other pathstrings:

roles_path = /opt/mysite/roles:/opt/othersite/roles

Roles will be first searched for in the playbook directory. Should a role not be found, it will indicate all the possible paths that were searched.

sudo_exe

If using an alternative sudo implementation on remote machines, the path to sudo can be replaced here provided the sudo implementation is matching CLI flags with the standard sudo:

sudo_exe = sudo

sudo_flags

Additional flags to pass to sudo when engaging sudo support. The default is '-H -S -n' which sets the HOME environment variable, prompts for passwords via STDIN, and avoids prompting the user for input of any kind. Note that '-n' will conflict with using password-less sudo auth, such as pam_ssh_agent_auth. In some situations you may wish to add or remove flags, but in general most users will not need to change this setting::

sudo_flags=-H -S -n

sudo_user

This is the default user to sudo to if --sudo-user is not specified or 'sudo_user' is not specified in an Ansible playbook. The default is the most logical: 'root':

sudo_user = root

become

The equivalent of adding sudo: or su: to a play or task, set to true/yes to activate privilege escalation. The default behavior is no:

become = True

become_method

Set the privilege escalation method. The default is sudo, other options are su, pbrun, pfexec, doas, ksu:

become_method = su

become_user

The equivalent to ansible_sudo_user or ansible_su_user, allows to set the user you become through privilege escalation. The default is 'root':

become_user = root

become_ask_pass

Ask for privilege escalation password, the default is False:

become_ask_pass = True

become_allow_same_user

Most of the time, using sudo to run a command as the same user who is running sudo itself is unnecessary overhead, so Ansible does not allow it. However, depending on the sudo configuration, it may be necessary to run a command as the same user through sudo, such as to switch SELinux contexts. For this reason, you can set become_allow_same_user to True and disable this optimization.

Ansible inventory Usage :-
------------------------------------------------------------------------
Ansible works against multiple systems in your infrastructure at the same time. It does this by selecting portions of systems listed in Ansible's inventory, which defaults to being saved in the location /etc/ansible/hosts. You can specify a different inventory file using the -i <path> option on the command line.

Not only is this inventory configurable, but you can also use multiple inventory files at the same time and pull inventory from dynamic or cloud sources or different formats (YAML, ini, etc), as described in Dynamic Inventory. Introduced in version 2.4, Ansible has inventory plugins to make this flexible and customizable.

Use pip to install the ansible package and its dependencies to your control machine. :-

easy_install pip

pip install ansible

Display the Ansible version and man page to STDOUT. :-

root@197NODNB:~# ansible --version

ansible 2.4.3.0

config file = /etc/ansible/ansible.cfg

configured module search path = [u'/root/.ansible/plugins/modules', u'/usr/share/ansible/plugins/modules']

ansible python module location = /usr/lib/python2.7/dist-packages/ansible

executable location = /usr/bin/ansible

python version = 2.7.12 (default, Dec 4 2017, 14:50:18) [GCC 5.4.0 20160609]

root@197NODNB:~#

Check all the possible parameters you need to know in ansible.cfg file. :-
---------------------------------------------------------------------------------------

ask_pass

This controls whether an Ansible playbook should prompt for a password by default. The default behavior is no:

ask_pass = True

If using SSH keys for authentication, it's probably not needed to change this setting.

ask_sudo_pass

Similar to ask_pass, this controls whether an Ansible playbook should prompt for a sudo password by default when sudoing. The default behavior is also no:

ask_sudo_pass = True

Users on platforms where sudo passwords are enabled should consider changing this setting.

ask_vault_pass

This controls whether an Ansible playbook should prompt for the vault password by default. The default behavior is no:

ask_vault_pass = True

force_handlers

This option causes notified handlers to run on a host even if a failure occurs on that host:

force_handlers = True

The default is False, meaning that handlers will not run if a failure has occurred on a host. This can also be set per play or on the command line. See Handlers and Failure for more details.

forks

This is the default number of parallel processes to spawn when communicating with remote hosts. Since Ansible 1.3, the fork number is automatically limited to the number of possible hosts at runtime, so this is really a limit of how much network and CPU load you think you can handle. Many users may set this to 50, some set it to 500 or more. If you have a large number of hosts, higher values will make actions across all of those hosts complete faster. The default is very very conservative:

forks = 5

fact_caching

This option allows you to configure fact caching. When a fact cache is enabled and there is valid data for a host, Ansible will use that rather than running an implicit setup job on a remote host.

The value of this option should be the name of a cache plugin. Current versions of Ansible include redis and jsonfile:

fact_caching = jsonfile

fact_caching_connection

This option tells Ansible where to cache facts. The value is plugin dependent. For the jsonfile plugin, it should be a path to a local directory. For the redis plugin, the value is a host:port:database triplet:

fact_caching_connection = localhost:6379:0

fact_caching_timeout

This option tells Ansible when to expire values from the cache. Setting this value to 0 effectively disables expiry, and a positive value is a TTL in seconds:

fact_caching_timeout = 86400

fact_path

This option allows you to globally configure a custom path for Local Facts (Facts.d) for the implied setup task when using implied fact gathering.

fact_path = /home/centos/ansible_facts.d

The default is to use the default from the setup module: /etc/ansible/facts.d This ONLY affects fact gathering triggered by a play when gather_facts: True.

gathering

the 'gathering' setting controls the default policy of facts gathering (variables discovered about remote systems).

The value 'implicit' is the default, which means that the fact cache will be ignored and facts will be gathered per play unless 'gather_facts: False' is set. The value 'explicit' is the inverse, facts will not be gathered unless directly requested in the play. The value 'smart' means each new host that has no facts discovered will be scanned, but if the same host is addressed in multiple plays it will not be contacted again in the playbook run. This option can be useful for those wishing to save fact gathering time. Both 'smart' and 'explicit' will use the fact cache:

gathering = smart

You can specify a subset of gathered facts, via the play's gather_facts directive, using the following option:

gather_subset = all

local_tmp

When Ansible gets ready to send a module to a remote machine it usually has to add a few things to the module: Some boilerplate code, the module's parameters, and a few constants from the config file. This combination of things gets stored in a temporary file until ansible exits and cleans up after itself. The default location is a subdirectory of the user's home directory. If you'd like to change that, you can do so by altering this setting:

local_tmp = ~/.ansible/tmp

Ansible will then choose a random directory name inside this location.

log_path

If present and configured in ansible.cfg, Ansible will log information about executions at the designated location. Be sure the user running Ansible has permissions on the logfile:

log_path=/var/log/ansible.log

This behavior is not on by default. Note that ansible will, without this setting, record module arguments called to the syslog of managed machines. Password arguments are excluded.

For Enterprise users seeking more detailed logging history, you may be interested in Ansible Tower.

lookup_plugins

This is a developer-centric feature that allows low-level extensions around Ansible to be loaded from different locations:

lookup_plugins = ~/.ansible/plugins/lookup_plugins/:/usr/share/ansible_plugins/lookup_plugins

remote_port

This sets the default SSH port on all of your systems, for systems that didn't specify an alternative value in inventory. The default is the standard 22:

remote_port = 22

remote_tmp

Ansible works by transferring modules to your remote machines, running them, and then cleaning up after itself. In some cases, you may not wish to use the default location and would like to change the path. You can do so by altering this setting:

remote_tmp = ~/.ansible/tmp

The default is to use a subdirectory of the user's home directory. Ansible will then choose a random directory name inside this location.

remote_user

This is the default username ansible will connect as for /usr/bin/ansible-playbook. Note that /usr/bin/ansible will always default to the current user if this is not defined:

remote_user = root

retry_files_enabled

This controls whether a failed Ansible playbook should create a .retry file. The default setting is True:

retry_files_enabled = False

retry_files_save_path

The retry files save path is where Ansible will save .retry files when a playbook fails and retry_files_enabled is True (the default). The default location is adjacent to the play (~/ in versions older than 2.0) and can be changed to any writeable path:

retry_files_save_path = ~/.ansible/retry-files

The directory will be created if it does not already exist.

roles_path

The roles path indicate additional directories beyond the 'roles/' subdirectory of a playbook project to search to find Ansible roles. For instance, if there was a source control repository of common roles and a different repository of playbooks, you might choose to establish a convention to checkout roles in /opt/mysite/roles like so:

roles_path = /opt/mysite/roles

Additional paths can be provided separated by colon characters, in the same way as other pathstrings:

roles_path = /opt/mysite/roles:/opt/othersite/roles

Roles will be first searched for in the playbook directory. Should a role not be found, it will indicate all the possible paths that were searched.

sudo_exe

If using an alternative sudo implementation on remote machines, the path to sudo can be replaced here provided the sudo implementation is matching CLI flags with the standard sudo:

sudo_exe = sudo

sudo_flags

Additional flags to pass to sudo when engaging sudo support. The default is '-H -S -n' which sets the HOME environment variable, prompts for passwords via STDIN, and avoids prompting the user for input of any kind. Note that '-n' will conflict with using password-less sudo auth, such as pam_ssh_agent_auth. In some situations you may wish to add or remove flags, but in general most users will not need to change this setting::

sudo_flags=-H -S -n

sudo_user

This is the default user to sudo to if --sudo-user is not specified or 'sudo_user' is not specified in an Ansible playbook. The default is the most logical: 'root':

sudo_user = root

become

The equivalent of adding sudo: or su: to a play or task, set to true/yes to activate privilege escalation. The default behavior is no:

become = True

become_method

Set the privilege escalation method. The default is sudo, other options are su, pbrun, pfexec, doas, ksu:

become_method = su

become_user

The equivalent to ansible_sudo_user or ansible_su_user, allows to set the user you become through privilege escalation. The default is 'root':

become_user = root

become_ask_pass

Ask for privilege escalation password, the default is False:

become_ask_pass = True

become_allow_same_user

Most of the time, using sudo to run a command as the same user who is running sudo itself is unnecessary overhead, so Ansible does not allow it. However, depending on the sudo configuration, it may be necessary to run a command as the same user through sudo, such as to switch SELinux contexts. For this reason, you can set become_allow_same_user to True and disable this optimization.

Ansible Inventory: Check the default inventory file for ansible control master and use inventory, run ansible ping commands on various inventory groups. Try this on minimum of two virtual machines.(You can use any of these Docker/Vagrant) :-

vim /etc/ansible/hosts

[vishwas_test]
192.168.33.11
192.168.33.11

ansible all -m ping

In ~/.ansible.cfg file (create the file if it doesn't exist already) do the following: :-

Create a new directory ~/.ansible/retry-files and set retry_files_save_path to it. :-

Set the Ansible system forks to 10 :-

mkdir ~/.ansible/retry-files

vim ansible.cfg change forks = 10 and retry_files_save_path = ~/.ansible/retry-files

------------------------------------------------------------------------------------------------------------s

AD-HOC Command
ansible vishwas_test -m service -a "name=nginx.service state=restarted" -b -K

root@ubuntu-xenial:/etc/ansible# ansible vishwas_test -m copy -a "src=/etc/ansible/playbooks.yml dest=/tmp/vishu"
192.168.33.11 | SUCCESS => {
    "changed": true,
    "checksum": "92dce28be53bb3328c15508f4c1d6803829a5278",
    "dest": "/tmp/vishu",
    "gid": 0,
    "group": "root",
    "md5sum": "2c41d4bb0d384c317ff4c2f7bf62b524",
    "mode": "0644",
    "owner": "root",
    "size": 247,
    "src": "/root/.ansible/tmp/ansible-tmp-1519920564.73-180901130014849/source",
    "state": "file",
    "uid": 0
}
192.168.33.12 | SUCCESS => {
    "changed": true,
    "checksum": "92dce28be53bb3328c15508f4c1d6803829a5278",
    "dest": "/tmp/vishu",
    "gid": 0,
    "group": "root",
    "md5sum": "2c41d4bb0d384c317ff4c2f7bf62b524",
    "mode": "0644",
    "owner": "root",
    "secontext": "unconfined_u:object_r:admin_home_t:s0",
    "size": 247,
    "src": "/root/.ansible/tmp/ansible-tmp-1519920565.74-18449664216186/source",
    "state": "file",
    "uid": 0
}


root@ubuntu-xenial:/etc/ansible# ansible 192.168.33.12 -m yum -a "name=httpd state=present"
192.168.33.12 | SUCCESS => {
    "changed": true,
    "msg": "",
    "rc": 0,
    "results": [
        "Loaded plugins: fastestmirror\nLoading mirror speeds from cached hostfile\n * base: centos.mirror.net.in\n * extras: mirror.nbrc.ac.in\n * updates: mirror.nbrc.ac.in\nResolving Dependencies\n--> Running transaction check\n---> Package httpd.x86_64 0:2.4.6-67.el7.centos.6 will be installed\n--> Processing Dependency: httpd-tools = 2.4.6-67.el7.centos.6 for package: httpd-2.4.6-67.el7.centos.6.x86_64\n--> Processing Dependency: /etc/mime.types for package: httpd-2.4.6-67.el7.centos.6.x86_64\n--> Running transaction check\n---> Package httpd-tools.x86_64 0:2.4.6-67.el7.centos.6 will be installed\n---> Package mailcap.noarch 0:2.1.41-2.el7 will be installed\n--> Finished Dependency Resolution\n\nDependencies Resolved\n\n================================================================================\n Package           Arch         Version                     Repository     Size\n================================================================================\nInstalling:\n httpd             x86_64       2.4.6-67.el7.centos.6       updates       2.7 M\nInstalling for dependencies:\n httpd-tools       x86_64       2.4.6-67.el7.centos.6       updates        88 k\n mailcap           noarch       2.1.41-2.el7                base           31 k\n\nTransaction Summary\n================================================================================\nInstall  1 Package (+2 Dependent packages)\n\nTotal download size: 2.8 M\nInstalled size: 9.6 M\nDownloading packages:\n--------------------------------------------------------------------------------\nTotal                                              512 kB/s | 2.8 MB  00:05     \nRunning transaction check\nRunning transaction test\nTransaction test succeeded\nRunning transaction\n  Installing : httpd-tools-2.4.6-67.el7.centos.6.x86_64                     1/3 \n  Installing : mailcap-2.1.41-2.el7.noarch                                  2/3 \n  Installing : httpd-2.4.6-67.el7.centos.6.x86_64                           3/3 \n  Verifying  : mailcap-2.1.41-2.el7.noarch                                  1/3 \n  Verifying  : httpd-2.4.6-67.el7.centos.6.x86_64                           2/3 \n  Verifying  : httpd-tools-2.4.6-67.el7.centos.6.x86_64                     3/3 \n\nInstalled:\n  httpd.x86_64 0:2.4.6-67.el7.centos.6                                          \n\nDependency Installed:\n  httpd-tools.x86_64 0:2.4.6-67.el7.centos.6    mailcap.noarch 0:2.1.41-2.el7   \n\nComplete!\n"
    ]
}


ansible-playbook playbooks.yml

playbooks.yml contains below :-

---
- hosts: vishwas_test
  tasks:
    - name: Installs nginx web server
      apt: pkg=nginx state=installed update_cache=true
      notify:
        - start nginx

  handlers:
    - name: start nginx
      service: name=nginx state=started

Parts of Playbook:-

host
variable
tasks
handlers

Website through nginx ( http://192.168.33.11:80)

First do this manually and then with jenkins using ansible plugin or execute shell.
------------------------------------------------------------------------------------------

only use ansible modules. :-
Create a new jenkins job.

In build section select Invoke ansible playbook

Give playbook path.

After that run the build.

