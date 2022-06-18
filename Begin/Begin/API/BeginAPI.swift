//
//  BeginAPI.swift
//

import Foundation

class BeginAPI {
    
    var baseUrl = "https://sdk.begin.ai/"
    var appId = ""
    var licenseKey = ""
    
    init (appId : String , licenseKey : String){
        self.appId = appId
        self.licenseKey = licenseKey
    }
    
    func fetchInstructions (success: @escaping ((InstructionParser) -> Void), failed: @escaping ((Any) -> Void)) {
        let url = URL(string: baseUrl + getFetchInstructionsUrl())!
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(appId, forHTTPHeaderField: "AppID")
        request.addValue(licenseKey, forHTTPHeaderField: "LicenseKey")
        Logg.i(text: "Making Fetch Instructions Request")
        Logg.d(text: "GET Request: \(url)")
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            guard error == nil else {
                Logg.i(text: "Fetch instructions Failed - no response")
                failed("")
                return
            }
            guard let data = data else {
                Logg.i(text: "Fetch instructions Failed - no data")
                failed("")
                return
            }
            do {
                let instructionResponse = try JSONDecoder().decode(InstructionResponse.self, from: data)
                if instructionResponse.success {
                    let id = instructionResponse.result.instructions[0].instruction_id.unwrappedValue
                    setPreference(key: INSTRUCTION_ID, value: id)
                    let version = instructionResponse.result.instructions[0].version
                    setPreference(key: FETCH_VERSION, value: version)
                    let instructions = instructionResponse.result.instructions[0].instructions
                    let labels = instructionResponse.result.instructions[0].labels
                    var iParser = InstructionParser.init(instructions: instructions, labels: labels)
                    Logg.i(text: "Fetch instructions Success")
                    success(iParser)
                }
                else {
                    Logg.i(text: "Fetch instructions Failed")
                    Logg.d(text: "\(instructionResponse)")
                    failed("")
                }
            } catch let error {
                Logg.i(text: "Fetch instructions Failed")
                Logg.d(text: "\(error)")
                failed("")
            }
        })
        task.resume()
    }
    
    func predictEngagement (projectId: String, objectId: String, userId: String, success: @escaping ((JSON) -> Void), failed: @escaping ((Any) -> Void)) {
        let url = URL(string: baseUrl + getPredictEngagementUrl(projectId: projectId, objectId: objectId, userId: userId))!
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(appId, forHTTPHeaderField: "AppID")
        request.addValue(licenseKey, forHTTPHeaderField: "LicenseKey")
        Logg.i(text: "Making Predict Engagement Request")
        Logg.d(text: "GET Request: \(url)")
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            guard error == nil else {
                Logg.i(text: "Predict Engagement Failed - no response")
                failed("")
                return
            }
            guard let data = data else {
                Logg.i(text: "Predict Engagement Failed - no data")
                failed("")
                return
            }
            do {
                let response = try JSONDecoder().decode(PEngagementModel.self, from: data)
                if response.success {
                    let result = response.result.results
                    Logg.i(text: "Predict Engagement Success")
                    Logg.d(text: "\(result)")
                    success(response.result.results)
                }
                else {
                    Logg.i(text: "Predict Engagement Failed")
                    Logg.d(text: "\(response)")
                    failed("")
                }
            } catch let error {
                Logg.i(text: "Predict Engagement Failed")
                Logg.d(text: "\(error)")
                failed("")
            }
        })
        task.resume()
    }
    
    func recommend (projectId: String, userId: String, limit : Int, page : Int, success: @escaping ((JSON) -> Void), failed: @escaping ((Any) -> Void)) {
        let url = URL(string: baseUrl + getRecommendUrl(projectId: projectId, userId: userId, limit: limit, page: page))!
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(appId, forHTTPHeaderField: "AppID")
        request.addValue(licenseKey, forHTTPHeaderField: "LicenseKey")
        Logg.i(text: "Making Recommend Request")
        Logg.d(text: "GET Request: \(url)")
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            guard error == nil else {
                Logg.i(text: "Recommend Failed - no response")
                failed("")
                return
            }
            guard let data = data else {
                Logg.i(text: "Recommend Failed - no data")
                failed("")
                return
            }
            do {
                let response = try JSONDecoder().decode(PEngagementModel.self, from: data)
                if response.success {
                    let result = response.result.results
                    Logg.i(text: "Recommend Success")
                    Logg.d(text: "\(result)")
                    success(response.result.results)
                }
                else {
                    Logg.i(text: "Recommend Failed")
                    Logg.d(text: "\(response)")
                    failed("")
                }
            } catch let error {
                Logg.i(text: "Recommend Failed")
                Logg.d(text: "\(error)")
                failed("")
            }
        })
        task.resume()
    }
    
    func classify (projectId: String, id: String, success: @escaping ((JSON) -> Void), failed: @escaping ((Any) -> Void)) {
        let url = URL(string: baseUrl + getClassifyUrl(projectId: projectId, id: id))!
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(appId, forHTTPHeaderField: "AppID")
        request.addValue(licenseKey, forHTTPHeaderField: "LicenseKey")
        Logg.i(text: "Making Classify Request")
        Logg.d(text: "GET Request: \(url)")
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            guard error == nil else {
                Logg.i(text: "Classify Failed - no response")
                failed("")
                return
            }
            guard let data = data else {
                Logg.i(text: "Classify Failed - no data")
                failed("")
                return
            }
            do {
                let response = try JSONDecoder().decode(PEngagementModel.self, from: data)
                if response.success {
                    let result = response.result.results
                    Logg.i(text: "Classify Success")
                    Logg.d(text: "\(result)")
                    success(response.result.results)
                }
                else {
                    Logg.i(text: "Classify Failed")
                    Logg.d(text: "\(response)")
                    failed("")
                }
            } catch let error {
                Logg.i(text: "Classify Failed")
                Logg.d(text: "\(error)")
                failed("")
            }
        })
        task.resume()
    }
    
    func fakeDetect (projectId: String, id: String, success: @escaping ((JSON) -> Void), failed: @escaping ((Any) -> Void)) {
        let url = URL(string: baseUrl + getFakeUrl(projectId: projectId, id: id))!
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(appId, forHTTPHeaderField: "AppID")
        request.addValue(licenseKey, forHTTPHeaderField: "LicenseKey")
        Logg.i(text: "Making Fake Detect Request")
        Logg.d(text: "GET Request: \(url)")
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            guard error == nil else {
                Logg.i(text: "Fake Detect Failed - no response")
                failed("")
                return
            }
            guard let data = data else {
                Logg.i(text: "Fake Detect Failed - no data")
                failed("")
                return
            }
            do {
                Logg.d(text: "data \(data)")
                let response = try JSONDecoder().decode(PEngagementModel.self, from: data)
                if response.success {
                    let result = response.result.results
                    Logg.i(text: "Fake Detect Success")
                    Logg.d(text: "\(result)")
                    success(response.result.results)
                }
                else {
                    Logg.i(text: "Fake Detect Failed")
                    Logg.d(text: "\(response)")
                    failed("")
                }
            } catch let error {
                Logg.i(text: "Fake Detects Failed")
                Logg.d(text: "\(error)")
                failed("")
            }
        })
        task.resume()
    }
    
    func sendInstructions (finalObject: [String: Any], success: @escaping ((Any) -> Void), failed: @escaping ((Any) -> Void)) {
        let url = URL(string: baseUrl + getEmbeddingUrl())!
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(appId, forHTTPHeaderField: "AppID")
        request.addValue(licenseKey, forHTTPHeaderField: "LicenseKey")
        Logg.i(text: "Making Send Instructions Request")
        Logg.d(text: "POST Request: \(url)")
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: finalObject)
        } catch let error {
            Logg.i(text: "Send instructions Failed")
            Logg.d(text: "\(error)")
        }
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    Logg.i(text: "Send instructions success")
                    success("")
                    return
                }
                else {
                    Logg.i(text: "Send instructions Failed - \(httpResponse.statusCode)")
                    failed("")
                    return
                }
            }
            else {
                Logg.i(text: "Send instructions Failed - no response")
            }
        })
        task.resume()
    }
    
    func inferenceEmbedding (array : [Double], success: @escaping ((Any) -> Void), failed: @escaping ((Any) -> Void)) {
        let url = URL(string: baseUrl + getInferenceUrl())!
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(appId, forHTTPHeaderField: "AppID")
        request.addValue(licenseKey, forHTTPHeaderField: "LicenseKey")
        
        Logg.i(text: "Making Inference Request")
        Logg.d(text: "GET Request: \(url)")
        
        var params : [String: Any] = [:]
        params["embedding"] = array
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: params)
        } catch let error {
            Logg.i(text: "Inference Failed")
            Logg.d(text: "\(error)")
        }
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            guard error == nil else {
                Logg.i(text: "Inference Failed - no response")
                failed("")
                return
            }
            guard let data = data else {
                Logg.i(text: "Inference Failed - no data")
                failed("")
                return
            }
            do {
                let inferenceResponse = try JSONDecoder().decode(InferenceResponse.self, from: data)
                if inferenceResponse.success {
                    Logg.i(text: "Inference success")
                    success(inferenceResponse.result)
                }
                else {
                    Logg.i(text: "Inference failed")
                    Logg.d(text: "\(inferenceResponse)")
                    failed("")
                }
            } catch let error {
                Logg.i(text: "Inference failed")
                Logg.d(text: "\(error)")
                failed("")
            }
        })
        task.resume()
    }
    
}
