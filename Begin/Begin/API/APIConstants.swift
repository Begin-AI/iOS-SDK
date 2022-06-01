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

func getRecommendUrl (projectId: String, userId: String) -> String {
    return projectId + "/recommend/" + userId + "/"
}

func getClassifyUrl (projectId: String, id: String) -> String {
    return projectId + "/classify/" + id + "/"
}

func getEmbeddingUrl () -> String {
    return "embeddings/" + getSafeStringPreference(key: INSTRUCTION_ID) + "/embedding"
}

func getInferenceUrl () -> String {
    return "/embeddings/" + getSafeStringPreference(key: APP_ID) + "/inference"
}
