# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = 'pioneers-ubuntu-64'
  config.vm.box_url = 'http://cloud-images.ubuntu.com/precise/current/precise-server-cloudimg-vagrant-amd64-disk1.box'
  config.vm.host_name = 'platform'
  config.vm.customize ['modifyvm', :id, '--memory', '512']
  config.vm.network :hostonly, '172.24.24.24' # api
end
