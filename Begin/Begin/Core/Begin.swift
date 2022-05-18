//
//  Begin.swift
//

import Foundation

class Begin {
    
    var embeddingObject: [String: Any] = [:]
    var userFeatures : [String : Any] = [:]
    var embeddedList : [Double] = []
    var objectList : [ObjectModel] = []
    var interactionList : [ObjectModel] = []
    var labels : [LabelModel] = []
    let ERR_NUMBER = 0.00011
    let EMPTY_NUMBER = 0.00012
    let CONTINUE_NUMBER = -1337.37
    
    var parsedLabels : [String:[String]] = [:]
    var userId : String = ""
    var appId = ""
    var licenseKey = ""
    
    init (appId : String , licenseKey : String) {
        self.appId = appId
        self.licenseKey = licenseKey
    }
    
    func updateUserFeatures (key : String, value : Any){
        userFeatures[key] = value
    }
    
    func contains (objectName: String, list : [ObjectModel]) -> Int {
        for i in 0..<list.count {
            if list[i].objectName == objectName {
                return i
            }
        }
        return -100
    }
    
    func updateObjectFeatures (objectType : String, objectId : String, key : String, value : Any){
        var index = contains(objectName: objectType, list: objectList)
        if index == -100 {
            let model = ObjectModel.init(objectName: objectType)
            objectList.append(model)
            index = objectList.count - 1
        }
        let objectModel = objectList[index]
        if objectModel.objectMap[objectId] != nil{
            objectModel.objectMap[objectId]![key] = value
        }
        else {
            var map = [String : Any]()
            map[key] = value
            objectModel.objectMap[objectId] = map
        }
    }
    
    func containsInteractions (id: String, list : [InteractionModel]) -> Int {
        for i in 0..<list.count {
            if list[i].id == id {
                return i
            }
        }
        return -100
    }
    
    func updateInteractions (objectType : String, objectId : String, value : String){
        var index = contains(objectName: objectType, list: interactionList)
        if index == -100 {
            let model = ObjectModel.init(objectName: objectType)
            interactionList.append(model)
            index = interactionList.count - 1
        }
        let objectModel = interactionList[index]
        var interactionIndex = containsInteractions(id: objectId, list: objectModel.interactionList)
        if interactionIndex == -100 {
            let iModel = InteractionModel.init(id: objectId)
            iModel.actions.insert(value)
            objectModel.interactionList.append(iModel)
        }
        else {
            let iModel = objectModel.interactionList[interactionIndex]
            iModel.actions.insert(value)
        }
    }
    
    func containsLabels (objectName: String) -> Int {
        for i in 0..<labels.count {
            if labels[i].objectName == objectName {
                return i
            }
        }
        return -100
    }
    
    func addLabel (objectType : String, objectId : String, value : String){
        var index = containsLabels(objectName: objectType)
        if index == -100 {
            let model = LabelModel.init(objectName: objectType)
            labels.append(model)
            index = labels.count - 1
        }
        let labelModel = labels[index]
        if labelModel.objectMap[objectId] != nil {
            if !labelModel.objectMap[objectId]!.contains(value) {
                labelModel.objectMap[objectId]!.append(value)
            }
        }
        else {
            var list : [String] = []
            list.append(value)
            labelModel.objectMap[objectId] = list
        }
    }
    
    func logUserInfo () -> String {
        Logg.i(text: "\(userFeatures as AnyObject)")
        return "\(userFeatures as AnyObject)"
    }
    
    public func setUserId (userId : String) {
        self.userId = userId
    }

    func processInstructions (iParser : InstructionParser){
        self.parsedLabels = iParser.labels
        embeddedList.removeAll()
        for inst in iParser.instructions {
            if inst.key == "user" {
                processUser(model: inst.value)
            }
            else if inst.key == "interactions" {
                processInteractions(interactions: inst.value)
            }
            else{
                processObject(model: inst.value, modelName: inst.key)
            }
        }
        var finalObject: [String: Any] = [:]
        finalObject["embeddings"] = embeddingObject
        finalObject["version_number"] = getIntPreference(key: FETCH_VERSION)
        Logg.d(text: "embeddingObject: \(finalObject)")
        postInstructions(finalObject: finalObject)
    }
    
    func processUser (model : [InstructionModel]){
        let beginProcessor = BeginProcessor.init(features: userFeatures)
        let userEmbedList = beginProcessor.processInstructions(instructions: model)
        var innerobject: [String: Any] = [:]
        var labelList : [String] = []
        let index = containsLabels(objectName: "user")
        if index != -100 {
            let labelModel = labels[index]
            for objectMap in labelModel.objectMap {
                let objkey = objectMap.key
                let object = objectMap.value
                if parsedLabels["user"] != nil {
                    let pList = parsedLabels["user"]
                    if objkey == userId {
                        for lbl in object {
                            if pList!.contains(lbl) {
                                labelList.append(lbl)
                            }
                        }
                    }
                }
            }
        }
        var userObject: [String: Any] = [:]
        userObject["labels"] = labelList
        userObject["embedding"] = userEmbedList
        innerobject[userId] = userObject
        embeddingObject["user"] = innerobject
    }
    
    func processObject (model : [InstructionModel], modelName : String){
        for objectModel in objectList {
            if objectModel.objectName == modelName {
                var innerobject: [String: Any] = [:]
                for objectMap in objectModel.objectMap {
                    let objkey = objectMap.key
                    let object = objectMap.value
                    let beginProcessor = BeginProcessor.init(features: object)
                    let objectEmbeddingList = beginProcessor.processInstructions(instructions: model)
                    innerobject[objkey] = objectEmbeddingList
                    var labelList : [String] = []
                    let index = containsLabels(objectName: objectModel.objectName)
                    if index != -100 {
                        let labelModel = labels[index]
                        for objectMapInner in labelModel.objectMap {
                            let okey = objectMapInner.key
                            let oct = objectMapInner.value
                            if parsedLabels[objectModel.objectName] != nil {
                                let pList = parsedLabels[objectModel.objectName]
                                if okey == objkey {
                                    for lbl in oct {
                                        if pList!.contains(lbl) {
                                            labelList.append(lbl)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    var builtObject: [String: Any] = [:]
                    builtObject["labels"] = labelList
                    builtObject["embedding"] = objectEmbeddingList
                    innerobject[objkey] = builtObject
                }
                embeddingObject[objectModel.objectName] = innerobject
            }            
        }
    }
    
    func processInteractions (interactions : [InstructionModel]){
        var outerObject: [String: Any] = [:]
        var middleObject: [String: Any] = [:]
        for istr in interactions {
            var keyValueList = [InteractionModel]()
            if let map = istr.params?.sequenceMap {
                for param in map {
                    let objKey = param.0
                    let value = param.1
                    let model = InteractionModel.init(id: objKey)
                    if let val = Int("\(value)"){
                        model.value = val
                        keyValueList.append(model)
                    }
                }
                var index = contains(objectName: istr._with_object.unwrappedValue, list: interactionList)
                if index != -100 {
                    let objectModel = interactionList[index]
                    var innerObject: [String: Any] = [:]
                    for interactionModel in objectModel.interactionList {
                        var max = -1
                        for i in 0..<keyValueList.count {
                            if interactionModel.actions.contains(keyValueList[i].id) {
                                if keyValueList[i].value > max {
                                    max = keyValueList[i].value
                                }
                            }
                        }
                        var productJson:[String: Any] = [:]
                        productJson["sentiment"] = max
                        if max > 4 {
                            productJson["sent_bin"] = 2
                            productJson["label"] = "POSITIVE"
                        }
                        else if max == 4 {
                            productJson["sent_bin"] = 1
                            productJson["label"] = "NEUTRAL"
                        }
                        else{
                            productJson["sent_bin"] = 1
                            productJson["label"] = "NEGATIVE"
                        }
                        innerObject[interactionModel.id] = productJson
                    }
                    middleObject[objectModel.objectName] = innerObject
                }
            }
        }
        outerObject[userId] = middleObject
        embeddingObject["interactions"] = outerObject
    }
    
    func postInstructions (finalObject: [String: Any]){
        let beginApi = BeginAPI.init(appId: appId, licenseKey: licenseKey)
        beginApi.sendInstructions(finalObject: finalObject, success:  { [self] (response) in
        }) { (message) in
        }
    }
    
    func inference (){
        let beginApi = BeginAPI.init(appId: appId, licenseKey: licenseKey)
        beginApi.inferenceEmbedding(array: embeddedList, success:  { [self] (response) in
            let inferenceResponse = response as! InferenceModel
            Logg.i(text: "Inferense Result: fake_prob \(inferenceResponse.fake_prob) - not_fake_prob \(inferenceResponse.not_fake_prob)")
        }) { (message) in
        }
    }
    
}
