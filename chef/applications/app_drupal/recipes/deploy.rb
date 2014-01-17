include_recipe "rvm::system"
include_recipe "rvm::user_install"

node['rvm']['user_installs'] = [
    { :user => 'jenkins' }
]

execute 'install_rvm' do
  user('jenkins')
  user = "jenkins"
  command "su -l #{user} -c '\curl https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer | bash -s stable'"
  not_if { ::File.exists? "/home/#{user}/.rvm" }
end

gem_package "capistrano" do
  action :install
  version '2.15.5'
end

gem_package "rvm-capistrano" do
  action :install
end
