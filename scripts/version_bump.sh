#!/bin/bash

set -ex

# cd Hotstar

echo "incrementing the build version"
infoPlistFile="/Users/abhishekkumar/Documents/Github/Hotstar/Frontend/Hotstar/Hotstar/Info.plist"
marketVersion=$(/usr/libexec/PlistBuddy -c "Print CFBundleShortVersionString" "$infoPlistFile")
buildNum=$(/usr/libexec/PlistBuddy -c "Print CFBundleVersion" "$infoPlistFile")
new_version=$(($buildNum + 1))
xcrun agvtool new-version -all "$new_version"
echo "build version incremented"
echo "====="

# echo "archive started"
# xcodebuild -workspace HSConfigurator.xcworkspace \
#     -scheme HSConfigurator clean archive \
#     -configuration ReleaseIN \
#     -sdk iphoneos \
#     -archivePath HSConfigurator.xcarchive
# echo "archive successful"
# echo "====="

# echo "export started"
# xcodebuild \
#     -verbose \
#     -exportArchive -allowProvisioningUpdates \
#     -archivePath  HSConfigurator.xcarchive \
#     -exportOptionsPlist "Scripts/SupportingFiles/ExportOptionsIN.plist" \
#     -exportPath  temp/HSConfigurator
# echo "export successful"
# echo "====="

cd ..