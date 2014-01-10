#
# Cookbook Name:: yohoushi
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

if node[:yohoushi][:app][:name].split(" ").count > 1
  Chef::Application.fatal!("Application name must be one word long !")
end
include_recipe "git" # install git, no support for svn for now

# Install depended packages
node[:yohoushi][:packages].each do |pkg|
  package pkg do
    action :install
  end
end

# Install required gems
node[:yohoushi][:ruby][:gems].each do |pkg|
  execute "gem install #{pkg}" do
    command "#{node[:yohoushi][:ruby][:gem_path]} install #{pkg}"
  end
end

# create deploy user & group
user node[:yohoushi][:owner] do
  action :create
  supports manage_home => true
end
group node[:yohoushi][:group] do
  action :create
  members node[:yohoushi][:owner]
end
directory File.join('/','home',node[:yohoushi][:owner]) do
  owner node[:yohoushi][:owner]
  group node[:yohoushi][:group]
end

connection_info = {
    username: "root",
    password: node[:yohoushi][:database][:root_password],
    host: node[:yohoushi][:host],
    port: node[:yohoushi][:port],
  }

# Create database
include_recipe "database::mysql"
mysql_database node[:yohoushi][:database][:name] do
  connection connection_info
  action :create
end

# Create database user
mysql_database_user node[:yohoushi][:database][:username] do
  connection connection_info
  password node[:yohoushi][:database][:password]
  database_name node[:yohoushi][:database][:name]
  privileges [:all]
  action [:create, :grant]
end

# Deploy application
directory node[:yohoushi][:app][:path] do
  owner node[:yohoushi][:owner]
  group node[:yohoushi][:group]
end
git node[:yohoushi][:app][:path] do
  repository node[:yohoushi][:app][:repository]
  revision node[:yohoushi][:app][:revision]
  user node[:yohoushi][:owner]
  group node[:yohoushi][:group]
  action :sync
end

# Execute bundle install
execute "bin/bundle" do
  cwd node[:yohoushi][:app][:path]
  command "#{node[:yohoushi][:ruby][:ruby_path]} bin/bundle"
  user node[:yohoushi][:owner]
  group node[:yohoushi][:group]
end

# Prepare config/database.yml
template "config/database.yml" do
  path "#{node[:yohoushi][:app][:path]}/config/database.yml"
  source "database.yml.erb"
  owner node[:yohoushi][:owner]
  group node[:yohoushi][:group]
  mode 0644
end

# Database Migration
execute "bin/rake db:migrate" do
  cwd node[:yohoushi][:app][:path]
  command "#{node[:yohoushi][:ruby][:ruby_path]} bin/rake db:migrate"
  user node[:yohoushi][:owner]
  group node[:yohoushi][:group]
end

