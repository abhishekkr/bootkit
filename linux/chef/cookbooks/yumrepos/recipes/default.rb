#
# Cookbook Name:: yumrepos
# Recipe:: rpmdev
#
#
# placing required yum-repos
[ 'adobe-linux-x86_64.repo',
'epel.repo',
'google-chrome.repo',
'google.repo',
'google-talkplugin.repo',
'virtualbox.repo',
'yum-my.repo' ].each do |repo|
  cookbook_file "/etc/yum.repos.d/#{repo}" do
    source "#{repo}"
    mode 00644
  end
end

include_recipe 'yumrepos::rpmdev'
