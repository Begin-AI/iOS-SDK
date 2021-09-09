//
//  DateInstruction.swift
//

import Foundation

class DateInstruction : BaseInstruction {
    
    var instruction : InstructionModel!
    var features : [String : Any] = [:]
    
    init (instruction : InstructionModel) {
        self.instruction = instruction
    }
    
    func execute (features : [String : Any] ) -> Double {
        if features[instruction.fID.unwrappedValue] == nil {
            return ERR_NUMBER
        }
        else if let val = features[instruction.fID.unwrappedValue] as? String {
            if val == "" {
                return EMPTY_NUMBER
            }
            else if instruction.instruct == "Age" {
                return Double(yearsBetweenDate(startDate: formatDate(date: val), endDate: Date()))
            }
            else {
                if let date2 = features[instruction.params?.field ?? ""] as? String {
                    return Double(yearsBetweenDate(startDate: formatDate(date: val), endDate: formatDate(date: date2)))
                }
                else {
                    return EMPTY_NUMBER
                }
            }
        }
        else {
            return EMPTY_NUMBER
        }
    }
    
    func formatDate (date : String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        if let date = dateFormatter.date(from: date) {
            return date
        }
        else {
           return Date ()
        }
    }
    
    func yearsBetweenDate(startDate: Date, endDate: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year], from: startDate, to: endDate)
        return components.year!
    }

    
}
