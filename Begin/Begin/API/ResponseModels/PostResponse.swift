//
//  PostResponse.swift
//

import Foundation

// MARK: - PostResponse
struct PostResponse: Codable {
    let message: String
    let result: JSON
    let success: Bool
}

