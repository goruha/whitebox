include_recipe "rvm::system"
include_recipe "rvm::user_install"
gem_package "capistrano" do
  action :install
  version '2.15.5'
end
