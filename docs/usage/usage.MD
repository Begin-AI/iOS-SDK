**IMPORT THE FRAMEWORK**

1. Create a new project from Xcode
2. Go to project folder from finder. Copy Begin.xcframework folder to the project folder

*At Xcode:*
1. right click to Frameworks folder -> add Files to project -> Begin.xcframework
2. click to project file -> select Target
3. Frameworks, Libraries and Embedded Content -> press + button and select Begin.xcframework
4. clean and build your project
5. at your Viewcontroller, "import Begin" and start using the SDK

**SDK USAGE**

1. At your ViewController
```
import Begin
```
2. initialise genbuWorker with url, appId and secretKey
```
let beginWorker = BeginWorker.init(
    url: "https://your-api-url",
    appId: "your-app-id",
    secretKey: "your-secret-key")
```
3. use text, numerical and location features to set the user information
*Regular text*
```
beginWorker.updateTextFeature(key: "userCurrentCountry", value: "United States")
```
*Empty text*
```
beginWorker.updateTextFeature(key: "userCurrentCity", value: "")
```
*Regular number*
```
beginWorker.updateNumericalFeature(key: "userGender", value: 0)
```
*Empty number (defined in SDK)*
```
beginWorker.updateNumericalFeature(key: "userOnlyForFriendship", value: EMPTY_NUMBER)
```
*Location feature (add latitude/longitude)*
```
beginWorker.updateLocationFeature(key: "userBirthLocation", value: LocationModel.init(latitude: 36.8507689, longitude: -76.2858726))
```
*Dates (used as text feature, dd-MM-yyyy format)*
```
beginWorker.updateTextFeature(key: "userBirthDate", value: "09-12-1989")
```

4. After initalising GenbuWorker and setting the user information, to make a log test:
```
beginWorker.logTest()
```

5. Fetch instructions from the API:
```
beginWorker.fetchInstructions()
```

6. Use inference (you need to fetch instructions 1st)
```
beginWorker.inference()
```
