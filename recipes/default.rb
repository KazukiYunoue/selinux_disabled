#
# Cookbook:: selinux_disabled
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

execute "SElinux Disabled" do
  command "setenforce 0"
  only_if "getenforce | grep Enforcing"
end

template "/etc/selinux/config" do
  source "config.erb"
  user "root"
  group "root"
  mode 0644
end
