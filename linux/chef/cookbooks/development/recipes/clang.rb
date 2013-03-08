#
# Cookbook Name:: development
# Recipe:: clang
#

node[:clang][:packages].each{|clang| package clang }

node[:gcc][:packages].each{|gcc| package gcc }
