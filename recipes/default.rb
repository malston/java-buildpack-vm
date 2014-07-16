#
# Cookbook Name:: java-buildpack-vm
# Recipe:: default
#
include_recipe 'build-essential'
include_recipe "git"
include_recipe 'java'
include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"

rbenv_ruby '1.9.3-p547' do
  global true
end

rbenv_gem "bundler"

git "/home/vagrant/java-buildpack" do
  repository "https://github.com/malston/java-buildpack.git"
  reference "offline_bundler_gems"
  #user "vagrant"
  #group "vagrant"
  action :checkout
end

execute "install_java_buildpack" do
  cwd "/home/vagrant/java-buildpack"
  command "/opt/rbenv/shims/bundle install --local && /opt/rbenv/shims/bundle exec rake package OFFLINE=true"
  action :run
end