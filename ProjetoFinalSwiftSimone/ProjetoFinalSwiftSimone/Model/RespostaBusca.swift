//
//  RespostaBusca.swift
//  ProjetoFinalSwiftSimone
//
//  Created by LARISSA SILVA LEITE on 10/10/26.
//

import Foundation

struct RespostaBusca: Codable{
    let musicas: [Musica]
    
    enum CodingKeys: String, CodingKey{
        case musicas = "results"
    }
    
}
