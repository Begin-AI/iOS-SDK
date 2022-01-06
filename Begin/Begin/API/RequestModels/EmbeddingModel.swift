//
//  EmbeddingModel.swift
//

import Foundation

class EmbeddingModel : Codable {
    var embedding : [Double]
    var version_number : Int
    
    init(embedding : [Double] , version_number : Int) {
        self.embedding = embedding
        self.version_number = version_number
    }
    
    enum CodingKeys: String, CodingKey {
        case embedding
        case version_number
    }
}
