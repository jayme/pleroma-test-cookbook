#
# Cookbook:: pleroma_test_cookbook
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

include_recipe 'nginx'
nginx_site 'pleroma' do
  template 'my.nginx.conf.erb'
  action :enable
end

postgresql_server_install 'pleroma postgresql' do
  action :install
end

postgresql_user 'pleroma' do
  password 'pleroma'
end

postgresql_database 'pleroma' do
  owner 'pleroma'
end

postgresql_access 'pleroma' do
  comment 'pleroma postgresql user'
  access_type 'host'
  access_db 'all'
  access_user 'pleroma'
  access_addr '127.0.0.1/32'
  access_method 'md5'
end

package 'postgresql-contrib-9.6'

%w[citext pg_trgm "uuid-ossp"].each do |ext|
  postgresql_extension ext do
    database 'pleroma'
    extension ext
  end
end

pleroma_install 'pleroma'

pleroma_instance 'pleroma' do
  ignore_failure true
  hostname 'somehostname.social'
  db_username 'pleroma'
  db_password 'pleroma'
  db_hostname 'localhost'
  db_database 'pleroma'
  secret_key 'N2NjYjM4MDc5ZjI5NmU5YjJiMzJiNTdlM2QxOTgzMGZiMmVmM2RjODYwZTQw\nZjg5MTViNWQ3NjYzZjk0YTU4NzJmNDFmYjRkYWY0YTMwYzc2N2Q0ZWY4YmFh\nZjc5YTQ3NWI0NGU3YjUzYTYzYTU1ODk0YThhNThmOTVhNTliZDY='
  register true
  public true
  email "pleroma@somehostname.social"
  action :create
end
