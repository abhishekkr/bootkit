#
# Cookbook Name:: system_core
# Recipe:: packages
#

include_recipe 'yumrepos'

['tree', 'htop', 'vim', 'zsh'].each do |pkg_name|
  package pkg_name
end

['google-chrome-stable', 'xchat', 'pidgin', 'transmission'].each do |pkg_name|
  package pkg_name
end
