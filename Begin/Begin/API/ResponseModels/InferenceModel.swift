//
//  InferenceModel.swift
//

// MARK: - InferenceResponse
struct InferenceResponse: Codable {
    let message: String
    let result: InferenceModel
    let success: Bool
}

struct InferenceModel: Codable {
    let not_fake_prob: Double
    var fake_prob: Double

    enum CodingKeys: String, CodingKey {
        case not_fake_prob
        case fake_prob
    }
}
