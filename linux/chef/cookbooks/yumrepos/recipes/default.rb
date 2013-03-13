#
# Cookbook Name:: yumrepos
# Recipe:: rpmdev
#
#
# placing required yum-repos

include_recipe 'yumrepos::repos'
include_recipe 'yumrepos::rpmdev'
