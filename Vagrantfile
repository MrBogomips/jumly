# -*- mode: ruby -*-
Vagrant.configure("2") do |config|
  config.vm.box     = "centos-6.4-x86_64"
  config.vm.box_url = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130731.box"

  config.vm.provision :puppet do |puppet|
    puppet.options  = "--verbose --debug"
  end
end
