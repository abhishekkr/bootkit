#
# Cookbook Name:: development
# Recipe:: scm
#

node[:scm][:packages].each {|pkgname| package pkgname }

node[:scm][:helper_packages].each {|pkgname| package pkgname }
