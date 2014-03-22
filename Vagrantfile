# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.box = "coreos"
    config.vm.box_url = "http://storage.core-os.net/coreos/amd64-generic/dev-channel/coreos_production_vagrant.box"

    config.vm.provision "shell", path: "https://raw.githubusercontent.com/Grubdice/docker/master/setup.sh"
    config.vm.network "forwarded_port", guest: 80, host: 8080

    # Uncomment below to enable NFS for sharing the host machine into the coreos-vagrant VM.
    # config.vm.network "private_network", ip: "172.12.8.150"
    # config.vm.synced_folder ".", "/home/core/share", id: "core", :nfs => true,  :mount_options   => ['nolock,vers=3,udp']

    # Fix docker not being able to resolve private registry in VirtualBox
    config.vm.provider :virtualbox do |vb, override|
        vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
        vb.memory = 1024
        vb.cpus = 2
    end

    config.vm.provider :vmware_fusion do |vb, override|
        override.vm.box_url = "http://storage.core-os.net/coreos/amd64-generic/dev-channel/coreos_production_vagrant_vmware_fusion.box"
    end

    # plugin conflict
    if Vagrant.has_plugin?("vagrant-vbguest") then
        config.vbguest.auto_update = false
    end
end
