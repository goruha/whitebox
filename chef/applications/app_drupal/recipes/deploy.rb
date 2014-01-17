include_recipe "rvm::system"
include_recipe "rvm::user_install"

node['rvm']['user_installs'] = [
    { 'user' => 'jenkins' }
]

gem_package "capistrano" do
  action :install
  version '2.15.5'
end

gem_package "rvm-capistrano" do
  action :install
end
