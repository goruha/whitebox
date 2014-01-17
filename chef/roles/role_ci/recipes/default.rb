home_dir = node['jenkins']['server']['home']
ssh_dir = File.join(home_dir, '.ssh')

directory "#{home_dir}" do
  action :create
end

directory "#{ssh_dir}" do
  action :create
end

directory "/var" do
  owner "www-data"
  action :create
end

directory "/var/www" do
  owner "www-data"
  action :create
end

cookbook_file "#{ssh_dir}/id_rsa" do
  cookbook "role_ci"
  source "id_rsa"
  action :create
end



include_recipe "app_jenkins"
include_recipe "jenkins::proxy"
include_recipe "app_drupal::develop"
include_recipe "app_drupal::deploy"
#include_recipe "drush"


link "/home/jenkins/.rvm/bin/rvm" do
  to "/usr/bin"
  action :create
end

