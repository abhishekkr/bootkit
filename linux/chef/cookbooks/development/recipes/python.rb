#
# Cookbook Name:: development
# Recipe:: clang
#

node[:python][:packages].each{|py| package py }
