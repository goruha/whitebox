php_pear_channel "components.ez.no" do
  action :discover
end

# phing
dc = php_pear_channel "pear.phing.info" do
  action :discover
end
php_pear "phing" do
  preferred_state "stable"
  version node['phing']['version']
  channel dc.channel_name
  action :install
end

php_pear "imagick" do
  preferred_state "beta"
  action :install
  ignore_failure true
end

# PHP_Depend
dc = php_pear_channel "pear.pdepend.org" do
  action :discover
end
php_pear "PHP_Depend" do
  channel dc.channel_name
  action :install
  ignore_failure true
end

# PMD
dc = php_pear_channel "pear.phpmd.org" do
  action :discover
end
php_pear "PHP_PMD" do
  channel dc.channel_name
  action :install
end

# Dependencies for PHPUnit
dc = php_pear_channel "pear.netpirates.net" do
  action :discover
end
php_pear "fDOMDocument" do
  channel dc.channel_name
  action :install
end
dc = php_pear_channel "pear.symfony.com" do
  action :discover
end
php_pear "Finder" do
  channel dc.channel_name
  action :install
end

# PHPUnit
dc = php_pear_channel "pear.phpunit.de" do
  action :discover
end
php_pear "phpcpd" do
  channel dc.channel_name
  action :install
end
php_pear "phploc" do
  channel dc.channel_name
  action :install
end
php_pear "PHP_CodeBrowser" do
  channel dc.channel_name
  action :install
end

# Other
php_pear "PHPDocumentor" do
  action :install
end
php_pear "PHP_CodeSniffer" do
  action :install
end
php_pear "HTTP_Request2" do
  action :install
end

# JENKINS
include_recipe "apt"
include_recipe "java"

apt_repository "jenkins" do
  uri "http://pkg.jenkins-ci.org/debian"
  key "http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key"
  components ["binary/"]
  action :add
end

package "jenkins"

service "jenkins" do
  supports [:stop, :start, :restart]
  action [:start, :enable]
end

execute :install_jenkins_plugins do
  user "vagrant"
  command "wget http://127.0.0.1:8080/jnlpJars/jenkins-cli.jar -O /home/vagrant/jenkins-cli.jar;
chmod +x /home/vagrant/jenkins-cli.jar;
java -jar /home/vagrant/jenkins-cli.jar -s http://localhost:8080 install-plugin analysis-core analysis-collector checkstyle dry phing plot pmd timestamper console-column-plugin compact-columns build-timeout greenballs;
java -jar /home/vagrant/jenkins-cli.jar -s http://127.0.0.1:8080 safe-restart;"
  not_if "test -e jenkins-cli.jar"
  action :run
  ignore_failure true
end