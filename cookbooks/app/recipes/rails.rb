app = "todo"

directory "/data/#{app}/shared/log" do
  recursive true
  owner "vagrant"
end

directory "/data/#{app}/shared/config" do
  recursive true
  owner "vagrant"
end

directory "/data/#{app}" do
  recursive true
  owner "vagrant"
end

directory "/var/run/#{app}" do
  recursive true
  owner "vagrant"
end

link "/data/#{app}/current" do
  to "/vagrant"
end

template "/etc/monit/conf.d/unicorn_#{app}.monitrc" do
  source "unicorn.monitrc.erb"
  variables :app => app, :user => "vagrant"
  notifies :restart, resources(:service => "monit"), :delayed
end

template "/data/#{app}/shared/config/unicorn_start.sh" do
  source "unicorn_start.sh.erb"
  variables :app => app, :environment => "development"
  mode 0755
end

template "/data/#{app}/shared/config/unicorn_stop.sh" do
  source "unicorn_stop.sh.erb"
  variables :app => app
  mode 0755
end

template "/data/#{app}/shared/config/unicorn.rb" do
  source "unicorn.rb.erb"
  owner "vagrant"
  variables :app => app
end

template "/etc/nginx/servers/#{app}.conf" do
  source "app.conf.erb"
  owner "vagrant"
  variables :app => app
  notifies :reload, resources(:service => "nginx"), :delayed
end

# needed by the pg gem
package "postgresql-server-dev-9.1" do
  action :install
end

template "/data/#{app}/current/config/database.yml" do
  source "database.yml.erb"
  variables :app => app, :environment => "development"
end
