//
//  GenbuWorker.swift
//

import Foundation

public let EMPTY_NUMBER = 0.00012

public class GenbuWorker {
    
    var baseUrl = ""
    var appId = ""
    var secretKey = ""
    var gb : Genbu!
    
    public init (url : String, appId : String , secretKey : String) {
        self.baseUrl = url
        self.appId = appId
        self.secretKey = secretKey
        setPreference(key: APP_ID, value: appId)
        setPreference(key: SECRET_KEY, value: secretKey)
        gb = Genbu.init(url: url)
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
        return gb.logUserInfo()
    }
    
    public func updateFeature (key : String, value : Any){
        gb.updateFeatures(key: key, value: value)
    }
    
    public func fetchInstructions (){
        let genbuApi = GenbuAPI.init(url: baseUrl)
        genbuApi.fetchInstructions(success:  { [self] (instructions) in
            print("instructions \(instructions)")
            self.gb.processInstructions(instructions: instructions)
        }) { (message) in
            print ("failed \(message)")
        }
    }
    
    public func inference (){
        gb.inference()
    }
    
}
