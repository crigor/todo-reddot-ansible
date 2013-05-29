execute "install-bundler" do
  command "sudo gem install bundler"
  not_if { File.exists?("/usr/bin/bundle") }
end

app = "todo"
execute "bundle" do
  command "bundle install"
  environment 'BUNDLE_GEMFILE' => "/data/#{app}/current/Gemfile"
  only_if { File.exists?("/data/#{app}/current/Gemfile") }
end
