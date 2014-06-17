# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  # config.vm.box_url = 'https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box'
  # config.vm.box = 'trusty'


  config.vm.synced_folder "hieradata", "/var/lib/hiera"

  config.vm.define "ws00" do |node|
    node.vm.hostname = "ws00.example.local"
    node.vm.network "private_network", ip: "192.168.50.10"
    node.vm.provision :hosts

    node.vm.provision "docker", images: ["ubuntu"]

    node.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "manifests/"
      puppet.manifest_file = "ws00.example.local.pp"
      puppet.module_path = "modules/"
      puppet.options = "--verbose --debug"

      puppet.hiera_config_path = "hiera.yaml"
    end
  end
end
