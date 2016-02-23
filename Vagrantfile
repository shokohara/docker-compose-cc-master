# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.require_version ">= 1.8.1"
Vagrant.configure("2") do |config|
  #  config.vm.box = "ubuntu1510"
  #  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/wily/20160204/wily-server-cloudimg-amd64-juju-vagrant-disk1.box"
  config.vm.box = "ubuntu1510"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/wily/current/wily-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.define "master" do |master|
    master.vm.network :private_network, ip:"192.168.33.11"
    master.vm.provision "file", source: "./master/docker-compose.yml", destination: "docker-compose.yml"
    master.vm.provision "shell", path: "./master/bootstrap.sh", privileged: true
    #    config.vm.provision :reload
  end
  config.vm.define "cache" do |cache|
    cache.vm.network :private_network, ip:"192.168.33.12"
    cache.vm.provision "file", source: "./cache/docker-compose.yml", destination: "docker-compose.yml"
    cache.vm.provision "shell", path: "./cache/bootstrap.sh", privileged: true
    #    config.vm.provision :reload
  end
  config.vm.define "slave" do |slave|
    slave.vm.network :private_network, ip:"192.168.33.13"
    slave.vm.provision "file", source: "./slave/docker-compose.yml", destination: "docker-compose.yml"
    slave.vm.provision "shell", path: "./slave/bootstrap.sh", privileged: true
  end
end
