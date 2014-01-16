# Yohoushi Cookbook

[Chef](http://www.getchef.com/chef/) cookbook for [Yohoushi](http://yohoushi.github.io/yohoushi/).

Create a database and a database user on MySQL for yohoushi, and install yohoushi.

## Middleware Requirements

Yohoushi requires followings, but this cookbook does not install them. Please install them by other recipes or manually.

* Ruby (>=2.0.0)
* MySQL or Sqlite3 (>=3.6.16)
* GrowthForecast (>=0.62)

## Usage

### Install Yohoushi on localhost

Assume (You can configure at [attributes/default.rb](attributes/default.rb))

* Your username is `vagrant` and yohoushi will be installed to `/home/vagrant/yohoushi`
* Ruby is already installed on `/home/vagrant/.rbenv/versions/2.1.0/bin/ruby` with rbenv
* Mysql is already working on localhost:3306 with empty root password

Then, install yohoushi by

```bash
git clone https://github.com/yohoushi/chef-yohoushi ~/chef-yohoushi
cd ~/chef-yohoushi
bundle install
bundle exec knife solo cook localhost
```

and start yohoushi as

```bash
cd ~/yohoushi
rbenv local 2.1.0
bin/yohoushi
```

See [Yohoushi manual page](http://yohoushi.github.io/yohoushi/) for further details.

### Install Yohoushi to a remote host

Assume (You can configure at [attributes/default.rb](attributes/default.rb))

* Your username at remote host is `vagrant` and yohoushi will be installed to `/home/vagrant/yohoushi`
* Ruby is already installed on `/home/vagrant/.rbenv/versions/2.1.0/bin/ruby` with rbenv
* Mysql is already working on port 3306 with empty root password

Then, install by 

```bash
HOSTNAME="YOUR_REMOTE_HOSTNAME"
git clone https://github.com/yohoushi/chef-yohoushi ~/chef-yohoushi
cd ~/chef-yohoushi
bundle install
# bundle exec berks install --path cookbooks
cp nodes/localhost.json nodes/$HOSTNAME.json
bundle exec knife solo prepare $HOSTNAME
bundle exec knife solo cook $HOSTNAME
```

and start yohoushi as

```bash
ssh $HOSTNAME
ssh> cd ~/yohoushi
ssh> rbenv local 2.1.0
ssh> bin/yohoushi
```

See [Yohoushi manual page](http://yohoushi.github.io/yohoushi/) for further details.

### Use as a community cookbook

Use [Berkshelf](http://berkshelf.com/), and append below to your Berksfile

```
cookbook 'yohoushi', git: 'https://github.com/yohoushi/chef-yohoushi'
```

To run yohoushi recipe; add a run_list to your node.json

```
"run_list": [
  "yohoushi"
]
```

Attributes
----------

#### chef_yohoushi::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td>yohoushi/app/owner</tt></td>
    <td>String</td>
    <td>user name to own files</td>
    <td><tt>vagrant</tt></td>
  </tr>
  <tr>
    <td>yohoushi/app/group</tt></td>
    <td>String</td>
    <td>group name to own files</td>
    <td><tt>vagrant</tt></td>
  </tr>
  <tr>
    <td>yohoushi/app/path</tt></td>
    <td>String</td>
    <td>where the application is deployed to</td>
    <td><tt>/home/vagrant/yohoushi</tt></td>
  </tr>
  <tr>
    <td>yohoushi/ruby/ruby_path</tt></td>
    <td>String</td>
    <td>path to ruby command (is required >= 2.0.0) </td>
    <td><tt>/home/vagrant/.rbenv/versions/2.1.0/bin/ruby</tt></td>
  </tr>
  <tr>
    <td>yohoushi/ruby/gem_path</tt></td>
    <td>String</td>
    <td>path to gem command</td>
    <td><tt>/home/vagrant/.rbenv/versions/2.1.0/bin/gem</tt></td>
  </tr>
  <tr>
    <td>yohoushi/database/name</tt></td>
    <td>String</td>
    <td>Database name</td>
    <td><tt>yohoushi</tt></td>
  </tr>
  <tr>
    <td>yohoushi/database/root_password</tt></td>
    <td>String</td>
    <td>MySQL root user's password. This is required to create yohoushi database</td>
    <td><tt>nil (This param is required!)</tt></td>
  </tr>
  <tr>
    <td>yohoushi/database/username</tt></td>
    <td>String</td>
    <td>MySQL username to run yohoushi</td>
    <td><tt>yohoushi</tt></td>
  </tr>
  <tr>
    <td>yohoushi/database/password</tt></td>
    <td>String</td>
    <td>MySQL user's password to run yohoushi</td>
    <td><tt>yohoushi</tt></td>
  </tr>
  <tr>
    <td>yohoushi/database/host</tt></td>
    <td>String</td>
    <td>hostname of MySQL server</td>
    <td><tt>localhost</tt></td>
  </tr>
  <tr>
    <td>yohoushi/database/port</tt></td>
    <td>Integer</td>
    <td>port number of MySQL server</td>
    <td><tt>3306</tt></td>
  </tr>
</table>

ToDo
----

* Enable to install ruby, mysql, and GrowthForecast if users set `integration` option

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
License: MIT
Authors: Nobuhiro Nikushi, Naotoshi Seo
