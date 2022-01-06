//
//  BeginAPI.swift
//

import Foundation

class BeginAPI {
    
    var baseUrl = ""
    
    init (url : String){
        self.baseUrl = url
    }
    
    func fetchInstructions (success: @escaping (([InstructionModel]) -> Void), failed: @escaping ((Any) -> Void)) {
        let url = URL(string: baseUrl + getFetchInstructionsUrl())!
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            guard error == nil else {
                print("Fetch instructions Failed - no response")
                failed("")
                return
            }
            guard let data = data else {
                print("Fetch instructions Failed - no data")
                failed("")
                return
            }
            do {
                print("data \(data) \(response)")
                let instructionResponse = try JSONDecoder().decode(InstructionResponse.self, from: data)
                if instructionResponse.success {
                    let version = instructionResponse.result.versionNumber
                    setPreference(key: FETCH_VERSION, value: version)
                    let instructions = instructionResponse.result.instructions[0].instructions
                    print("Fetch instructions Success - version no: \(version)")
                    success(instructions)
                }
                else {
                    print("Fetch instructions Failed\n\(instructionResponse)")
                    failed("")
                }
            } catch let error {
                print("Fetch instructions Failed\n\(error)")
                failed("")
            }
        })
        task.resume()
    }
    
    func sendInstructions (model : EmbeddingModel, success: @escaping ((Any) -> Void), failed: @escaping ((Any) -> Void)) {
        let url = URL(string: baseUrl + getEmbeddingUrl())!
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        var params : [String: Any] = [:]
        params["embedding"] = model.embedding
        params["version_number"] = model.version_number
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: params)
        } catch let error {
            print(error)
        }
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            guard error == nil else {
                print("Send instructions Failed - no response")
                failed("")
                return
            }
            guard let data = data else {
                print("Send instructions Failed - no data")
                failed("")
                return
            }
            do {
                let instructionResponse = try JSONDecoder().decode(PostResponse.self, from: data)
                if instructionResponse.success {
                    print("Send instructions success")
                    success(instructionResponse)
                }
                else {
                    print("Send instructions Failed\n\(instructionResponse)")
                    failed("")
                }
            } catch let error {
                print("Send instructions Failed\n\(error)")
                failed("")
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
        var params : [String: Any] = [:]
        params["embedding"] = array
        do {
            print("params \(params)")
            request.httpBody = try JSONSerialization.data(withJSONObject: params)
        } catch let error {
            print(error)
        }
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            guard error == nil else {
                print("Inference Failed - no response")
                failed("")
                return
            }
            guard let data = data else {
                print("Inference Failed - no data")
                failed("")
                return
            }
            do {
                let inferenceResponse = try JSONDecoder().decode(InferenceResponse.self, from: data)
                if inferenceResponse.success {
                    print("Inference success")
                    success(inferenceResponse.result)
                }
                else {
                    print("Inference Failed\n\(inferenceResponse)")
                    failed("")
                }
            } catch let error {
                print("Inference Failed\n\(error)")
                failed("")
            }
        })
        task.resume()
    }
    
}
