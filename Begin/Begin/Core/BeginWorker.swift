//
//  BeginWorker.swift
//

import Foundation

public let EMPTY_NUMBER = 0.00012

public class BeginWorker {
    
    var baseUrl = ""
    var appId = ""
    var secretKey = ""
    var begin : Begin!
    
    public init (url : String, appId : String , secretKey : String) {
        self.baseUrl = url
        self.appId = appId
        self.secretKey = secretKey
        setPreference(key: APP_ID, value: appId)
        setPreference(key: SECRET_KEY, value: secretKey)
        begin = Begin.init(url: url)
    }
    
    public func updateTextFeature (key : String, value : String){
        updateFeature(key: key, value: value)
    }
    
    public func updateNumericalFeature (key : String, value : Int){
        updateFeature(key: key, value: value)
    }
    
    public func updateNumericalFeature (key : String, value : Double){
        updateFeature(key: key, value: value)
    }
    
    public func updateLocationFeature (key : String, value : LocationModel){
        updateFeature(key: key, value: value)
    }
    
    public func logTest () -> String {
        return begin.logUserInfo()
    }
    
    public func updateFeature (key : String, value : Any){
        begin.updateFeatures(key: key, value: value)
    }
    
    public func fetchInstructions (){
        let beginApi = BeginAPI.init(url: baseUrl)
        beginApi.fetchInstructions(success:  { [self] (instructions) in
            print("instructions \(instructions)")
            self.begin.processInstructions(instructions: instructions)
        }) { (message) in
            print ("failed \(message)")
        }
    }
    
    public func inference (){
        begin.inference()
    }
    
}
