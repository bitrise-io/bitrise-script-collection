#!/bin/bash

#
# This script will uninstall every installed version of the CocoaPods gem
#  and then install a specified version of it
#

set -v
set -e

echo "=> Current CocoaPods version:"
pod --version

echo "=> Uninstalling CocoaPods..."
# uninstall --all versions of the gem
gem uninstall cocoapods -a

echo "=> Install a specific version of CocoaPods..."
# install the --version you want to
gem install cocoapods -v 0.36.4
# pod setup: this is CocoaPods specific, for other gems you probably don't need any setup
pod setup

echo "=> New CocoaPods version:"
pod --version
