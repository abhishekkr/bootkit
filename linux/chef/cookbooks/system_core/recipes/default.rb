#
# Cookbook Name:: system_core
# Recipe:: default
#

['vim', 'zsh'].each do |pkg_name|
  package pkg_name
end
