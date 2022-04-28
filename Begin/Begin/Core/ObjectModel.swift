//
//  ObjectModel.swift
//

import Foundation

public class ObjectModel {
    
    var objectName : String
    var objectMap : [String : [String : Any]]
    var interactionList : [InteractionModel]
    
    public init (objectName : String) {
        self.objectName = objectName
        self.objectMap = [String : [String : Any]]()
        self.interactionList = [InteractionModel]()
    }
    
}
