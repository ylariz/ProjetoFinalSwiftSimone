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
                ScrollView(.horizontal){
                    HStack(spacing: 16){
                        ForEach(viewModel.musicasGet){ musica in
                            VStack(spacing: 12){
                                AsyncImage(url: URL(string: musica.capaURL)) { fase in
                                    switch fase {
                                    case .empty:
                                        ProgressView()
                                    case .success(let imagem):
                                        imagem
                                            .resizable()
                                            .scaledToFill()
                                    case .failure:
                                        Image(systemName: "music.note")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 80, height: 80)
                                            .foregroundStyle(.gray)
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                                .frame(width: 240, height: 240)
                                .background(Color(red: 0.80, green: 0.76, blue: 0.89))
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                
                                Text(musica.nome)
                                    .font(.custom("Georgia", size: 22))
                                    .foregroundStyle(Color(red: 0.25, green: 0.20, blue: 0.15))
                                    .lineLimit(1)
                            }
                            .frame(width: 240)
                        
                        }
                    }
                    .scrollTargetLayout()
                //.background(Color(red: 0.80, green: 0.76, blue: 0.89))
                
                }
                .scrollTargetBehavior(.viewAligned)
                .scrollIndicators(.hidden)
                
                Text("Arraste para explorar as músicas")
                    .font(.custom("Georgia", size: 16))
                    .foregroundStyle(.gray)
                    
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
