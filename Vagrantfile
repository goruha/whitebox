Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu_12_04_2"
  config.vm.box_url = "http://goo.gl/8kWkm"

  config.vm.hostname = 'dev.dev'

 network = "private"
 if ENV["OS"].to_s.include? "Windows" then
  nfsd = false
 else
  nfsd = true
 end
 nfsd = false
 if network == "private"
  config.vm.network :private_network, ip: "33.33.33.33"
  #config.vm.network :forwarded_port, host: 88, guest: 80
  #config.vm.network :forwarded_port, host: 8080, guest: 8080
  #config.vm.network :forwarded_port, host: 3306, guest: 3306
  #config.vm.network :forwarded_port, host: 5432, guest: 5432
 end

 if network == "public"
  nfsd = false;
  config.vm.network :public
  config.vm.network :forwarded_port, host: 88, guest: 80
 end

 config.vm.synced_folder ".", "/vagrant", :nfs => nfsd

 config.vm.provision "chef_solo" do |chef|
  chef.cookbooks_path = ["cookbooks", "chef/applications", "chef/environments", "chef/roles"]
  chef.data_bags_path = ["chef/data_bags"]
  chef.add_recipe "env_whitebox"
 end



 config.vm.provider :virtualbox do |vb|
  vb.customize ["modifyvm", :id, "--memory", "1024"]
#  vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/vagrant", "1"]
 end
end
