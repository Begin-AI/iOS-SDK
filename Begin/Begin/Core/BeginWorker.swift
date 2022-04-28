//
//  BeginWorker.swift
//

import Foundation

public let EMPTY_NUMBER = 0.00012

public class BeginWorker {
    
    static var beginWorker : BeginWorker!
    var appId = ""
    var licenseKey = ""
    var begin : Begin!
    var versionInt = 0
    var instructions: [String:[InstructionModel]]!
    
    public init (appId : String , licenseKey : String) {
        self.appId = appId
        self.licenseKey = licenseKey
        setPreference(key: APP_ID, value: appId)
        setPreference(key: SECRET_KEY, value: licenseKey)
        begin = Begin.init(appId: appId, licenseKey: licenseKey)
        BeginWorker.beginWorker = self
    }
    
    public class func shared () -> BeginWorker{
        return BeginWorker.beginWorker
    }
    
    public func registerUser (userId : String) {
        begin.setUserId(userId: userId)
    }
    
    public func registerObject (objectName: String, objectId: String){
        
    }
    
    public func updateUserTextField (key : String, value : String){
        updateUserFeature(key: key, value: value)
    }
    
    public func updateUserDateField (key : String, day: String, month: String, year : String) {
        updateUserFeature(key: key, value: day+"-"+month+"-"+year)
    }
    
    public func updateUserNumericalField (key : String, value : Int){
        updateUserFeature(key: key, value: value)
    }
    
    public func updateLocationField (key : String, value : LocationModel){
        updateUserFeature(key: key, value: value)
    }
    
    func updateUserFeature (key : String, value : Any){
        begin.updateUserFeatures(key: key, value: value)
    }
    
    public func updateObjectTextField (objectType : String, objectId : String, key : String, value : String){
        begin.updateObjectFeatures(objectType: objectType, objectId: objectId, key: key, value: value)
    }
    
    public func updateObjectDateField (objectType : String, objectId : String, key : String, day: String, month: String, year : String){
        begin.updateObjectFeatures(objectType: objectType, objectId: objectId, key: key, value: day+"-"+month+"-"+year)
    }
    
    public func updateObjectNumericalField (objectType : String, objectId : String, key : String, value : Int){
        begin.updateObjectFeatures(objectType: objectType, objectId: objectId, key: key, value: value)
    }
    
    public func registerInteraction (objectType : String, objectId : String, value : String){
        begin.updateInteractions(objectType: objectType, objectId: objectId, value: value)
    }
    
    public func logTest () -> String {
        return begin.logUserInfo()
    }
    
    public func learnFromData(){
        fetchDecide(shouldPost: true)
    }
    
    public func predictEngagement (projectId: String, objectId: String, userId: String){
        let beginApi = BeginAPI.init(appId: appId, licenseKey: licenseKey)
        beginApi.predictEngagement(projectId: projectId, objectId: objectId, userId: userId, success:  { [self] (result) in
            Logg.i(text: "Predict Engagement Result: \(result.result.results)")
        }) { (message) in
        }
    }
    
    func fetchDecide(shouldPost : Bool){
        let beginApi = BeginAPI.init(appId: appId, licenseKey: licenseKey)
        beginApi.fetchInstructions(success:  { [self] (instructions) in
            Logg.d(text: "instructions \(instructions)")
            self.instructions = instructions
            if shouldPost {
                self.begin.processInstructions(instructions: instructions)
            }
        }) { (message) in
        }
    }
    
    public func inference (){
        begin.inference()
    }
    
}
