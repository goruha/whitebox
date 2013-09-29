include_recipe "build-essential"

package 'git-core' # for dev checkouts


#php_pear "xdebug" do
#  action :install
#end

#template "/etc/php5/conf.d/xdebug.ini" do
#  source "xdebug.ini.erb"
#  owner "root"
#  group "root"
#  mode 0644
#end

#php_pear "xhprof" do
#  preferred_state "beta"
#  action :install
#end
