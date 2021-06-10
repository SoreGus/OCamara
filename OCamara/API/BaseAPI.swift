//
//  BaseAPI.swift
//  OCamara
//
//  Created by Gustavo Soré on 08/11/20.
//

import Foundation

enum BaseAPIError: Error {
    case wrongURL
    case request(Error)
    case parse
    case noData
}

struct APIResult {
    var data: Data
    var response: URLResponse
}

class BaseAPI {
    
    //MARK: - Public Methods
    
    func request(urlString: String) async throws -> APIResult {
        guard let url: URL = URL(
            string: urlString
        ) else { throw BaseAPIError.wrongURL }
        let request: URLRequest = URLRequest(
            url: url
        )
        let (data, response) = try await URLSession.shared.data(
            for: request,
               delegate: nil
        )
        return APIResult(
            data: data,
            response: response
        )
    }
}
