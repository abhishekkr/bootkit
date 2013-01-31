#!powershell -executionpolicy unrestricted -file 
##################################################
# base location ready
#

Set-Location "C:\"
New-Item -name "ABK" -type directory -Force
Set-Location "C:\ABK"

##################################################
# getting base set-up prepared
#

##################################################
# preparing
#
rvm_be chef-solo -j $CHEF_CONFIG/solo.json -c $CHEF_CONFIG/solo.rb
