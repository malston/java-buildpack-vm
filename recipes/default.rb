#
# Cookbook Name:: java-buildpack-vm
# Recipe:: default
#

include_recipe 'chef-sugar::default'

include_recipe 'java'

include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"

rbenv_ruby "1.9.3-p547"

rbenv_gem "bundler" do
  ruby_version "1.9.3-p547"
end