include_recipe "role_base"
include_recipe "role_db"
include_recipe "role_webserver"
template '/etc/cron.d/chef_solo' do
  source 'chef_solo.cron.erb'
  owner 'root'
  group 'root'
  variables({
    :chef_path => '/var/chef'
  })
  mode 00644
end

