//
//  DeputyAPI.swift
//  OCamara
//
//  Created by Gustavo Soré on 07/11/20.
//

import Foundation

typealias DeputyAPICallback = ([Deputy]?) -> Void

class DeputyAPI: BaseAPI {
    
    //MARK: - Public Methods
    
    func fetch(completion: @escaping DeputyAPICallback) {
        request(urlString: "https://dadosabertos.camara.leg.br/api/v2/deputados?ordem=ASC&ordenarPor=nome") { (result) in
            switch result {
            case .success(let data):
                do {
                    let root: DeputyRoot = try JSONDecoder().decode(DeputyRoot.self, from: data)
                    completion(root.deputies)
                } catch {
                    completion(nil)
                }
            case .failure(_):
                completion(nil)
            }
        }
    }
}
