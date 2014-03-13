node[:doc_root]= "/var/www/crm.apertalab.no-ip.org/current"

site = "crm.apertalab.no-ip.org"
template "/etc/nginx/sites-available/#{site}.conf" do
  source "nginx.conf.erb"
  mode "0755"
  owner "root"
  group "root"
  variables(
      :server_name => site,
      :server_aliases => ["*.#{site}"],
      :docroot => "#{node[:doc_root]}",
      :logdir => "/var/log/nginx"
  )
end

nginx_site "#{site}.conf" do
  :enable
end

