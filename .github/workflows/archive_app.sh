#!/bin/bash

set -eo pipefail

pod install

xcodebuild -workspace Dicee-iOS13.xcworkspace \
            -scheme Dicee-iOS13 \
            -configuration Release \
            -sdk iphoneos \
            -archivePath $ARTIFACT_DIR/Dicee-iOS13.xcarchive \
            "OTHER_CODE_SIGN_FLAGS=--keychain '/Users/runner/Library/Keychains/build.keychain-db'" \
            clean archive | xcpretty
