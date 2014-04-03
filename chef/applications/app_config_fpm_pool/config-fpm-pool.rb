#
# Cookbook Name:: kw-cloud-sites
# Recipe:: config-fpm-pool
#
# Configure the FPM Pool

fpm_pool "www" do
  php_admin_value   node['php-fpm']['pool']['www']['php_admin_value']
  php_admin_flag    node['php-fpm']['pool']['www']['php_admin_flag']
  php_flag          node['php-fpm']['pool']['www']['php_flag']
end