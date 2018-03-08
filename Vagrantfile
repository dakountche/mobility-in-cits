# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.


ENV["LC_ALL"] = "en_US.UTF-8"

Vagrant.configure("2") do |config|
  config.vm.box = "debian/stretch64"

      # The Home agent configuration 
      config.vm.define "ha" do |ha|
        ha.vm.hostname = "ha.box"
        ha.vm.network "private_network", ip: "192.168.1.3"
        ha.vm.network "private_network", ip: "192.168.5.3"
        ha.vm.provision "shell",
          :path => "scripts/install-ha-routes.sh"
      end

      # The mobile router
      config.vm.define "mr" do |mr|
        mr.vm.hostname = "mr.box"
        mr.vm.network "private_network", ip: "192.168.3.4"
        mr.vm.network "private_network", ip: "192.168.1.10"
        mr.vm.network "private_network", ip: "192.168.10.10"
        mr.vm.provision "shell",
          :path => "scripts/install-mr-routes.sh"
      end

      # The ITS station router
      config.vm.define "itssr" do |itssr|
        itssr.vm.hostname = "itssr.box"
        itssr.vm.network "private_network", ip: "192.168.3.2"
        itssr.vm.network "private_network", ip: "192.168.1.2"
        itssr.vm.provision "shell",
          :path => "scripts/install-itssr-routes.sh"
      end

       # A second ITS station
        config.vm.define "itssr2" do |itssr2|
          itssr2.vm.hostname = "itssr2.box"
          itssr2.vm.network "private_network", ip: "192.168.1.4"
	  itssr2.vm.network "private_network", ip: "192.168.1.3"
          itssr2.vm.provision "shell",
            :path => "scripts/install-itssr2-routes.sh"
        end

      # The corresponding node in the terminology of Mobile IPv6
      config.vm.define "cn" do |cn|
        cn.vm.hostname = "cn.box"
        cn.vm.network "private_network", ip: "192.168.5.3"
        cn.vm.provision "shell",
          :path => "scripts/install-cn-routes.sh"
      end

      # The Application processing unit
      config.vm.define "apu" do |apu|
        apu.vm.hostname = "apu.box"
        apu.vm.network "private_network", ip: "192.168.10.11"
      end

  config.vm.provider "virtualbox" do |vb|
      # Display the VirtualBox GUI when booting the machine
      #config.ssh.private_key_path = "~/.ssh/id_rsa_vagrant"
      #config.ssh.forward_agent = true
      vb.gui = false
  #   # Customize the amount of memory on the VM:
      vb.memory = "512"

  end



config.vm.provision :shell, :path => "scripts/install-puppet.sh"
config.vm.provision :puppet do |puppet|
  puppet.environment = 'cits'
  puppet.environment_path = 'puppet/environments'
  puppet.module_path = "puppet/modules"
end
end
