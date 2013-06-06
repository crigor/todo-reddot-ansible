Vagrant.configure("2") do |config|
  config.vm.box = "vagrant-debian-wheezy"
  config.vm.network :forwarded_port, guest: 80, host: 8085
  config.vm.network :private_network, :ip => "192.168.122.10"

  config.vm.provision :ansible do |ansible|
    ansible.playbook = "ansible/playbook.yml"
    ansible.inventory_file = "ansible/hosts"
  end
end
