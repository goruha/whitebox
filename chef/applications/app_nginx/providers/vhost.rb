def initialize(*args)
  super
  @action = :enable
end

action :enable do
#  if new_resource.docroot == true
#    directory "#{node[:nginx][:doc_root] }/#{new_resource.name}" do
#      owner 'nginx'
#      group 'nginx'
#    end
#  end

  template "#{node['nginx']['dir']}/sites-available/#{new_resource.name}" do
    source "nginx/vhosts/#{new_resource.name}.conf.erb"
    mode 0644
    variables(
              :host => new_resource
              )
  end
  nginx_site "#{new_resource.name}" do
    enable true
  end
  new_resource.updated_by_last_action(true)
end

action :disable do
  file "#{node['nginx']['dir']}/sites-available/#{new_resource.name}" do
    action :delete
  end
  nginx_site "#{new_resource.name}" do
    enable false
  end
  new_resource.updated_by_last_action(true)
end
