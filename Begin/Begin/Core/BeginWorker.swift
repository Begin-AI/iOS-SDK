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
    var userId = ""
    var objects : [String:[String]] = [:]
    
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
        self.userId = userId
        begin.setUserId(userId: userId)
        registerObject(objectName: "user", objectId: userId)
    }
    
    public func registerObject (objectName: String, objectId: String){
        if objects[objectName] != nil {
            objects[objectName]!.append(objectId)
        }
        else {
            var objList : [String] = []
            objList.append(objectId)
            objects[objectName] = objList
        }
    }
    
    public func updateUserTextField (key : String, value : String){
        if userId != "" {
            updateUserFeature(key: key, value: value)
        }
        else {
            Logg.i(text: "You need to register a user first")
        }
    }
    
    public func updateUserDateField (key : String, day: String, month: String, year : String) {
        if userId != "" {
            updateUserFeature(key: key, value: day+"-"+month+"-"+year)
        }
        else {
            Logg.i(text: "You need to register a user first")
        }
    }
    
    public func updateUserNumericalField (key : String, value : Int){
        if userId != "" {
            updateUserFeature(key: key, value: value)
        }
        else {
            Logg.i(text: "You need to register a user first")
        }
    }
    
    public func updateUserBooleanField (key : String, value : Bool){
        if userId != "" {
            updateUserFeature(key: key, value: value)
        }
        else {
            Logg.i(text: "You need to register a user first")
        }
    }
    
    public func updateLocationField (key : String, value : LocationModel){
        if userId != "" {
            updateUserFeature(key: key, value: value)
        }
        else {
            Logg.i(text: "You need to register a user first")
        }
    }
    
    func updateUserFeature (key : String, value : Any){
        if userId != "" {
            begin.updateUserFeatures(key: key, value: value)
        }
        else {
            Logg.i(text: "You need to register a user first")
        }
    }
    
    func isObjectAvailable (objectType : String, objectId : String) -> Bool {
        if objects[objectType] != nil {
            if objects[objectType]!.contains(objectId) {
                return true
            }
            Logg.i(text: "Object with id: '\(objectId)' for type: '\(objectType)' doesn't exist, you need to register object first.")
            return false
        }
        Logg.i(text: "Object with type: '\(objectType)' doesn't exist, you need to register object first.")
        return false
    }
    
    public func updateObjectTextField (objectType : String, objectId : String, key : String, value : String){
        if isObjectAvailable(objectType: objectType, objectId: objectId) {
            begin.updateObjectFeatures(objectType: objectType, objectId: objectId, key: key, value: value)
        }
    }
    
    public func updateObjectDateField (objectType : String, objectId : String, key : String, day: String, month: String, year : String){
        if isObjectAvailable(objectType: objectType, objectId: objectId) {
            begin.updateObjectFeatures(objectType: objectType, objectId: objectId, key: key, value: day+"-"+month+"-"+year)
        }
    }
    
    public func updateObjectNumericalField (objectType : String, objectId : String, key : String, value : Int){
        if isObjectAvailable(objectType: objectType, objectId: objectId) {
            begin.updateObjectFeatures(objectType: objectType, objectId: objectId, key: key, value: value)
        }
    }
    public func updateObjectBooleanField (objectType : String, objectId : String, key : String, value : Bool){
        if isObjectAvailable(objectType: objectType, objectId: objectId) {
            begin.updateObjectFeatures(objectType: objectType, objectId: objectId, key: key, value: value)
        }
    }
    
    public func registerInteraction (objectType : String, value : String, objectId : String){
        if isObjectAvailable(objectType: objectType, objectId: objectId) {
            begin.updateInteractions(objectType: objectType, objectId: objectId, value: value)
        }
    }
    
    public func addLabel (objectType : String, objectId : String, value : String){
        begin.addLabel(objectType: objectType, objectId: objectId, value: value)
    }
    
    public func logTest () -> String {
        return begin.logUserInfo()
    }
    
    public func learnFromData(){
        fetchDecide(shouldPost: true)
    }
    
    public func predictEngagement (projectId: String, objectId: String, userId: String, success: @escaping ((JSON) -> Void), failed: @escaping ((Any) -> Void)){
        let beginApi = BeginAPI.init(appId: appId, licenseKey: licenseKey)
        beginApi.predictEngagement(projectId: projectId, objectId: objectId, userId: userId, success: success, failed: failed)
    }
    
    public func recommend (projectId: String, userId: String, success: @escaping ((JSON) -> Void), failed: @escaping ((Any) -> Void)){
        let beginApi = BeginAPI.init(appId: appId, licenseKey: licenseKey)
        beginApi.recommend(projectId: projectId, userId: userId, success: success, failed: failed)
    }
    
    public func classify (projectId: String, id: String, success: @escaping ((JSON) -> Void), failed: @escaping ((Any) -> Void)){
        let beginApi = BeginAPI.init(appId: appId, licenseKey: licenseKey)
        beginApi.classify(projectId: projectId, id: id, success: success, failed: failed)
    }
    
    public func fakeDetect (projectId: String, userid: String, success: @escaping ((JSON) -> Void), failed: @escaping ((Any) -> Void)){
        let beginApi = BeginAPI.init(appId: appId, licenseKey: licenseKey)
        beginApi.fakeDetect(projectId: projectId, id: userid, success: success, failed: failed)
    }
    
    func fetchDecide(shouldPost : Bool){
        let beginApi = BeginAPI.init(appId: appId, licenseKey: licenseKey)
        beginApi.fetchInstructions(success:  { [self] (iparser) in
            Logg.d(text: "instructions \(iparser)")
            if shouldPost {
                self.begin.processInstructions(iParser: iparser)
            }
        }) { (message) in
        }
    }
    
    public func inference (){
        begin.inference()
    }
    
}
