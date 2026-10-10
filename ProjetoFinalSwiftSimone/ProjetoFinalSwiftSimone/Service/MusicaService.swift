//
//  MusicaService.swift
//  ProjetoFinalSwiftSimone
//
//  Created by LARISSA SILVA LEITE on 10/10/26.
//

import Foundation

struct MusicaService{
    func buscarMusicas(termo: String) async throws -> [Musica] {
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(termo)&media=music&entity=song&limit=5")
                else{
            throw URLError(.badURL)
        }
        let (dados, _) = try await URLSession.shared.data(from: url)
        let resposta = try JSONDecoder().decode(RespostaBusca.self, from: dados)
        return resposta.musicas
    }
}
