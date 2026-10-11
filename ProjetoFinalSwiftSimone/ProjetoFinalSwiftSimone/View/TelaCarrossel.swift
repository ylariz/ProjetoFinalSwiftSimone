//
//  TelaCarrossel.swift
//  ProjetoFinalSwiftSimone
//
//  Created by LARISSA SILVA LEITE on 10/10/26.
//

import SwiftUI

struct TelaCarrossel: View {
    let artista: Artista
    @State private var viewModel = MusicasViewModel()
    
    var body: some View {
        VStack(spacing: 20){
            Text(artista.nome)
                .font(.custom("Georgia", size: 34))
                .foregroundStyle(Color(red: 0.25, green: 0.20, blue: 0.15))
            if viewModel.carregandoGet{
                ProgressView("Carregando musicas")
            }else if let erro = viewModel.mensagemErroGet {
                Text(erro)
                    .font(.custom("Georgia", size: 18))
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
            }else{
                ForEach(viewModel.musicasGet) { musica in
                    Text(musica.nome)
                        .font(.custom("Georgia", size: 20))
                    
                }
            }
            Spacer()
            
        }
        .padding(20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.95, green: 0.94, blue: 0.98))
        .task {
            await viewModel.buscarMusicas(termo: artista.termoBusca)
        }
    }
}

#Preview {
    TelaCarrossel(artista: Artista(nome: "Clairo", termoBusca: "clairo", foto: "clairo"))
}
