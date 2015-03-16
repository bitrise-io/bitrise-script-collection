#!/bin/bash

#
# Don't forget to set the CONFIG_INFO_PLIST_PATH environment
#  in your Workflow, or replace it with your project's Info.plist path!
#

# exit if a command fails
set -e
# verbose / debug print commands
set -v


# ---------------------
# --- Configs:

CONFIG_project_info_plist_path="${CONFIG_INFO_PLIST_PATH}"
CONFIG_new_bundle_version="${BITRISE_BUILD_NUMBER}"


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
