# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
	
	config.vm.define :web do |web_config|
		web_config.vm.network "private_network", ip: "192.168.50.10"
		web_config.vm.provision "shell", path: "manifests/bootstrap.sh"
		web_config.vm.provision "puppet" do |puppet|
			puppet.manifest_file = "default.pp"
		end
	end
end
