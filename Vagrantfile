# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
    config.vm.box_check_update = false
    config.vm.box = "williamyeh/ubuntu-trusty64-docker"

    config.vm.network "private_network", ip: "192.168.33.10"
    config.vm.network "forwarded_port", guest: 8080, host: 8080
    config.vm.network "forwarded_port", guest: 3030, host: 3030

    #config.vm.synced_folder "./dashing/", "/"

    config.vm.provision "docker" do |docker|
        docker.images = ["frvi/dashing"]

        docker.run "frvi/dashing",
            args:   "-d -p 3030:3030"\
                    " -v '/vagrant/dashing/widgets:/widgets'"\
                    " -v '/vagrant/dashing/dashboards:/dashboards'"\
                    " -v '/vagrant/dashing/jobs:/jobs'"
    end

    config.vm.provider "virtualbox" do |vb|
        # Display the VirtualBox GUI when booting the machine
        vb.gui = false
        vb.memory = "1024"
    end


end
