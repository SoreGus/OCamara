//
//  PartyAPI.swift
//  OCamara
//
//  Created by Gustavo Soré on 08/11/20.
//

import Foundation

typealias PartyAPIFetchCallback = (Party?) -> Void

fileprivate let partyCache: NSCache = NSCache<NSString, NSData>()

class PartyAPI: BaseAPI {
    
    //MARK: - Public Methods
    
    func fetch(uriString: String, completion: @escaping PartyAPIFetchCallback) {
        if let partyData: Data = cachedImageData(uriString: uriString) {
            completion(party(data: partyData))
        } else {
            request(urlString: uriString) { (result) in
                switch result {
                case .success(let data):
                    if let party = self.party(data: data) {
                        self.cacheImageData(uriString: uriString, data: data)
                        completion(party)
                    } else {
                        completion(nil)
                    }
                case .failure(_):
                    completion(nil)
                }
            }
        }
    }
    
    //MARK: - Private Methods
    
    fileprivate func cachedImageData(uriString: String) -> Data? {
        guard let nsData: NSData = partyCache.object(forKey: uriString as NSString) else {
            return nil
        }
        return nsData as Data
    }
    
    fileprivate func cacheImageData(uriString: String, data: Data) {
        partyCache.setObject(data as NSData, forKey: uriString as NSString)
    }
    
    fileprivate func party(data: Data) -> Party? {
        do {
            let root: PartyRoot = try JSONDecoder().decode(PartyRoot.self, from: data)
            return root.party
        } catch {
            return nil
        }
    }
}


