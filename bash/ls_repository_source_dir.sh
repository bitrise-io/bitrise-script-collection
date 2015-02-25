#!/bin/bash

# exit if a command fails
set -e

echo "---- Source Dir content:"
ls -alh "${BITRISE_SOURCE_DIR}"
echo "-------------------------"

echo
echo "==> Finished with success"
echo