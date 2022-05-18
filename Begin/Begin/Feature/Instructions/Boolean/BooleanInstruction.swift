//
//  BooleanInstruction.swift
//

import Foundation

class BooleanInstruction : BaseInstruction {
    
    var instruction : InstructionModel!
    var features : [String : Any] = [:]
    
    init (instruction : InstructionModel) {
        self.instruction = instruction
    }
    
    func execute (features : [String : Any] ) -> Double {
        if features[instruction.fID.unwrappedValue] == nil {
            return ERR_NUMBER
        }
        else {
            let val = features[instruction.fID.unwrappedValue]!
            let val2 = "\(val)"
            if val2 == "\(EMPTY_NUMBER)" || val2 == "" {
                if let emptyValue = instruction.params?.emptyNumber {
                    return Double(emptyValue)
                }
                return EMPTY_NUMBER
            }
            else if val2 == "true" {
                if let trueValue = instruction.params?.trueValue {
                    return Double(trueValue)
                }
                return ERR_NUMBER
            }
            else if val2 == "false" {
                if let falseValue = instruction.params?.falseValue {
                    return Double(falseValue)
                }
                return ERR_NUMBER
            }
            else {
                return EMPTY_NUMBER
            }
        }
    }
    
}
