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
gem uninstall cocoapods -a

echo "=> Install a specific version of CocoaPods..."
gem install cocoapods -v 0.36.4

echo "=> New CocoaPods version:"
pod --version
