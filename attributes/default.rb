default[:yohoushi][:app][:owner] = "vagrant"
default[:yohoushi][:app][:group] = "vagrant"
default[:yohoushi][:app][:path]  = "/home/vagrant/yohoushi"
default[:yohoushi][:app][:environment] = "production"
default[:yohoushi][:app][:repository] = "https://github.com/yohoushi/yohoushi.git"
default[:yohoushi][:app][:revision] = "master"

default[:yohoushi][:ruby][:ruby_path] = "/home/vagrant/.rbenv/versions/2.1.0/bin/ruby"
default[:yohoushi][:ruby][:gem_path]  = "/home/vagrant/.rbenv/versions/2.1.0/bin/gem"

default[:yohoushi][:database][:adapter] = "mysql2" # only mysql2 is supported
default[:yohoushi][:database][:host] = "localhost"
default[:yohoushi][:database][:port] = 3306
default[:yohoushi][:database][:root_password] = nil # Set manually
default[:yohoushi][:database][:name] = "yohoushi"
default[:yohoushi][:database][:pool] = 5
default[:yohoushi][:database][:timeout] = 5000
default[:yohoushi][:database][:username] = "yohoushi"
default[:yohoushi][:database][:password] = "yohoushi"
