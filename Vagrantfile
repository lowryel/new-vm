Vagrant.configure("2") do |config|
  config.vm.network "private_network", ip: "192.168.56.10"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end
  config.vm.provider "libvirt" do |libvirt|
    network_name = "external"

    # The IP address and subnet mask of the libvirt network.
    network_address = "192.168.56.0/24"

    # The MAC address of the virtual machine's network interface.
    mac_address = "00:11:22:33:44:55"

  end
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "npontu/playbook.yaml"
    ansible.extra_vars = {
      ansible_ssh_key_file: "~/.ssh/id_rsa"
    }
  end

  # Create a PHP server
  config.vm.define "php-server" do |php_server|
    php_server.vm.box = "ubuntu/bionic64"

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
