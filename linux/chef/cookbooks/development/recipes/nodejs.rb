#
# Cookbook Name:: development
# Recipe:: nodejs
#

execute "get.nodejs.nvm" do
  command "curl -skL -o /tmp/nvm_install.sh https://raw.github.com/creationix/nvm/master/install.sh ; sh /tmp/nvm_install.sh"
  not_if  "ls #{File.join ENV['HOME'], '.nvm', 'nvm.sh'}"
end
# uninstalling goes "rm -rf ~/.nvm"

template "/etc/profile.d/nvm.sh" do
  mode   0755
  action :create
end

execute "get-nodejs-nvm-0.8.22" do
  command "source #{ File.join ENV['HOME'], '.nvm', 'nvm.sh'} ; nvm install 0.8.22"
end
