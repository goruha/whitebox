#include_recipe "rvm::system"
include_recipe "rvm::user_install"

#rvm_gemset "jenkins" do
#  ruby_string "ruby-1.8.7"
#  action      :create
#  user        "jenkins"
#end

rvm_gem "capistrano" do
  action  :install
  user    "jenkins"
  version '2.15.5'
end





















