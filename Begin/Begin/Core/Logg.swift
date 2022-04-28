//
//  Logg.swift
//

import Foundation

public struct Logg {
    
    static func d (text : String){
        #if DEBUG
            print("DEBUG LOG\n\(text)")
        #endif
    }
    
    static func i (text : String){
        print(text)
    }
}
