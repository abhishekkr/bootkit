#!/bin/bash

# on a minimal system need to add user before it
##### make me sudoer
su -c "usermod -a -G wheel $USER"
su -c "sed -i -r 's/^#.*%wheel.*\(ALL\)[ \t]*ALL$/%wheel\ \ \ \ \ \ \ \ ALL\=\(ALL\)\ \ \ \ \ \ \ ALL/' /etc/sudoers"

##################################################
# making sure of TYPES

if [ -f /etc/redhat-release ]; then
  sudo wget -c -O /etc/yum.repos.d/epel.repo https://raw.github.com/abhishekkr/bootkit/master/linux/chef/cookbooks/yumrepos/files/centos/epel.repo
  sudo yum clean all
  export DISTROBASE='RedHat'
  export BASE_PACKAGES='libyaml-devel libxml2-devel zlib-devel openssl make gcc gcc-c++ kernel-headers kernel-devel openssl-devel openssl-static libffi libffi-devel'
  export nix_package='sudo yum -y install'
elif [ -f /etc/debian_version ]; then
  export DISTROBASE='Debian'
  export BASE_PACKAGES='libyaml-dev libxml2-dev zlib1g-dev openssl make gcc g++ libssl-dev libffi libffi-dev'
  export nix_package='sudo apt-get -y install'
fi

export BOOTKIT_GIT='git://github.com/abhishekkr/bootkit.git'
export BOOTKIT_TMP='/tmp/bootkit'
export BOOTKIT_TUX=$BOOTKIT_TMP'/linux'
export CHEF_CONFIG=$BOOTKIT_TUX'/chef/config'
echo 'insecure' > ~/.curlrc

##################################################
# getting base set-up prepared
#
$nix_package install curl rsync wget git
$nix_package install $BASE_PACKAGES

export RVM_DIR='/usr/local/rvm'
export SOURCE_RVM="source $RVM_DIR/scripts/rvm"
if [ ! -f "$RVM_DIR/bin/rvm" ]; then
  curl -L https://get.rvm.io | sudo bash -s stable --ruby
  sudo usermod -a -G rvm $USER
  sudo chmod -R g+w $RVM_DIR
  echo "export rvm_auto_reload_flag=1" | sudo tee $HOME/.rvmrc
  echo "export rvmsudo_secure_path=1" | sudo tee /etc/profile.d/rvm.sh
  echo $SOURCE_RVM | sudo tee /etc/profile.d/rvm.sh
  rvm requirements run
fi
export rvm_auto_reload_flag=1
export rvmsudo_secure_path=1
$SOURCE_RVM
rvmsudo rvm install ruby-1.9.3-p392
rvm ruby-1.9.3-p392 --default
rvm gemset create
rvmsudo gem install bundler --no-ri --no-rdoc
rvmsudo gem install rake --no-ri --no-rdoc
sudo chown -R $USER $RVM_DIR

##################################################
# fetching git repo and submodules
#
echo "fetching git repo and submodules..."
if [ ! -f $BOOTKIT_GIT ]; then
  echo 'cloning bootkit...'
  git clone --recursive $BOOTKIT_GIT $BOOTKIT_TMP
fi
cd $BOOTKIT_TUX
git checkout .
git pull
bundle install

##################################################
# preparing
#
rvmsudo USER=$USER HOME=$HOME chef-solo -j $CHEF_CONFIG/solo.json -c $CHEF_CONFIG/solo.rb
gem install vagrant --no-ri --no-rdoc
