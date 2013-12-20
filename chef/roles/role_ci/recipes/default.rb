home_dir = node['jenkins']['server']['home']
ssh_dir = File.join(home_dir, '.ssh')

directory "#{home_dir}" do
  action :create
end

directory "#{ssh_dir}" do
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

