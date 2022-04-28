//
//  LocalConstants.swift
//

import Foundation

let APP_ID = "begin_app_id"
let SECRET_KEY = "begin_secret_key"
let FETCH_VERSION = "begin_fetch_version"
let INSTRUCTION_ID = "begin_instruction_id"
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
        Logg.d(text: error.localizedDescription)
        return EmbeddingModel.init(embedding: [], version_number: 1)
    }
}

func saveEmbeddingList(with model:EmbeddingModel){
    do {
        try Disk.save(model, to: .caches, as: embeddingDiskAddress)
        Logg.d(text: "Succes: Embedded wrote to Disk.")
    } catch(let error){
        Logg.d(text: "Error: Embedded couldn't write to Disk. \(error.localizedDescription)")
    }
}
