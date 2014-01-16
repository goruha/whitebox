include_recipe "rvm::system"
include_recipe "rvm::user_install"
#gem_package "capistrano" do
#  action :install
#  version '2.15.5'
#end

gem_package "capistrano-rvm" do
  action :install
  version '3.0.0'
end
