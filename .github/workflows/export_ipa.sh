#!/bin/bash

set -eo pipefail

xcodebuild -archivePath $ARTIFACT_DIR/Dicee-iOS13.xcarchive \
            -exportOptionsPlist exportOptions.plist \
            -exportPath $ARTIFACT_DIR \
            -allowProvisioningUpdates \
            "OTHER_CODE_SIGN_FLAGS=--keychain '/Users/runner/Library/Keychains/build.keychain-db'" \
            -exportArchive | xcpretty
