execute "pear config-set auto_discover 1" do
  action :run
  only_if { true }
end

phpunit_ch = php_pear_channel "pear.phpunit.de" do
  action :discover
end

php_pear "phpcpd" do
  action :install
  channel phpunit_ch.channel_name
  shell_timeout 9000
end

phpmd_ch = php_pear_channel "pear.phpmd.org" do
  action :discover
end

php_pear "PHP_PMD" do
  action :install
  channel phpmd_ch.channel_name
  shell_timeout 9000
end

php_pear "PHP_CodeSniffer" do
  action :install
  shell_timeout 9000
  version '1.4.7'
end

directory '/usr/share/drupal'

git "/usr/share/drupal/coder" do
   repository "git://git.drupal.org/project/coder.git"
   reference '7.x-2.x'
   action :sync
end

bash "create link" do
  code  <<-EOH
    ln -s /usr/share/drupal/coder/coder_sniffer/Drupal #{node['php']['pear_dir']}/PHP/CodeSniffer/Standards/Drupal
  EOH
  not_if do ::File.exist?("#{node['php']['pear_dir']}/PHP/CodeSniffer/Standards/Drupal") || ::File.symlink?("#{node['php']['pear_dir']}/PHP/CodeSniffer/Standards/Drupal") end
end

include_recipe "phpunit"
include_recipe "phing"

include_recipe "git"
php_pear "VersionControl_Git" do
  action :install
  shell_timeout 9000
end

include_recipe "subversion"
php_pear "VersionControl_SVN" do
  action :install
  shell_timeout 9000
end

package "patch"
include_recipe "squid" # for speeding up drush_make
