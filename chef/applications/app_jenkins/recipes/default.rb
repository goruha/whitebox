#unless platform_family?('rhel', 'fedora')
#  package "fonts-dejavu-core"
#else
#  package "dejavu-sans-fonts"
#end

include_recipe "jenkins::server"

home_dir = node['jenkins']['server']['home']
ssh_dir = File.join(home_dir, '.ssh')
lock_file = "#{home_dir}/app_jenkins.init.lock"


if (!File.exists?(lock_file)) then
    directory ssh_dir do
      recursive true
      owner node['jenkins']['server']['user']
      group node['jenkins']['server']['ssh_dir_group']
    end

    file "#{ssh_dir}/id_rsa" do
      owner node['jenkins']['server']['user']
      group node['jenkins']['server']['ssh_dir_group']
    end

    directory "/tmp/jenkins_config" do
      recursive true
      action :delete
    end

    bash "Pull git config once" do
      code <<-EOH
        eval `ssh-agent`
        ssh-add
      EOH
      user node['jenkins']['server']['user']
    end

    ssh_known_hosts_entry 'github.com'

    git "/tmp/jenkins_config" do
      repository node['jenkins']['server']['config']['uri']
      reference node['jenkins']['server']['config']['branch']
      action :export
      user node['jenkins']['server']['user']
      notifies :restart, "service[jenkins]"
    end

    bash "copy jenkins confg" do
      code <<-EOH
        cp -r /tmp/jenkins_config/* #{home_dir}/
      EOH
      user node['jenkins']['server']['user']
    end

    directory "/tmp/jenkins_config" do
      recursive true
      action :delete
    end

    file lock_file do
      action :touch
    end
end

include_recipe "jenkins::iptables"
directory node[:jenkins][:node][:home] do
  action :create
end
