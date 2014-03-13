#include_recipe "rvm::system"
#include_recipe "rvm::user_install"
include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"
include_recipe "rbenv::rbenv_vars"

rbenv_ruby "1.9.3-p194"

rbenv_ruby "1.8.7-p352"
rbenv_gem "capistrano" do
  ruby_version "1.9.3-p194"
  version      "2.15.5"
  action       :install
end

rbenv_gem "bundler" do
  ruby_version "1.8.7-p352"
end


rbenv_gem "capistrano" do
  ruby_version "1.8.7-p352"
end

directory "/opt/rbenv" do
  owner  "jenkins"
  group  "jenkins"
  mode    0777
end

#web_app "crm.apertalab.no-ip.org" do
#  server_name "crm.apertalab.no-ip.org"
#  server_aliases "www.crm.apertalab.no-ip.org"
#  docroot "/var/www/crm.apertalab.no-ip.org/current"
#end
















