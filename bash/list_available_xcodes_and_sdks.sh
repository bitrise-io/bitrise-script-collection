#!/bin/bash

# exit if a command fails
set -e

FILES="/Applications/Xcodes/Xcode*.app"
for f in $FILES
do
    echo "--------------"
    echo "Switching to Xcode at: ${f}"
    xcode_switch_arg="${f}/Contents/Developer"
    sudo xcode-select --switch "${xcode_switch_arg}"
    echo " Version info:"
    xcodebuild -version
    echo " SDKs:"
    xcodebuild -showsdks
    echo "--------------"
done

echo
echo "==> Finished with success"
echo