//
//  BaseAPI.swift
//  OCamara
//
//  Created by Gustavo Soré on 08/11/20.
//

import Foundation

typealias BaseAPICallback = (BaseAPIResult<Data>) -> Void

enum BaseAPIResult<T> {
    case success(T)
    case failure(BaseAPIError)
}

enum BaseAPIError: Error {
    case wrongURL
    case request(Error)
    case parse(Error)
    case noData
}

class BaseAPI {
    func request(urlString: String, completion: @escaping BaseAPICallback) {
        guard let url: URL = URL(string: urlString) else {
            completion(.failure(.wrongURL))
            return
        }
        let request: URLRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(.request(error)))
            } else {
                if let data = data {
                    completion(.success(data))
                } else {
                    completion(.failure(.noData))
                }
            }
        }.resume()
    }
}
