#!/bin/sh

gpg --quiet --batch --yes --decrypt --passphrase="$PROVISIONING_PASSWORD" --output provisioning/Certificates.p12 provisioning/Certificates.p12.gpg

mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles
# cp provisioning/*.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/

security create-keychain -p "" build.keychain
security import provisioning/Certificates.p12 -t agg -k ~/Library/Keychains/build.keychain -P "$PROVISIONING_PASSWORD" -A
security list-keychains -s ~/Library/Keychains/build.keychain
security default-keychain -s ~/Library/Keychains/build.keychain
security unlock-keychain -p "" ~/Library/Keychains/build.keychain
security set-key-partition-list -S apple-tool:,apple: -s -k "" ~/Library/Keychains/build.keychain