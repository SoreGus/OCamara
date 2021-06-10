//
//  DeputyAPI.swift
//  OCamara
//
//  Created by Gustavo Soré on 07/11/20.
//

import Foundation

typealias DeputyAPICallback = ([Deputy]?) -> Void

class DeputyAPI: BaseAPI {
    
    // MARK: - Constants
    
    let kFetchDeputyURLString: String = "https://dadosabertos.camara.leg.br/api/v2/deputados?ordem=ASC&ordenarPor=nome"
    
    //MARK: - Public Methods
    
    func fetch() async throws -> [Deputy] {
        let result = try await request(urlString: kFetchDeputyURLString)
        let root: DeputyRoot = try JSONDecoder().decode(DeputyRoot.self, from: result.data)
        return root.deputies
    }
}
