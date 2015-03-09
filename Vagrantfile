# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Base Box
  config.vm.box = "chef/centos-6.5"

  # Configure plugins for provisioning
  config.omnibus.chef_version = :latest
  config.berkshelf.enabled = true

  # Configure Network
  config.vm.network :private_network, ip: "192.168.33.10"

  # Configure VirtualBox
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ["modifyvm", :id, "--cpus", "1"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

  # Enable provisioning with chef solo
  config.vm.provision "chef_solo" do |chef|

    chef.add_recipe "yum-epel"
    chef.add_recipe "mysql::client"
    chef.add_recipe "mysql::server"
    chef.add_recipe "httpd"
    chef.add_recipe "php"

    chef.json = {
      :mysql => {
        server_root_password: "rootpass",
        server_repl_password: "rootpass",
        server_debian_password: "rootpass",
        bind_address: "127.0.0.1"
      }
    }
  end
end
