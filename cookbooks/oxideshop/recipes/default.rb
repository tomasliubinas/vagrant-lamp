#package "git-core" do
#  action :install
#end


directory node[:oxideshop][:dir] do
  owner "vagrant"
  mode "0755"
  action :create
end

directory "#{node[:oxideshop][:dir]}/log" do
  owner "vagrant"
  mode "0755"
  action :create
end
    
git "#{node[:oxideshop][:dir]}" do
  repository "#{node[:oxideshop][:src]}"
  action :sync
end   

bash "setup_oxideshop" do
  code <<-EOH
    mysql             -u#{node[:oxideshop][:mysql_username]} -p#{node[:oxideshop][:mysql_password]} -e "CREATE DATABASE oxideshop"
    mysql -Doxideshop -u#{node[:oxideshop][:mysql_username]} -p#{node[:oxideshop][:mysql_password]} <#{node[:oxideshop][:dir]}/source/setup/sql/database.sql
    mysql -Doxideshop -u#{node[:oxideshop][:mysql_username]} -p#{node[:oxideshop][:mysql_password]} <#{node[:oxideshop][:dir]}/source/setup/sql/demodata.sql
  EOH
  # creates "/usr/local/bin/redis-server"
end

template "config.inc.php" do
  path "#{node[:oxideshop][:dir]}/source/config.inc.php"
  source "config.inc.php.erb"
  owner "vagrant"
  group "vagrant"
  mode "0644"
#  notifies :restart
end

directory "#{node[:oxideshop][:dir]}/tmp" do
  mode 0755
  owner "vagrant"
  action :create
end