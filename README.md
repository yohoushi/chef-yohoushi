# chef-yohoushi Cookbook

[Chef](http://www.getchef.com/chef/) cookbook for [Yohoushi](http://yohoushi.github.io/yohoushi/).

Create a database and a database user for yohoushi, and install yohoushi.

Requirements

## Cookbook dependencies

This cookbook depends on several OpsCode cookbooks, namely

* git
* database

## Middleware dependencies

This cookbook does not install the following packages, so please install them by other recipes.

* ruby (required >= 2.0.0)
* MySQL Server
* GrowthForecast

#### MySQL


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
    <td>yohoushi/app/path</tt></td>
    <td>String</td>
    <td>where the application is deployed to</td>
    <td><tt>/usr/local/yohoushi</tt></td>
  </tr>
  <tr>
    <td>yohoushi/ruby/ruby_path</tt></td>
    <td>String</td>
    <td>path to ruby command (is required >= 2.0.0) </td>
    <td><tt>/opt/rbenv/versions/2.1.0/bin/ruby</tt></td>
  </tr>
  <tr>
    <td>yohoushi/ruby/gem_path</tt></td>
    <td>String</td>
    <td>path to gem command</td>
    <td><tt>/opt/rbenv/versions/2.1.0/bin/gem</tt></td>
  </tr>
  <tr>
    <td>yohoushi/owner</tt></td>
    <td>String</td>
    <td>user name to own files and processes</td>
    <td><tt>yohoushi</tt></td>
  </tr>
  <tr>
    <td>yohoushi/group</tt></td>
    <td>String</td>
    <td>group name to own files and processes</td>
    <td><tt>yohoushi</tt></td>
  </tr>
  <tr>
    <td>yohoushi/packages</tt></td>
    <td>Array</td>
    <td>Additional packages to be installed before install yohoushi</td>
    <td><tt>mysql-devel</tt></td>
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

Usage
-----
#### yohoushi::default

1. Include `yohoushi` in your node's `run_list`
2. Set `yohoushi/database/root_password`

Example:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[yohoushi]"
  ],
  "yohoushi": {
    "database": { "root_password": "mypass" },
    "ruby": {
      "ruby_path": "/usr/local/ruby/bin/ruby",
      "gem_path": "/usr/local/ruby/bin/gem"
    }
  }
}
```

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
Authors: Nobuhiro Nikushi
