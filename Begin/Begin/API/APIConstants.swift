//
//  APIConstants.swift
//

import Foundation

let GETTOKEN = "/auth"
let FEATURES = "/features/responses"

func getFetchInstructionsUrl () -> String {
    return "/embeddings/" + getSafeStringPreference(key: APP_ID) + "/fetch_instructions"
}

func getEmbeddingUrl () -> String {
    return "/embeddings/" + getSafeStringPreference(key: APP_ID) + "/embedding"
}

func getInferenceUrl () -> String {
    return "/embeddings/" + getSafeStringPreference(key: APP_ID) + "/inference"
}
