**TO CREATE THE FRAMEWORK**

1. go to the project folder from terminal:

2. cd "iOSWorkspace/Begin/BeginFramework/Begin/" (write your own full path)

3. for generating iPhone Archive copy this to terminal:

```
xcodebuild archive \
-scheme Begin \
-configuration Release \
-destination 'generic/platform=iOS' \
-archivePath './build/Begin.framework-iphoneos.xcarchive' \
SKIP_INSTALL=NO \
BUILD_LIBRARIES_FOR_DISTRIBUTION=YES
```

4. for generating Simulator archive copy this to terminal:

```
xcodebuild archive \
-scheme Begin \
-configuration Release \
-destination 'generic/platform=iOS Simulator' \
-archivePath './build/Begin.framework-iphonesimulator.xcarchive' \
SKIP_INSTALL=NO \
BUILD_LIBRARIES_FOR_DISTRIBUTION=YES
```

5. generate the XCFramework, copy this to terminal:

```
xcodebuild -create-xcframework \
-framework './build/Begin.framework-iphonesimulator.xcarchive/Products/Library/Frameworks/Begin.framework' \
-framework './build/Begin.framework-iphoneos.xcarchive/Products/Library/Frameworks/Begin.framework' \
-output './build/Begin.xcframework'
```

6. now you have the Begin.xcframework package (folder)
