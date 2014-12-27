# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|

	config.vm.box = "debian_7.6"
  	config.vm.box_url = "https://github.com/jose-lpa/packer-debian_7.6.0/releases/download/1.0/packer_virtualbox-iso_virtualbox.box"

  	config.vm.provision :shell, path: "installDocker.sh"
  	config.vm.provision :shell, path: "installContainers.sh", args: ["/vagrant/"]
  	config.vm.provision :shell, path: "initDatabases.sh"
    config.vm.provision :shell, path: "runContainers.sh"

  	config.vm.network "forwarded_port", guest: 80, host: 8080

    config.vm.network "forwarded_port", guest: 21, host: 2121
    config.vm.network "forwarded_port", guest: 6000, host: 6000
    config.vm.network "forwarded_port", guest: 6001, host: 6001
    config.vm.network "forwarded_port", guest: 6002, host: 6002
    config.vm.network "forwarded_port", guest: 6003, host: 6003
    config.vm.network "forwarded_port", guest: 6004, host: 6004
    config.vm.network "forwarded_port", guest: 6005, host: 6005
    config.vm.network "forwarded_port", guest: 6006, host: 6006
    config.vm.network "forwarded_port", guest: 6007, host: 6007
    config.vm.network "forwarded_port", guest: 6008, host: 6008
    config.vm.network "forwarded_port", guest: 6009, host: 6009
    config.vm.network "forwarded_port", guest: 6010, host: 6010
    
end
