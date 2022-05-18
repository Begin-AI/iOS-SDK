//
//  LabelModel.swift
//

import Foundation

public class LabelModel {
    
    var objectName : String
    var objectMap : [String : [String]]
    
    public init (objectName : String) {
        self.objectName = objectName
        self.objectMap = [String : [String]]()
    }
    
}
