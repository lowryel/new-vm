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
        - laravel framework using composer
        - MYSQL-server
        - nginx - to serve as the web server

- The MySQL-server comes preloaded with a default user and database which are insecure
    they have to be deleted for new root user with password and database to be created
- Also, since we are pulling the code from github, you setup one of the tasks to pull the 
    code and save it in a destination directory in the virtual server
- Once you run the playbook, your application dependencies, files, folders and any plugins added
    to the playbook will be installed to their respective locations and the application will also start
    automatically and be served by nginx. Run ``` vagrant up ``` and ansible will also start to configure the 
    server and install the application and deploy it on the server
- Next thing is to copy the ip address and access it in a local web browser.