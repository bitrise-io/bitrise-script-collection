#!/bin/bash

# exit if a command fails
set -e

brew update
brew install mogenerator

echo
echo "==> Finished with success"
echo