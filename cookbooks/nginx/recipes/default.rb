package "nginx" do
  action :install
end

service "nginx" do
  supports :reload => true, :start => true, :restart => true, :status => true
  action :start
end

template "/etc/nginx/nginx.conf" do
  source "nginx.conf.erb"
  owner "vagrant"
  notifies :reload, resources(:service => "nginx"), :delayed
end

directory "/etc/nginx/servers" do
  recursive true
  owner "vagrant"
end
