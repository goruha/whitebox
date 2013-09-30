case node[:platform]
when "centos"
  include_recipe "app_centos"
when "ubuntu"
  include_recipe "app_ubuntu"
end


