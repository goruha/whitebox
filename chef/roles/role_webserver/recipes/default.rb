include_recipe "app_nginx"
include_recipe "app_php"
include_recipe "firewall::iptables"
include_recipe "memcached"
firewall "iptables" do
    action :flush
end

firewall_rule "ssh" do
    port 22
    action :allow
    notifies :flush, "firewall[iptables]"
end

firewall_rule "vagrant_ssh" do
    port 2222
    action :allow
    notifies :flush, "firewall[iptables]"
end

firewall_rule "http" do
    port 80
    protocol :tcp
    action :allow
    notifies :flush, "firewall[iptables]"
end

firewall "iptables" do
    action :disable
end
