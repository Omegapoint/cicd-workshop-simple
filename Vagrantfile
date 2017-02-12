# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  # Define a vagrant machine for the CONTINUOUS INTEGRATION server
  # --------------------------------------------------------------
  config.vm.define "ci" do |ci|
	  ci.vm.network "private_network", ip: "192.168.33.10"
	  ci.vm.hostname = "ci"

	  ci.vm.provider "virtualbox" do |vb|
		vb.gui = false
		vb.memory = "4096"
	  end

      ci.vm.provision "shell" do |sh|
        sh.path = "bootstrap/ci.sh"
      end
  end

  # Define a vagrant machine for the TEST server
  # --------------------------------------------
  config.vm.define "test" do |test|
	  test.vm.network "private_network", ip: "192.168.33.20"
	  test.vm.hostname = "test"

	  test.vm.provider "virtualbox" do |vb|
		vb.gui = false
		vb.memory = "512"
	  end

    test.vm.provision "shell" do |sh|
      sh.path = "bootstrap/application.sh"
    end
  end
  
  # Define a vagrant machine for the PROD server
  # --------------------------------------------
  #config.vm.define "prod" do |prod|
#	  prod.vm.network "private_network", ip: "192.168.33.30"
#	  prod.vm.hostname = "prod"
#
#	  prod.vm.provider "virtualbox" do |vb|
#		vb.gui = false
#		vb.memory = "512"
#	  end
#
  #    prod.vm.provision "shell" do |sh|
  #      sh.path = "bootstrap/application.sh"
  #    end
  #end
end
