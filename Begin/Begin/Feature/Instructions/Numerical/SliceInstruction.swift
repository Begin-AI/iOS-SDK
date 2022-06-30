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
                return generateBandsForNumericalFeature(value: val)
            }
        }
        else if let val = features[instruction.fID.unwrappedValue] as? Int {
            return generateBandsForNumericalFeature(value: Double(val))
        }
        else {
            return EMPTY_NUMBER
        }
    }
    
    func generateBandsForNumericalFeature (value : Double) -> Double {
        newslices.removeAll()
        let innerRange = maxv - minv
        let binSize : Double = Double(innerRange) / Double(num_slicers)
        var start : Double = Double(minv)
        var end : Double = 0
        
        for i in 0..<num_slicers {
            let defaultEnd : Double = start + binSize
            end = round(number: defaultEnd)
            if i == 0 {
                start -= 0.1
            }
            if i == num_slicers - 1 {
                end += 0.1
            }
            slice(min: start, max: end)
            start = end
        }
        
        for j in 0..<newslices.count {
            if newslices[j].first <= value && newslices[j].second >= value {
                return Double(j+1)
            }
        }
        
        if value < Double(minv) || value > Double(maxv) {
            return Double(newslices.count + 1)
        }
        
        return ERR_NUMBER
    }
    
    func slice (min : Double, max : Double){
        newslices.append(Pair.init(first: min, second: max))
    }
    
    func round (number : Double) -> Double {
        let scale: Int16 = 4
        let behavior = NSDecimalNumberHandler(roundingMode: .plain, scale: scale, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: true)
        let roundedValue = NSDecimalNumber(value: number).rounding(accordingToBehavior: behavior)
        return roundedValue.doubleValue
    }
}
