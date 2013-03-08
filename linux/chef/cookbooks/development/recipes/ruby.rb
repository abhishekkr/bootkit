#
# Cookbook Name:: development
# Recipe:: ruby
#

execute "get.rvm" do
  command "curl -L https://get.rvm.io | bash -s stable --ruby"
  user node[:user]
  not_if 'which rvm'
end

node[:gems].each {|gemname| gem_package gemname }
