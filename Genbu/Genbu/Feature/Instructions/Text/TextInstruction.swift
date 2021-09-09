//
//  TextInstruction.swift
//

import Foundation

class TextInstruction : BaseInstruction {
    
    var instruction : InstructionModel!
    var features : [String : Any] = [:]
    
    init (instruction : InstructionModel) {
        self.instruction = instruction
    }
    
    func execute (features : [String : Any]) -> Double {
        if features[instruction.fID.unwrappedValue] == nil {
            return ERR_NUMBER
        }
        else if let val = features[instruction.fID.unwrappedValue] as? String {
            if instruction.instruct == "Length" {
                return Double(val.count)
            }
            else if instruction.instruct == "CountDigits" {
                let filteredString = val.westernArabicNumeralsOnly
                return Double(filteredString.count)
            }
            else {
                // TODO
                return 0
            }
        }
        else {
            return EMPTY_NUMBER
        }
    }
    
}
