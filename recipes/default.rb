#
# Cookbook Name:: inwx-dns-updater
# Recipe:: default
#
# Copyright 2013, ka’imi
#

application "inwx-dns-updater" do
  path node['inwx-dns-updater']['dir']
  owner node['inwx-dns-updater']['user']

  reopistory node['inwx-dns-updater']['repository']
  revision node['inwx-dns-updater']['version']
end

cron "inwx-dns-updater" do
  minute "*/#{node['inwx-dns-updater']['frequency']}"
  user node['inwx-dns-updater']['user']
  mailto node['inwx-dns-updater']['email']
  command "#{node['inwx-dns-updater']['dir']}/current/inwx-dns-dns-updater.sh > #{node['inwx-dns-updater']['logfile']}"
end

template "#{node['inwx-dns-updater']['dir']}/current/nsupdate.conf" do
  source "nsupdate.conf.erb"
  user node['inwx-dns-updater']['user']
end
