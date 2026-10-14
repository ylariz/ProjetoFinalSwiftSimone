//
//  TelaDetalhes.swift
//  ProjetoFinalSwiftSimone
//
//  Created by LARISSA SILVA LEITE on 10/10/26.
//

import SwiftUI

struct TelaDetalhes: View {
    let musica: Musica

    var body: some View {
        Text(musica.nome)
            .font(.custom("Georgia", size: 30))
    }
}
