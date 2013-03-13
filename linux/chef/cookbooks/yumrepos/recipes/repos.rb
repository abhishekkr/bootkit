#
# Cookbook Name:: yumrepos
# Recipe:: repos
#
#
# placing required yum-repos-locations

node[:yumrepos][:repos].each do |repo|
  cookbook_file "/etc/yum.repos.d/#{repo}" do
    source "#{repo}"
    mode 00644
  end
end
