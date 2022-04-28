//
//  InstructionModel.swift
//

import Foundation

// MARK: - InstructionInstruction
struct InstructionModel: Codable {
    let complexity: Int?
    var fID: String?
    let higherOrder: Int?
    let order: Int?
    let instruct: String?
    let _with_object: String?
    let params: InstructionParams?
    let chains: [[InstructionModel]]?

    enum CodingKeys: String, CodingKey {
        case complexity
        case order
        case fID = "f_id"
        case higherOrder = "higher_order"
        case instruct
        case params
        case chains = "_chains"
        case _with_object
    }
}

// MARK: - InstructionParams
struct InstructionParams: Codable {
    let sequenceMap: JSON?
    let maxv, minv, numSlices: Int?
    let standardNames: [String]?
    let field, compareOn: String?

    enum CodingKeys: String, CodingKey {
        case sequenceMap = "sequence_map"
        case maxv, minv
        case numSlices = "num_slices"
        case standardNames = "standard_names"
        case field
        case compareOn = "compare_on"
    }
}

// MARK: - InstructionResponse
struct InstructionResponse: Codable {
    let message: String?
    let result: Result
    let success: Bool
}

// MARK: - Result
struct Result: Codable {
    let instructions: [ResultInstruction]
    let versionNumber: Int

    enum CodingKeys: String, CodingKey {
        case instructions
        case versionNumber = "version_number"
    }
}

// MARK: - ResultInstruction
struct ResultInstruction: Codable {
    let createdAt: String?
    let id: Int?
//    let instructions: [Instructions]
    var instructions: [[String:[InstructionModel]]]
    let schema: Int?

    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case id, instructions, schema
    }
}
