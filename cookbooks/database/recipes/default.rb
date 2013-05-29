package "postgresql" do
  action :install
end

service "postgresql" do
  supports :reload => true, :start => true, :restart => true, :status => true
  action :start
end

template "/etc/postgresql/9.1/main/pg_hba.conf" do
  source "pg_hba.conf.erb"
  notifies :reload, resources(:service => "postgresql"), :immediate
end
