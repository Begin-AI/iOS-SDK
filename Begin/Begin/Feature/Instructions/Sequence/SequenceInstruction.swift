//
//  SequenceInstruction.swift
//

import Foundation

class SequenceInstruction : BaseInstruction {
    
    var instruction : InstructionModel!
    var features : [String : Any] = [:]
    
    init (instruction : InstructionModel) {
        self.instruction = instruction
    }
    
    func execute (features : [String : Any] ) -> Double {
        if features[instruction.fID.unwrappedValue] == nil {
            if let emp = (instruction.params?.sequenceMap?["_GB_EMPTY"].doubleValue) {
                return emp
            }
            return ERR_NUMBER
        }
        else {
            let val = features[instruction.fID.unwrappedValue]!
            let val2 = "\(val)"
            if val2 == "\(EMPTY_NUMBER)" || val2 == "" {
                if let emp = (instruction.params?.sequenceMap?["_GB_EMPTY"].doubleValue) {
                    return emp
                }
                return EMPTY_NUMBER
            }
            else if let seq = instruction.params?.sequenceMap?[val2] {
                if "\(seq)".isNumeric {
                    return Double("\(seq)")!
                }
                else {
                    return (instruction.params?.sequenceMap?["_GB_EMPTY"].doubleValue)!
                }
            }
            else {
                if let emp = (instruction.params?.sequenceMap?["_GB_EMPTY"].doubleValue) {
                    return emp
                }
                return EMPTY_NUMBER
            }
        }
    }
    
}
