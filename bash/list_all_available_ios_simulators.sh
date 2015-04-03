#!/bin/bash

# exit if a command fails
set -e
# verbose / debug print commands
set -v

echo
echo "--- List all available iOS Simulators"
xcrun simctl list
