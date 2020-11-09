//
//  PartyAPI.swift
//  OCamara
//
//  Created by Gustavo Soré on 08/11/20.
//

import Foundation

typealias PartyAPIFetchCallback = (Party?) -> Void

class PartyAPI {
    func fetch(uriString: String, completion: @escaping PartyAPIFetchCallback) {
        guard let url: URL = URL(string: uriString) else {
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
                        let root: PartyRoot = try JSONDecoder().decode(PartyRoot.self, from: data)
                        completion(root.party)
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


