#!/bin/bash

# exit if a command fails
set -e

echo "==> Upgrading CocoaPods"
 
gem install cocoapods
pod setup

echo
echo "==> Finished with success"
echo