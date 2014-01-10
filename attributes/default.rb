default[:yohoushi][:app][:name] = "yohoushi"
default[:yohoushi][:app][:path] = "/usr/local/#{node[:yohoushi][:app][:name]}"
default[:yohoushi][:app][:environment] = "production"
default[:yohoushi][:app][:repository] = "https://github.com/yohoushi/yohoushi.git"
default[:yohoushi][:app][:revision] = "master"

default[:yohoushi][:ruby][:ruby_path]  = "/opt/rbenv/versions/2.1.0/bin/ruby"
default[:yohoushi][:ruby][:gem_path]  = "/opt/rbenv/versions/2.1.0/bin/gem"
default[:yohoushi][:ruby][:gems] = ["bundle"]

default[:yohoushi][:owner] = "yohoushi"
default[:yohoushi][:group] = "yohoushi"
default[:yohoushi][:packages] = [ "mysql-devel" ]

default[:yohoushi][:database][:adapter] = "mysql2" # only mysql2 is supported
default[:yohoushi][:database][:name] = node[:yohoushi][:app][:name]
default[:yohoushi][:database][:pool] = 5
default[:yohoushi][:database][:timeout] = 5000
default[:yohoushi][:database][:root_password] = nil # Set manually
default[:yohoushi][:database][:username] = node[:yohoushi][:app][:name]
default[:yohoushi][:database][:password] = node[:yohoushi][:app][:name]
default[:yohoushi][:database][:host] = "localhost"
default[:yohoushi][:database][:port] = 3306


