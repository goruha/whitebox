#set['rvm']['version'] = "1.17.10"
#set['rvm']['rubies'] = [
#    "ruby-1.8.7-p352",  "1.8.7", "ruby-1.9.2-p280"
#]

#set['rvm']['vagrant']['system_chef_client'] = "/usr/local/bin/chef-client"
#set['rvm']['vagrant']['system_chef_solo'] = "/usr/local/bin/chef-solo"
#set['rvm']['user_default_ruby'] = "ruby-1.8.7-p352"
#set['rvm']['user_installs'] = [
#    { 'user'     => 'jenkins',
#      'home'     => '/var/lib/jenkins',
#      'rubies'    => '1.8.7'
#    }
#]
#set['rvm']['user_gems'] = {'ruby-1.8.7' => [{'name' => 'capistrano'}]}                          1


set['rbenv']['user_installs'] = [
    { 'user'    => 'jenkins',
      'rubies'  => ['1.8.7-p352', '1.9.3-p194'],
      'global'  => '1.8.7-p352',
      'home'    => '/var/lib/jenkins',
      'gems'    => {
          '1.8.7-p352'    => [
              { 'name'    => 'capistrano',
                'version' => '2.15.5'
              }
          ]
      }
    }
]
