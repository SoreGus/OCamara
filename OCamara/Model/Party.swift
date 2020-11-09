//
//  Party.swift
//  OCamara
//
//  Created by Gustavo Soré on 08/11/20.
//

struct Party: Codable {
    var identifier: Int
    var name: String
    var imageURL: String
    var label: String
    
    static var example: Party {
        return Party(identifier: 36769,
                     name: "Democratas",
                     imageURL: "http://www.camara.leg.br/internet/Deputado/img/partidos/DEM.gif",
                     label: "DEM")
    }
    
    private enum CodingKeys : String, CodingKey {
        case identifier = "id"
        case name = "nome"
        case label = "sigla"
        case imageURL = "urlLogo"
    }
}

struct PartyRoot: Codable {
    var party: Party
    
    private enum CodingKeys : String, CodingKey {
        case party = "dados"
    }
}
