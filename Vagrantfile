Vagrant.configure("2") do |config|
  config.vm.box = "vagrant-debian-wheezy"
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.add_recipe "apt"
    chef.add_recipe "database"
    chef.add_recipe "app"
  end
end
