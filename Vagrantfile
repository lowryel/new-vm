Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "npontu/playbook.yaml"
  end

  # Create a PHP server
  config.vm.define "php-server" do |php_server|
    php_server.vm.box = "ubuntu/bionic64"
    php_server.vm.network "private_network", ip: "192.168.56.10"
    ansible_ssh_private_key_file = ~/.ssh/id_rsa

    # Install PHP and Laravel on the PHP server
    php_server.vm.provision "shell", inline: <<-SHELL
      apt-get update
      apt-get install -y php-cli php-curl php-mysql
    SHELL
  end

   # Create a database server
#  config.vm.define "db-server" do |db_server|
#    db_server.vm.box = "ubuntu/bionic64"
#    db_server.vm.network "private_network", ip: "192.168.56.11"
#    ansible_ssh_private_key_file = ~/.ssh/id_rsa

    # Install MySQL on the database server
#    db_server.vm.provision "shell", inline: <<-SHELL
#      apt-get update
#      apt-get install -y mysql-server
#    SHELL
#  end

end
