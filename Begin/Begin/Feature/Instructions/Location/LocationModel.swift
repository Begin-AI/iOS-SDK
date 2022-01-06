//
//  LocationModel.swift
//

import Foundation

public class LocationModel : Codable {
    
    var latitude : Double
    var longitude : Double
    
    public init (latitude : Double , longitude : Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
}
