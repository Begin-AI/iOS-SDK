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
                return EMPTY_NUMBER
            }
            else if val2 == "true" {
                return 2
            }
            else if val2 == "false" {
                return 1
            }
            else {
                return EMPTY_NUMBER
            }
        }
    }
    
}
