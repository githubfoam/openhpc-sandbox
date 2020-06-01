#!/bin/bash

cat > Vagrantfile << EOF
# -*- mode: ruby -*-
# vi: set ft=ruby :

    Vagrant.configure("2") do |config|

          config.vm.provider "virtualbox" do |vb|
            vb.gui = false
            vb.memory = "2048"
            vb.cpus = 2
          end

          config.vm.define "compute01" do |hpcluster|
            hpcluster.vm.box = "bento/centos-7.7"
            hpcluster.vm.hostname = "compute01"
            hpcluster.vm.network "private_network", ip: "192.168.1.254"
            hpcluster.vm.provider "virtualbox" do |vb|
                vb.name = "master01"
                vb.memory = "4096"
            end
            hpcluster.vm.provision "ansible_local" do |ansible|
            ansible.playbook = "deploy.yml"
            ansible.become = true
            ansible.compatibility_mode = "2.0"
            ansible.version = "2.9.7"
            end
            hpcluster.vm.provision "shell", inline: <<-SHELL
            systemctl disable firewalld
            systemctl stop firewalld
            yum -y update
            yum install -y wget
            hostnamectl status
            SHELL
          end

  end
    
EOF
