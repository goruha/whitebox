set['rvm']['default_ruby'] = "ruby-1.8.7"
set['rvm']['user_default_ruby'] = "ruby-1.8.7"
set['rvm']['user_installs'] = [{ 'user' => 'jenkins', 'home' => '/var/lib/jenkins' }]
set['rvm']['user_gems'] = {'ruby-1.8.7' => [{'name' => 'capistrano'}]}

