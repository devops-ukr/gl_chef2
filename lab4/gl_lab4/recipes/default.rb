#
# Cookbook:: gl_lab4
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.


password = node.default['mysql_common']['mysql_root_password']

node.default['mysql_common']['mysql_packages'].each do |pkg|
  package pkg
end

service 'mysqld' do
  action :start
  subscribes :reload, 'template[/etc/my.cnf]', :immediately
end

execute 'set root password' do
  command "/usr/bin/mysqladmin -u root password '#{password}'"
  not_if "mysql -u root -p#{password} -e 'USE mysql;'"
end

template '/etc/my.cnf' do
  source 'my.cnf.erb'
  owner 'root'
  group 'root'
  mode  '0644'
end
