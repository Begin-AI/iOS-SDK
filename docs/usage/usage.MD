**SDK USAGE**

1. At your ViewController
```
import Genbu
```
2. Create GenbuWorker variable
```
var genbuWorker : GenbuWorker!
```
3. initialise genbuWorker with url, appId and secretKey
```
genbuWorker = GenbuWorker.init(
    url: "https://your-api-url",
    appId: "your-app-id",
    secretKey: "your-secret-key")
```
4. use text, numerical and location features to set the user information
*Regular text*
```
genbuWorker.updateTextFeature(key: "userCurrentCountry", value: "United States")
```
*Empty text*
```
genbuWorker.updateTextFeature(key: "userCurrentCity", value: "")
```
*Regular number*
```
genbuWorker.updateNumericalFeature(key: "userGender", value: 0)
```
*Empty number (defined in SDK)*
```
genbuWorker.updateNumericalFeature(key: "userOnlyForFriendship", value: EMPTY_NUMBER)
```
*Location feature (add latitude/longitude)*
```
genbuWorker.updateLocationFeature(key: "userBirthLocation", value: LocationModel.init(latitude: 36.8507689, longitude: -76.2858726))
```
*Dates (used as text feature, dd-MM-yyyy format)*
```
genbuWorker.updateTextFeature(key: "userBirthDate", value: "09-12-1989")
```

5. After initalising GenbuWorker and setting the user information, to make a log test:
```
genbuWorker.logTest()
```

6. Fetch instructions from the API:
```
genbuWorker.fetchInstructions()
```

7. Use inference (you need to fetch instructions 1st)
```
genbuWorker.inference()
```
