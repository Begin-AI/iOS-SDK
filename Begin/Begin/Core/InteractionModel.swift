//
//  InteractionModel.swift
//

import Foundation

public class InteractionModel {
    
    var id : String
    var value : Int
    var actions : Set<String>
    
    public init (id : String) {
        self.id = id
        self.actions = Set<String>()
        self.value = 0
    }
    
}
