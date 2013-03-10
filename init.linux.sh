#!/bin/bash

# on a minimal system need to add user before it
##### make me sudoer
su -c "usermod -a -G wheel $USER"
su -c "sed -i -r 's/^#.*%wheel.*\(ALL\)[ \t]*ALL$/%wheel\ \ \ \ \ \ \ \ ALL\=\(ALL\)\ \ \ \ \ \ \ ALL/' /etc/sudoers"

##################################################
# making sure of TYPES

if [ -f /etc/redhat_version ]; then
  DISTROBASE='RedHat'
  BASE_PACKAGES='libyaml-devel libxml2-devel zlib-devel openssl make gcc gcc-c++ kernel-headers kernel-devel'
  alias nix_package='sudo yum -y install'
elif [ -f /etc/debian_version ]; then
  DISTROBASE='Debian'
  BASE_PACKAGES='libyaml-dev libxml2-dev zlib1g-dev openssl make gcc g++'
  alias nix_package='sudo apt-get -y install'
fi
export $DISTROBASE

BOOTKIT_GIT='git://github.com/abhishekkr/bootkit.git'
BOOTKIT_TMP='/tmp/bootkit'
BOOTKIT_TUX=$BOOTKIT_TMP'/linux'
CHEF_CONFIG=$BOOTKIT_TUX'/chef/config'
alias rvm_be='rvmsudo bundle exec'

##################################################
# getting base set-up prepared
#
nix_package install curl rsync wget git
nix_package install $BASE_PACKAGES

curl -sL https://get.rvm.io | sudo bash -s stable --ruby
echo 'export rvmsudo_secure_path=1' >> /etc/profile.d/rvm.sh
echo 'source ~/.rvm/scripts/rvm' >> /etc/profile.d/rvm.sh
export rvmsudo_secure_path=1
source ~/.rvm/scripts/rvm
rvm requirements run
rvm gemset create
rvmsudo gem install bundler --no-ri --no-rdoc
rvmsudo gem install rake --no-ri --no-rdoc

##################################################
# fetching git repo and submodules
#
git clone --recurse-submodules $BOOTKIT_GIT $BOOTKIT_TMP
cd $BOOTKIT_TUX
bundle install

##################################################
# preparing
#
rvmsudo USER=$USER HOME=$HOME chef-solo -j $CHEF_CONFIG/solo.json -c $CHEF_CONFIG/solo.rb
