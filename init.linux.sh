#!/bin/bash
##################################################
# making sure of TYPES
#
if [ -f /etc/redhat_version ]; then
  DISTROBASE='RedHat'
  BASE_PACKAGES='libyaml-devel libxml2-devel zlib-devel openssl'
  alias nix_package='sudo yum -y install'
elif [ -f /etc/debian_version ]; then
  DISTROBASE='Debian'
  BASE_PACKAGES='libyaml-dev libxml2-dev zlib1g-dev openssl'
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
nix_package update
nix_package install make gcc g++ libstdc++
nix_package install curl rsync wget git
nix_package install $BASE_PACKAGES

curl -L https://get.rvm.io | bash -s stable --ruby
rvmsudo gem install bundler --no-ri --no-rdoc
rvmsudo gem install rake --no-ri --no-rdoc

##################################################
# fetching git repo and submodules
#
git clone --recurse-submodules $BOOTKIT_GIT $BOOTKIT_TMP
cd $BOOTKIT_TUX
bundle install --path .bundle

##################################################
# preparing
#
rvm_be chef-solo -j $CHEF_CONFIG/solo.json -c $CHEF_CONFIG/solo.rb
