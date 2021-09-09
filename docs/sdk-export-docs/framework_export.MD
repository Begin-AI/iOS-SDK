**TO CREATE THE FRAMEWORK**

1. go to the project folder from terminal:

2. cd "iOSWorkspace/Genbu/GenbuFramework/Genbu/" (write your own full path)

3. for generating iPhone Archive copy this to terminal:

```
xcodebuild archive \
-scheme Genbu \
-configuration Release \
-destination 'generic/platform=iOS' \
-archivePath './build/Genbu.framework-iphoneos.xcarchive' \
SKIP_INSTALL=NO \
BUILD_LIBRARIES_FOR_DISTRIBUTION=YES
```

4. for generating Simulator archive copy this to terminal:

```
xcodebuild archive \
-scheme Genbu \
-configuration Release \
-destination 'generic/platform=iOS Simulator' \
-archivePath './build/Genbu.framework-iphonesimulator.xcarchive' \
SKIP_INSTALL=NO \
BUILD_LIBRARIES_FOR_DISTRIBUTION=YES
```

5. generate the XCFramework, copy this to terminal:

```
xcodebuild -create-xcframework \
-framework './build/Genbu.framework-iphonesimulator.xcarchive/Products/Library/Frameworks/Genbu.framework' \
-framework './build/Genbu.framework-iphoneos.xcarchive/Products/Library/Frameworks/Genbu.framework' \
-output './build/Genbu.xcframework'
```

6. now you have the Genbu.xcframework package (folder)
