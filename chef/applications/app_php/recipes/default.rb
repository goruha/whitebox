
include_recipe "php"
include_recipe "php::fpm"
case node[:platform]
when "centos"
  package "php-pdo"
end
template "#{node['php']['conf_dir']}/php-cli.ini" do
  source 'php.ini.erb'
  owner 'root'
  group 'root'
  mode 0644
end

