#
# Cookbook Name:: inwx-dns-updater
# Recipe:: default
#
# Copyright 2013, ka’imi
#

# install dependencies
%w{bash curl dnsutils}.each do |p|
  package p
end

application "inwx-dns-updater" do
  path node['inwx-dns-updater']['dir']
  owner node['inwx-dns-updater']['user']

  repository node['inwx-dns-updater']['repository']
  revision node['inwx-dns-updater']['version']
end

cron "inwx-dns-updater" do
  minute "*/#{node['inwx-dns-updater']['frequency']}"
  user node['inwx-dns-updater']['user']
  mailto node['inwx-dns-updater']['email']
  command "cd #{node['inwx-dns-updater']['dir']}/current; ./inwx-dns-updater.sh -c #{node['inwx-dns-updater']['dir']}/shared/nsupdate.conf >> #{node['inwx-dns-updater']['logfile']}"
end

file node['inwx-dns-updater']['logfile'] do
  user node['inwx-dns-updater']['user']
end

template "#{node['inwx-dns-updater']['dir']}/shared/nsupdate.conf" do
  source "nsupdate.conf.erb"
  user node['inwx-dns-updater']['user']
end
