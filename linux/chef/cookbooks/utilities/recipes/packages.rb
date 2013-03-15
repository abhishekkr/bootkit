#
# Cookbook Name:: utilities
# Recipe:: packages
# all the packae installation
#

node[:utilities][:packages][:browser].each do |pkg|
  package pkg
end

node[:utilities][:packages][:communicate].each do |pkg|
  package pkg
end

node[:utilities][:packages][:remote].each do |pkg|
  package pkg
end

node[:utilities][:packages][:service].each do |pkg|
  package pkg
end

node[:utilities][:packages][:entertainment].each do |pkg|
  package pkg
end

node[:utilities][:packages][:media].each do |pkg|
  package pkg
end

node[:utilities][:packages][:toolbox].each do |pkg|
  package pkg
end
