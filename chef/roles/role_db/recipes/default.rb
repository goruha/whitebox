node['mysql']['server_debian_password'] = "root"
node['mysql']['server_root_password'] = "root"
node['mysql']['server_repl_password'] = "root"
node['mysql']['tunable']['innodb_file_per_table'] = true
include_recipe "app_mysql"
