execute :set_msk_timezone do
  command "echo \"Europe/Moscow\" | tee /etc/timezone; dpkg-reconfigure --frontend noninteractive tzdata"
  action :run
end

execute "apt-get update" do
  command "apt-get update"
  ignore_failure true
  action :nothing
end