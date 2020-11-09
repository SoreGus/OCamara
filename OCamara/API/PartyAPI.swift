//
//  PartyAPI.swift
//  OCamara
//
//  Created by Gustavo Soré on 08/11/20.
//

import Foundation

typealias PartyAPIFetchCallback = (Party?) -> Void

class PartyAPI: BaseAPI {
    func fetch(uriString: String, completion: @escaping PartyAPIFetchCallback) {
        request(urlString: uriString) { (result) in
            switch result {
            case .success(let data):
                do {
                    let root: PartyRoot = try JSONDecoder().decode(PartyRoot.self, from: data)
                    completion(root.party)
                } catch {
                    completion(nil)
                }
            case .failure(_):
                completion(nil)
            }
        }
    }
}


