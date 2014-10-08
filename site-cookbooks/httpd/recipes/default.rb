#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w{httpd mod_ssl openssl}.each do |pkg|
  package pkg do
    action :install
  end
end

template "/etc/httpd/conf/httpd.conf" do
  owner "root"
  group "root"
  mode 0644
  
  notifies :restart, 'service[httpd]'
end

service "httpd" do
  supports :restart => true, :status => true, :reload => false
  
  action [:enable, :start]
end
