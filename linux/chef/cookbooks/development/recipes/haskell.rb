#
# Cookbook Name:: development
# Recipe:: clang
#

node[:haskell][:packages].each{|haskell| package haskell }
