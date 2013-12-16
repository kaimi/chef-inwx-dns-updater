#
# Cookbook Name:: inwx-dns-updater
#
# Copyright 2013, ka’imi
#

default['inwx-dns-updater']['dir'] = "/srv/inwx-dns-updater"
default['inwx-dns-updater']['repository'] = "git://github.com/kaimi/inwx-dns-updater.git"
default['inwx-dns-updater']['version'] = "master"
default['inwx-dns-updater']['user'] = "daemon"
default['inwx-dns-updater']['email'] = "mail@domain.tld"
default['inwx-dns-updater']['frequency'] = "5" # in minutes
default['inwx-dns-updater']['logfile'] = "/var/log/inwx-dns-updater.log"

# required attributes
default['inwx-dns-updater']['hostname'] = "sub.domain.tld"
default['inwx-dns-updater']['entities'] = ["111111111", "222222222"]
default['inwx-dns-updater']['username'] = "someuser"
default['inwx-dns-updater']['password'] = "andhispassword"

# optional attributes
default['inwx-dns-updater']['xmlfile'] = nil
default['inwx-dns-updater']['site'] = nil
