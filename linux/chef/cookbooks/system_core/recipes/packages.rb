#
# Cookbook Name:: system_core
# Recipe:: packages
#

include_recipe 'yumrepos'

node[:system_core][:packages][:shell].each do |pkg_name|
  package pkg_name
end

node[:system_core][:packages][:virtualization].each do |pkg_name|
  package pkg_name
end

node[:system_core][:packages][:gui].each do |pkg_name|
  package pkg_name
end

node[:system_core][:packages][:storage].each do |pkg_name|
  package pkg_name
end

node[:system_core][:packages][:security].each do |pkg_name|
  package pkg_name
end
