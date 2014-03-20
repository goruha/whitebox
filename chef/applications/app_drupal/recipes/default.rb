include_recipe "drush"

package "curl"
package "php5-gmp"

php_pear "uploadprogress" do
  action :install
end

if node[:drupal].has_key?("hosts")
  node[:drupal][:hosts].each do |site|
    web_app site do
      server_name site
      server_aliases ["www.#{site}"]
      docroot "#{node[:doc_root]}/#{site}/current"
    end
  end
end
