inwx-dns-updater Cookbook
=====================

This installs
[the InterNetworkX DNS Updater](https://github.com/kaimi/inwx-dns-updater).

Requirements
------------

- `bash`
- `curl`
- `dig`

At the moment, this is only tested on Ubuntu and installs Ubuntu specific 
packages for its requirements.

Attributes
----------

#### inwx-dns-updater::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['inwx-dns-updater']['dir']</tt></td>
    <td>String</td>
    <td>installation base directory</td>
    <td><tt>/srv/inwx-dns-updater</tt></td>
  </tr>
  <tr>
    <td><tt>['inwx-dns-updater']['repository']</tt></td>
    <td>String</td>
    <td>repository to clone from</td>
    <td><tt>git://github.com/kaimi/inwx-dns-updater</tt></td>
  </tr>
  <tr>
    <td><tt>['inwx-dns-updater']['version']</tt></td>
    <td>String</td>
    <td>git revision to check out; can be any valid revision identifier</td>
    <td><tt>master</tt></td>
  </tr>
  <tr>
    <td><tt>['inwx-dns-updater']['user']</tt></td>
    <td>String</td>
    <td>user to run the updater as</td>
    <td><tt>daemon</tt></td>
  </tr>
  <tr>
    <td><tt>['inwx-dns-updater']['email']</tt></td>
    <td>String</td>
    <td>email address to send cron job error emails to</td>
    <td><tt>mail@domain.tld</tt></td>
  </tr>
  <tr>
    <td><tt>['inwx-dns-updater']['frequency']</tt></td>
    <td>int</td>
    <td>frequency to run the updater on; measured in minutes, should be 1–60</td>
    <td><tt>5</tt></td>
  </tr>
  <tr>
    <td><tt>['inwx-dns-updater']['logfile']</tt></td>
    <td>String</td>
    <td>log file to redirect the updater’s output to</td>
    <td><tt>/var/log/inwx-dns-updater.log</tt></td>
  </tr>
  <tr>
    <td><tt>['inwx-dns-updater']['hostname']</tt></td>
    <td>String</td>
    <td>host name to check your public IP against</td>
    <td><tt>sub.domain.tld</tt></td>
  </tr>
  <tr>
    <td><tt>['inwx-dns-updater']['entities']</tt></td>
    <td>String[]</td>
    <td>entity IDs of the DNS entry/-ies to modify</td>
    <td><tt>111111111, 222222222</tt></td>
  </tr>
  <tr>
    <td><tt>['inwx-dns-updater']['username']</tt></td>
    <td>String</td>
    <td>your INWX web UI user name</td>
    <td><tt>someuser</tt></td>
  </tr>
  <tr>
    <td><tt>['inwx-dns-updater']['password']</tt></td>
    <td>String</td>
    <td>your INWX web UI password</td>
    <td><tt>andhispassword</tt></td>
  </tr>
  <tr>
    <td><tt>['inwx-dns-updater']['xmlfile']</tt></td>
    <td>String</td>
    <td>override API request data payload template file</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>['inwx-dns-updater']['site']</tt></td>
    <td>String</td>
    <td>override public IP address check web site</td>
    <td><tt>nil</tt></td>
  </tr>
</table>

Usage
-----

#### inwx-updater::default
You will have to at least set the `email`, `hostname`, `entities`, `username` 
and `password` attributes before running the recipe.

```ruby
node.set['inwx-dns-updater']['email'] = "admin@exapmle.com"
node.set['inwx-dns-updater']['hostname'] = "your.domain.tld"
node.set['inwx-dns-updater']['entities'] = ["123456789"]
node.set['inwx-dns-updater']['username'] = "foo"
node.set['inwx-dns-updater']['password'] = "barbaz"

include_recipe "inwx-dns-updater::default"
```

The `xmlfile` and `site` attributes are entirely optional and probably not a 
good thing to use.

The entity IDs can be determined by editing a DNS entry in the web UI and 
mousing over the „save“ button. It’s in the URL (see image):

![determining the entity ID](http://i.imgur.com/NJGQVYe.png)

Contributing
------------

I am using nvie’s
[git branching model](http://nvie.com/posts/a-successful-git-branching-model/ 
"nvie.com: A successfull Git branichng model"). To contribute you should follow 
these steps:

0. Check if your proposed change is already implemented in the `develop` branch
1. Fork the repository on Github
2. Create a named feature branch (like `feature-x`)
3. Write your change
4. Submit a Pull Request against the `develop` branch using Github


License and Authors
-------------------

Authors: ka’imi <kaimi@kaimi.cc>
