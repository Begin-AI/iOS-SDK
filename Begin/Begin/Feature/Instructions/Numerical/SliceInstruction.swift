//
//  SliceInstruction.swift
//

import Foundation

class SliceInstruction : BaseInstruction {
    
    var instruction : InstructionModel!
    var features : [String : Any] = [:]
    var minv = 0
    var maxv = 0
    var num_slicers = 0
    var slices : [Pair] = []
    var newslices : [Pair] = []
    
    init (instruction : InstructionModel) {
        self.instruction = instruction
        self.maxv = instruction.params?.maxv.unwrappedValue ?? 0
        self.minv = instruction.params?.minv.unwrappedValue ?? 0
        self.num_slicers = instruction.params?.numSlices.unwrappedValue ?? 0
    }
    
    func execute (features : [String : Any] ) -> Double {
        if features[instruction.fID.unwrappedValue] == nil {
            return ERR_NUMBER
        }
        else if let val = features[instruction.fID.unwrappedValue] as? Double {
            if val == EMPTY_NUMBER {
                return EMPTY_NUMBER
            }
            else {
                return generateBandsForNumericalFeature(value: Int(val))
            }
        }
        else if let val = features[instruction.fID.unwrappedValue] as? Int {
            return generateBandsForNumericalFeature(value: Int(val))
        }
        else {
            return EMPTY_NUMBER
        }
    }
    
    func generateBandsForNumericalFeature (value : Int) -> Double {
        slices.removeAll()
        newslices.removeAll()
        
        while slices.count < num_slicers {
            if slices.count == 0 {
                slice(min: minv, max: maxv)
                slices.append(contentsOf: newslices)
            }
            else {
                newslices.removeAll()
                for s in 0..<slices.count {
                    slice(min: slices[s].first, max: slices[s].second)
                }
                slices.removeAll()
                slices.append(contentsOf: newslices)
            }
        }
        
        for j in 0..<slices.count {
            if slices[j].first <= value && slices[j].second >= value {
                return Double(j+1)
            }
        }
        
        if value < minv || value > maxv {
            return Double(slices.count + 1)
        }
        
        return ERR_NUMBER
    }
    
    func slice (min : Int, max : Int){
        let midNumber : Int = (min + max) / 2
        newslices.append(Pair.init(first: min, second: midNumber))
        newslices.append(Pair.init(first: midNumber, second: max))
    }
}
