//
//  TelaCarrossel.swift
//  ProjetoFinalSwiftSimone
//
//  Created by LARISSA SILVA LEITE on 10/10/26.
//

import SwiftUI

struct TelaCarrossel: View {
    let artista: Artista

    var body: some View {
        Text(artista.nome)
            .font(.custom("Georgia", size: 34))
    }
}

#Preview {
    TelaCarrossel(artista: Artista(nome: "Clairo", termoBusca: "clairo", foto: "clairo"))
}
