#
# Cookbook Name:: yumrepos
# Recipe:: rpmdev
#

node[:rpm][:packages].each{|rpm| package rpm }
