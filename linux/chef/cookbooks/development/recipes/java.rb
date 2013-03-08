#
# Cookbook Name:: development
# Recipe:: java
#

node[:java][:packages].each{|java| package java }
