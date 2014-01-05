include_recipe "rvm::system"
gem_package "capistrano" do
  action :install
  version '2.15.5'
end
