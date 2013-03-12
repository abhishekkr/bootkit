#
# Cookbook Name:: development
# Recipe:: ruby
#

node[:ruby][:dependency_packages].each {|pkgname| package pkgname }

execute "get.rvm" do
  command "curl -L https://get.rvm.io | bash -s stable --ruby"
  user    ENV['USER']
  not_if 'which rvm'
end
