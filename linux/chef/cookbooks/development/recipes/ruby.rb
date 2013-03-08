#
# Cookbook Name:: development
# Recipe:: ruby
#

node[:ruby][:dependency_packages].each {|pkgname| package pkgname }

execute "get.rvm" do
  command "curl -L https://get.rvm.io | bash -s stable --ruby"
  not_if 'which rvm'
end

node[:ruby][:gems].each {|gemname| gem_package gemname }
