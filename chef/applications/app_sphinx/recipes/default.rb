node[:sphinx][:use_stemmer] = true
node[:sphinx][:install_path] = '/usr'
node[:sphinx][:binary_path] = '/usr/bin'
node[:sphinx][:use_mysql] = true
node[:sphinx][:source][:get_way]  = :svn
node[:sphinx][:source][:svn][:revision] = "4150";
node[:sphinx][:extra_configure_flags] = [
  '--host=x86_64-unknown-linux-gnu',
  '--build=x86_64-unknown-linux-gnu',
  '--program-prefix=',
  '--exec-prefix=/usr',
  '--sbindir=/usr/sbin',
  '--sysconfdir=/etc',
  '--datadir=/usr/share',
  '--includedir=/usr/include',
  '--libdir=/usr/lib64',
  '--libexecdir=/usr/libexec',
  '--localstatedir=/var',
  '--sharedstatedir=/var/lib',
  '--mandir=/usr/share/man',
  '--infodir=/usr/share/info',
  '--sysconfdir=/etc/sphinx',
  '--without-unixodbc',
  '--with-iconv',
  '--enable-id64',
  'build_alias=x86_64-unknown-linux-gnu',
  'host_alias=x86_64-unknown-linux-gnu',
  'CFLAGS=-O2',
  'CXXFLAGS=-O2']
include_recipe "sphinx"
