### Npontu Take Home Interview
--------------------

###### Steps taken to deploy the Laravel app on a Vagrant Box
-------------------------------------------
- First of all install virtual box and Vagrant
- Then edit the Vagrantfile to provision a virtual machine with (ubuntu/bionic64) 
    and also configure networks so you can ssh into the server using Ansible.
- Setup ansible playbook and roles with any dependencies, files, folders, plugins, 
    etc that the application needs
    - Some of the major packages to install are:
        - php
        - laravel framework
        - MYSQL-server
        - nginx - to serve as the web server


- Since we are pulling the code from github, you setup one of the tasks to pull the 
    code and save it in a destination directory in the virtual server
- 