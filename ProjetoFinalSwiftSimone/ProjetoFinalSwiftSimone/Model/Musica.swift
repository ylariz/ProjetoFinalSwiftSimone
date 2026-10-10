//
//  Musica.swift
//  ProjetoFinalSwiftSimone
//
//  Created by LARISSA SILVA LEITE on 10/10/26.
//

import Foundation

struct Musica: Codable, Hashable, Identifiable{
    
    let id: Int
    let nome: String
    let artista: String
    let album: String
    let capaURL: String
    let duracaoMillis: Int
    let dataLancamento: String
    let genero: String
    
    enum CodingKeys: String, CodingKey {
            case id = "trackId"
            case nome = "trackName"
            case artista = "artistName"
            case album = "collectionName"
            case capaURL = "artworkUrl100"
            case duracaoMillis = "trackTimeMillis"
            case dataLancamento = "releaseDate"
            case genero = "primaryGenreName"
        }
}

