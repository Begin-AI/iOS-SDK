//
//  PEngagementModel.swift
//

import Foundation

// MARK: - InferenceResponse
struct PEngagementModel: Codable {
    let message: String
    let result: PredictionResult
    let success: Bool
}

// MARK: - Result
struct PredictionResult: Codable {
    let results: JSON
}

