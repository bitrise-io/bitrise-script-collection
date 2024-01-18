#!/usr/bin/env bash
# fail if any commands fails
set -e
# make pipelines' return status equal the last command to exit with a non-zero status, or zero if all commands exit successfully
set -o pipefail
# debug log
set -x

# This script will re-trigger the same pipeline it was running in.
# Useful if you want to keep re-building a pipeline, until it fails or to generate lot of test builds.

export PIPELINE_TO_TRIGGER="$BITRISEIO_PIPELINE_TITLE"
curl --fail https://app.bitrise.io/app/$BITRISE_APP_SLUG/build/start.json -L --data '{"build_params":{"branch":"'"$BITRISE_GIT_BRANCH"'","commit_message":"'"$BITRISE_GIT_MESSAGE"'","pipeline_id":"'"$PIPELINE_TO_TRIGGER"'"},"hook_info":{"build_trigger_token":"'"$BUILD_TRIGGER_TOKEN"'","type":"bitrise"},"triggered_by":"curl"}'
