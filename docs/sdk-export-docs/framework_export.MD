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


**CLIENT (DEVELOPER) SIDE ACTIONS TO IMPORT THE FRAMEWORK**

1. Create a new project from Xcode
2. Go to project folder from finder. Copy Genbu.xcframework folder to the project folder

*At Xcode:*
1. right click to Frameworks folder -> add Files to project -> Genbu.xcframework
2. click to project file -> select Target
3. Frameworks, Libraries and Embedded Content -> press + button and select Genbu.xcframework
4. clean and build your project
5. at your Viewcontroller, "import Genbu" and start using the SDK
