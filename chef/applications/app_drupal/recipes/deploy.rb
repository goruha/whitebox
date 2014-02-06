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

rbenv_gem "librarian-chef" do
  ruby_version "1.8.7-p352"
end


directory "/opt/rbenv" do
  owner  "jenkins"
  group  "jenkins"
  mode    0777
end

#bash "change version ruby" do
#  code <<-EOH
#  rbenv global 1.8.7-p352
#  EOH
#end
#
#bash "install capistrano 2.15.5" do
#  code <<-EOH
#  gem install capistrano --version "=2.15.5"
#  EOH
#end

#rvm_gemset "jenkins" do
#  ruby_string "ruby-1.8.7"
#  action      :create
#  user        "jenkins"
#end
#rvm_ruby "jruby-1.6.3"

#
#rvm_default_ruby "1.8.7" do
#  action :create
#  user   "jenkins"
#end
#
#rvm_gem "" do
#  action  :install
#  user    "jenkins"
#  version '2.15.5'
#end














