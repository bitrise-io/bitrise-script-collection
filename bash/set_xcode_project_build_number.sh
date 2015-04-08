#!/bin/bash

#
# Don't forget to set the CONFIG_INFO_PLIST_PATH environment
#  in your Workflow, or replace it with your project's Info.plist path!
# Or put this script into the same directory which contains your Info.plist file
#

THIS_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# exit if a command fails
set -e
# verbose / debug print commands
set -v


# ---------------------
# --- Configs:

# [!] Choose one from these!
# if you want to set the Plist path yourself
CONFIG_project_info_plist_path="${CONFIG_INFO_PLIST_PATH}"
# if you put this script into the same directory as the Info.plist file
CONFIG_project_info_plist_path="${THIS_SCRIPT_DIR}/Info.plist"

CONFIG_new_bundle_version="${BITRISE_BUILD_NUMBER}"

echo " (i) Info.plist path: ${CONFIG_project_info_plist_path}"
echo " (i) Build number (bundle version): ${CONFIG_new_bundle_version}"


# ---------------------
# --- Main:

echo "---- Current Bundle Version:"
/usr/libexec/PlistBuddy -c "Print CFBundleVersion" "${CONFIG_project_info_plist_path}"

echo "---- Set Bundle Version:"
echo " * to: ${CONFIG_new_bundle_version}"
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion ${CONFIG_new_bundle_version}" "${CONFIG_project_info_plist_path}"

echo "-------------------------"

echo
echo "==> Finished with success"
echo
