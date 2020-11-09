//
//  Deputy.swift
//  OCamara
//
//  Created by Gustavo Soré on 07/11/20.
//

struct Deputy: Codable {
    var identifier: Int
    var uri: String
    var name: String
    var partyLabel: String
    var partyUri: String
    var stateLabel: String
    var legislatureIdentifier: Int
    var photoURL: String
    var email: String
    
    static var example: Self {
        return Deputy(identifier: 204536,
                      uri: "https://dadosabertos.camara.leg.br/api/v2/deputados/204536",
                      name: "Kim Kataguiri",
                      partyLabel: "DEM",
                      partyUri: "https://dadosabertos.camara.leg.br/api/v2/partidos/36769",
                      stateLabel: "SP",
                      legislatureIdentifier: 56,
                      photoURL: "https://www.camara.leg.br/internet/deputado/bandep/204536.jpg",
                      email: "dep.kimkataguiri@camara.leg.br")
    }
    
    private enum CodingKeys : String, CodingKey {
        case identifier = "id"
        case uri
        case name = "nome"
        case partyLabel = "siglaPartido"
        case partyUri = "uriPartido"
        case stateLabel = "siglaUf"
        case legislatureIdentifier = "idLegislatura"
        case photoURL = "urlFoto"
        case email
    }
}

struct DeputyRoot: Codable {
    var deputies: [Deputy]
    
    private enum CodingKeys : String, CodingKey {
        case deputies = "dados"
    }
}
