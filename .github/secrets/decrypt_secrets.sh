#!/bin/sh
set -eo pipefail

gpg --quiet --batch --yes --decrypt --passphrase="$IOS_KEYS" --output ./.github/secrets/diceepp.mobileprovision ./.github/secrets/diceepp.mobileprovision.gpg
gpg --quiet --batch --yes --decrypt --passphrase="$IOS_KEYS" --output ./.github/secrets/CertificatesFDL.p12 ./.github/secrets/CertificatesFDL.p12.gpg

mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles

cp ./.github/secrets/diceepp.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/diceepp.mobileprovision


security create-keychain -p "" build.keychain
security import ./.github/secrets/CertificatesFDL.p12 -t agg -k ~/Library/Keychains/build.keychain -P "$IOS_KEYS" -A

security list-keychains -s ~/Library/Keychains/build.keychain
security default-keychain -s ~/Library/Keychains/build.keychain
security unlock-keychain -p "" ~/Library/Keychains/build.keychain
security set-keychain-settings
security list-keychains

security set-key-partition-list -S apple-tool:,apple: -s -k "" ~/Library/Keychains/build.keychain
