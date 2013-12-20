include_recipe "app_nginx"
include_recipe "app_php"
include_recipe "memcached"
include_recipe 'iptables'
iptables_rule 'port_http' do
  enable true
end
