name "drupal"
description "Requirements for a full LAMP-based Drupal install"
run_list(
  "recipe[apache2]",
  "recipe[apache2::mod_ssl]",
  "recipe[apache2::mod_expires]",
  "recipe[apache2::mod_php5]",
  "recipe[apache2::mod_rewrite]",
  "recipe[mysql::server]",
  "recipe[php::package]",
  "recipe[php::module_mysql]",
  "recipe[php::module_apc]",
  "recipe[php::module_curl]",
  "recipe[php::module_gd]",
  "recipe[git]",
  "recipe[drush]",
  "recipe[drupal]"
)
default_attributes(
  "apache2" => {
    "listen_ports" => ["80", "443"]
  }
)