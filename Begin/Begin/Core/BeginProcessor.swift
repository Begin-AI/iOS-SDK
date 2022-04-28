//
//  BeginProcessor.swift
//

import Foundation

class BeginProcessor {
    
    var features : [String : Any] = [:]
    var embeddedList : [Double] = []
    let CONTINUE_NUMBER = -1337.37
    var chainResult = 0.00013
    
    init (features : [String : Any]) {
        self.features = features
    }
    
    func processInstructions(instructions : [InstructionModel]) -> [Double]{
        let sortedList = instructions.sorted(by: {$0.higherOrder.unwrappedValue < $1.higherOrder.unwrappedValue})
        for instr in sortedList {
            decideInstruction(instruction: instr, isChain: false)
        }
        return embeddedList
    }
    
    func decideInstruction (instruction : InstructionModel, isChain : Bool) -> Double {
        switch instruction.instruct.unwrappedValue {
        case "Slice":
            return sliceInstruction(instruction: instruction, isChain: isChain)
        case "Length", "CountDigits", "StandardName":
            return textInstruction(instruction: instruction, isChain: isChain)
        case "Age", "CompareDates":
            return dateInstruction(instruction: instruction, isChain: isChain)
        case "DistanceFromField", "DistanceFromPoint":
            return locationInstruction(instruction: instruction, isChain: isChain)
        case "Sequence":
            return sequenceInstruction(instruction: instruction, isChain: isChain)
        case "":
            chainInstruction(instruction: instruction)
            return CONTINUE_NUMBER
        default:
            return CONTINUE_NUMBER
        }
    }
    
    func textInstruction (instruction : InstructionModel ,isChain : Bool) -> Double {
        let textInstr = TextInstruction.init(instruction: instruction)
        let result = textInstr.execute(features: features)
        if !isChain {
            embeddedList.append(result)
        }
        return result
    }
    
    func locationInstruction (instruction : InstructionModel, isChain : Bool) -> Double {
        let locationInstr = LocationInstruction.init(instruction: instruction)
        let result = locationInstr.execute(features: features)
        if !isChain {
            embeddedList.append(result)
        }
        return result
    }
    
    func dateInstruction (instruction : InstructionModel, isChain : Bool) -> Double {
        let dateInstr = DateInstruction.init(instruction: instruction)
        let result = dateInstr.execute(features: features)
        if !isChain {
            embeddedList.append(result)
        }
        return result
    }
    
    func sliceInstruction (instruction : InstructionModel, isChain : Bool) -> Double {
        let sliceInstr = SliceInstruction.init(instruction: instruction)
        let result = sliceInstr.execute(features: features)
        if !isChain {
            embeddedList.append(result)
        }
        return result
    }
    
    func sequenceInstruction (instruction : InstructionModel, isChain : Bool) -> Double {
        let sequenceInstr = SequenceInstruction.init(instruction: instruction)
        let result = sequenceInstr.execute(features: features)
        if !isChain {
            embeddedList.append(result)
        }
        return result
    }
    
    func chainInstruction (instruction : InstructionModel) {
        if let chains = instruction.chains {
            for list in chains {
                let sortedList = list.sorted(by: {$0.order.unwrappedValue < $1.order.unwrappedValue})
                for i in 0..<sortedList.count {
                    var sentInstruction = sortedList[i]
                    sentInstruction.fID = instruction.fID
                    if i == 0 {
                        chainResult = decideInstruction(instruction: sentInstruction, isChain: true)
                        updateFeatures(key: "chainResponse", value: Int(chainResult))
                    }
                    else if i == sortedList.count-1 {
                        sentInstruction.fID = "chainResponse"
                        chainResult = decideInstruction(instruction: sentInstruction, isChain: false)
                        features["chainResponse"] = nil
                    }
                    else {
                        sentInstruction.fID = "chainResponse"
                        chainResult = decideInstruction(instruction: sentInstruction, isChain: true)
                        updateFeatures(key: "chainResponse", value: Int(chainResult))
                    }
                }
            }
        }
    }
    
    func updateFeatures (key : String, value : Any){
        features[key] = value
    }
    
}
