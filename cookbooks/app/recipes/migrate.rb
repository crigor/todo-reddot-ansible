app = "todo"
execute "create-db-migrate" do
  command "bundle exec rake db:create db:migrate"
  cwd "/data/#{app}/current"
  only_if { File.exists?("/data/#{app}/current/Rakefile") }
end
