#
# Cookbook Name:: development
# Recipe:: devtools
#

node[:devtools][:packages].each{|util| package util }
