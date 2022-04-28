//
//  APIConstants.swift
//

import Foundation

let GETTOKEN = "/auth"
let FEATURES = "/features/responses"

func getFetchInstructionsUrl () -> String {
    return getSafeStringPreference(key: APP_ID) + "/fetch"
}

func getPredictEngagementUrl (projectId: String, objectId: String, userId: String) -> String {
    return projectId + "/predict_engagement/" + userId + "/" + objectId
}

func getEmbeddingUrl () -> String {
    return "embeddings/" + getSafeStringPreference(key: INSTRUCTION_ID) + "/embedding"
}

func getInferenceUrl () -> String {
    return "/embeddings/" + getSafeStringPreference(key: APP_ID) + "/inference"
}
