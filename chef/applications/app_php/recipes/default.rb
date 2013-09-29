
include_recipe "php"
include_recipe "php::fpm"
package "php-pdo"
template "#{node['php']['conf_dir']}/php-cli.ini" do
  source 'php.ini.erb'
  owner 'root'
  group 'root'
  mode 0644
end

