//
//  LocationInstruction.swift
//

import Foundation
import CoreLocation

class LocationInstruction : BaseInstruction {
    
    var instruction : InstructionModel!
    var features : [String : Any] = [:]
    
    init (instruction : InstructionModel) {
        self.instruction = instruction
    }
    
    func execute (features : [String : Any] ) -> Double {
        if features[instruction.fID.unwrappedValue] == nil {
            return ERR_NUMBER
        }
        else if let val = features[instruction.fID.unwrappedValue] as? LocationModel {
            if instruction.instruct == "DistanceFromField" {
                let secondLocation : LocationModel = features[instruction.params!.field.unwrappedValue] as! LocationModel
                return calculationByDistance(initialLat: val.latitude, initialLong: val.longitude, finalLat: secondLocation.latitude, finalLong: secondLocation.longitude)
            }
            else {
                return EMPTY_NUMBER
            }
        }
        else {
            return EMPTY_NUMBER
        }
    }
    
    func calculationByDistance (initialLat : Double , initialLong : Double, finalLat : Double, finalLong : Double) -> Double {
        let R = 6373.0
        let dLat = toRadians(deg: finalLat - initialLat)
        let dLon = toRadians(deg: finalLong - initialLong)
        let initialLatCal = toRadians(deg: initialLat)
        let finalLatCal = toRadians(deg: finalLat)
        
        let a = sin(dLat / 2) * sin(dLat / 2) + sin(dLon / 2) * sin(dLon / 2) * cos(initialLatCal) * cos(finalLatCal)
        let c = 2 * atan2(sqrt(a), sqrt(1 - a))
        return R * c
    }
    
    func toRadians (deg : Double) -> Double {
        return deg * (Double.pi / 180)
    }
    
}
