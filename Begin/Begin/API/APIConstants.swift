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

func getRecommendUrl (projectId: String, userId: String, limit : Int, page : Int) -> String {
    return projectId + "/recommend/" + userId + "?limit=\(limit)&page=\(page)"
}

func getClassifyUrl (projectId: String, id: String) -> String {
    return projectId + "/classify/" + id + "/"
}

func getFakeUrl (projectId: String, id: String) -> String {
    return projectId + "/detect_fake/" + id + "/"
}

func getEmbeddingUrl () -> String {
    return "embeddings/" + getSafeStringPreference(key: INSTRUCTION_ID) + "/embedding"
}

func getInferenceUrl () -> String {
    return "/embeddings/" + getSafeStringPreference(key: APP_ID) + "/inference"
}
