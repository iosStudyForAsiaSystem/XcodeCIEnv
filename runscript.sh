
#!/bin/sh/

target="facebookLinkSample"
provisining="com.futurelinegen developer"

#xcodebuild -scheme ${target} clean archive -archivePath build/${target}

#xcodebuild -exportArchive -exportFormat ipa -archivePath "build/${target}.xcarchive" -exportPath "build/${target}.ipa" -exportProvisioningProfile ${provisining}  
xcodebuild -exportArchive  -archivePath "build/${target}.xcarchive" -exportPath "build/${target}.ipa" -exportOptionsPlist exportOptions.plist 
