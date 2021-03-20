# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 2.0.0"

# config option
$box ||= "ubuntu/bionic64"
$vm_memory ||= 2048
$vm_cpus ||= 2
$disk_size ||= "20GB"
# Ansible config
$ansible_playbook ||= "cluster.yml"
$ansible_inventory_path ||= "inventory/development"

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
	config.ssh.private_key_path = "~/.vagrant.d/insecure_private_key"
	config.vm.provision "file", source: "~/.vagrant.d/insecure_private_key", destination: "/home/vagrant/.ssh/id_rsa"

  config.disksize.size = $disk_size
  config.vm.provider "virtualbox" do |vb|
    vb.memory = $vm_memory
    vb.cpus = $vm_cpus
  end

  config.vm.define "k8s.vm.master" do |node|
		node.vm.box = $box
		node.vm.network :private_network, ip: "192.0.2.101"
		node.vm.network :forwarded_port, id: "ssh", guest: 22, host: 2220
	end

  config.vm.define "k8s.vm.node" do |node|
		node.vm.box = $box
		node.vm.network :private_network, ip: "192.0.2.201"
		node.vm.network :forwarded_port, id: 'ssh', guest: 22, host: 2230
    
    # Only execute the Ansible provisioner once, when all the machines are up and ready
    node.vm.provision "ansible" do |ansible|
      ansible.limit = "all"
      ansible.playbook = $ansible_playbook
      ansible.inventory_path = $ansible_inventory_path
    end
  end
end
