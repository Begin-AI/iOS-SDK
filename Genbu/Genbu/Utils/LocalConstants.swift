//
//  LocalConstants.swift
//

import Foundation

let APP_ID = "genbu_app_id"
let SECRET_KEY = "genbu_secret_key"
let FETCH_VERSION = "genbu_fetch_version"
let embeddingDiskAddress = "embeddingDiskAddress"

func json(from object:Any) -> String? {
    guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {
        return nil
    }
    return String(data: data, encoding: String.Encoding.utf8)
}


func retrieveEmbeddingList () -> EmbeddingModel {
    do {
        let responseModel = try Disk.retrieve(embeddingDiskAddress,from: .caches, as: EmbeddingModel.self)
        return responseModel
    } catch(let error) {
        print(error.localizedDescription)
        return EmbeddingModel.init(embedding: [], version_number: 1)
    }
}

func saveEmbeddingList(with model:EmbeddingModel){
    do {
        try Disk.save(model, to: .caches, as: embeddingDiskAddress)
        print("Succes: Embedded wrote to Disk.")
    } catch(let error){
        print("Error: Embedded couldn't write to Disk. \(error.localizedDescription)")
    }
}
