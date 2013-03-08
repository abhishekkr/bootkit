#
# Cookbook Name:: development
# Recipe:: perl
#

node[:perl][:packages].each{|perl| package perl }
