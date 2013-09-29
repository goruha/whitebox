name "addition"
description "Addition soft"
run_list(
  "recipe[postgis2::fix_locale]", # bug on ubuntu 12.04 - see CHEF-3283
  "recipe[postgresql::server]",
  "recipe[php::module_pgsql]",
  "recipe[php::module_sqlite3]",
  "recipe[postgis2]",
  # "recipe[postgresql::postgis]",
  # "recipe[phpmyadmin]",
  "recipe[python]",
  "recipe[zsh]"
)