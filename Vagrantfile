require 'json'

if File.file? "config.json"
  params = JSON.parse(File.read("config.json"))
end


# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "thesoulshell/trips-base"
  config.vm.define "trips-machine"
  config.vm.hostname = params["name"] || "trips"

  # Ports
  t_port = params["trips_port"] || 6200
  d_port = params["webparser_port"] || 8081
  w_port = params["webapp_port"] || 8080

  config.vm.network "forwarded_port", guest: 6200, host: t_port
  config.vm.network "forwarded_port", guest: 11235, host: d_port

  config.vm.network "forwarded_port", guest: 80, host: w_port

  config.vm.network "private_network", type: "dhcp"

  config.vm.synced_folder "shared", "/home/vagrant/shared"
  config.ssh.forward_agent = true

  if not File.directory? "shared/#{params["system_name"]}"
	acquire_trips = params["acquire_trips"] || "acquisition/#{params["system_name"}.sh"
  	result = `#{acquire_trips}`
  end

  config.vm.provider "virtualbox" do |vb|
     # Customize the amount of memory on the VM:
     vb.memory = params["memory"] || "4096"
  end
  
  #replace SYSTEM_NAME
  config.vm.provision "system_name", type: "shell", run: "once", inline: <<-SHELL
     echo "export SYSTEM_NAME=#{params["system_name"]}" > SYSTEM_NAME
  SHELL


  if params["preconfigure"]
  	config.vm.provision "preconfigure", type: "shell", path: "#{params["preconfigure"]}", privileged: false, run: "once"
  end

  config.vm.provision "compile", type: "shell", path: "provisioners/configure-trips.sh", privileged: false, run: "once"

  config.vm.provision "compile", type: "shell", path: "provisioners/configure-trips.sh", privileged: false, run: "once"

  config.vm.provision "server", type: "shell", run: "never", privileged: false,  inline: '/home/vagrant/shared/run_lighttpd.sh'

  config.vm.provision "webparser", type: "shell", run: "once", inline: <<-SHELL
     cd shared/#{params["system_name"]}/src/WebParser && make -f Makefile-component install
  SHELL


  
end
