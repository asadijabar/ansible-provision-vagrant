Vagrant.configure("2") do |config|
  config.vm.box = "trusty"
  config.vm.box_url = "https://oss-binaries.phusionpassenger.com/vagrant/boxes/latest/ubuntu-14.04-amd64-vbox.box"

  config.vm.network :private_network, ip: "192.168.33.10"
  config.vm.provision "shell", path: "provision.sh", privileged: false
  config.vm.synced_folder ".", "/vagrant", mount_options: ['dmode=775', 'fmode=664']
end
