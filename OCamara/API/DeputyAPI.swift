//
//  DeputyAPI.swift
//  OCamara
//
//  Created by Gustavo Soré on 07/11/20.
//

import Foundation

typealias DeputyAPICallback = ([Deputy]?) -> Void

class DeputyAPI {
    func fetch(completion: @escaping DeputyAPICallback) {
        let urlString: String = "https://dadosabertos.camara.leg.br/api/v2/deputados?ordem=ASC&ordenarPor=nome"
        guard let url: URL = URL(string: urlString) else {
            completion(nil)
            return
        }
        let request: URLRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                completion(nil)
            } else {
                if let data = data {
                    do {
                        let root: DeputyRoot = try JSONDecoder().decode(DeputyRoot.self, from: data)
                        completion(root.deputies)
                    } catch {
                        completion(nil)
                    }
                } else {
                    completion(nil)
                }
            }
        }.resume()
    }
}
