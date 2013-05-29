package "monit" do
  action :install
end

service "monit" do
  action :start
end

template "/etc/monit/monitrc" do
  source "monitrc.erb"
  notifies :restart, resources(:service => "monit"), :delayed
end
