Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu_12_04_2"
  config.vm.box_url = "http://goo.gl/8kWkm"
  config.omnibus.chef_version = "10.28.0"
  config.vm.hostname = 'ci.apertalab.no-ip.org'

  config.vm.network :private_network, ip: "33.33.33.35"
  #config.vm.network :forwarded_port, host: 88, guest: 80
  #config.vm.network :forwarded_port, host: 8080, guest: 8080
  #config.vm.network :forwarded_port, host: 3306, guest: 3306
  #config.vm.network :forwarded_port, host: 5432, guest: 5432

 config.vm.synced_folder ".", "/vagrant", :nfs => false

 config.vm.provision "chef_solo" do |chef|
  chef.cookbooks_path = ["cookbooks", "chef/applications", "chef/environments", "chef/roles"]
  chef.data_bags_path = ["chef/data_bags"]
  # chef.add_recipe "rvm::vagrant"
  chef.add_recipe "env_whitebox"

  chef.json = {
      :mysql => {
          :server_root_password => 'root',
          :server_debian_password => 'root',
          :server_repl_password => 'root',
          :tunable => {
             :innodb_file_per_table => 1,
             :max_allowed_packet => '256M',
          }
      },
      #:rvm => {
      #    :vagrant => {
      #        :system_chef_solo => '/usr/lib/ruby/gems/1.8/gems/chef-11.4.0/bin/chef-solo',
      #        :system_chef_client => '/usr/lib/ruby/gems/1.8/gems/chef-11.4.0/bin/chef-client'
      #    }
      #}
  }
 end

 config.vm.provider :virtualbox do |vb|
  vb.customize ["modifyvm", :id, "--memory", "1024"]
#  vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/vagrant", "1"]
 end
end
