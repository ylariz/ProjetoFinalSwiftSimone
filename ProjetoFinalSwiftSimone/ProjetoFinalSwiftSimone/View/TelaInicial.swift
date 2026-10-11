//
//  TelaInicial.swift
//  ProjetoFinalSwiftSimone
//
//  Created by LARISSA SILVA LEITE on 10/10/26.
//


import SwiftUI

struct TelaInicial: View {
    let artistas: [Artista] = [
        Artista(nome: "Clairo", termoBusca: "clairo", foto: "clairo"),
        Artista(nome: "sombr", termoBusca: "sombr", foto: "sombr"),
        Artista(nome: "Olivia Rodrigo", termoBusca: "olivia+rodrigo", foto: "olivia")
    ]

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Meu Espaço Musical")
                    .font(.custom("Georgia", size: 34))
                    .foregroundStyle(Color(red: 0.25, green: 0.20, blue: 0.15))

                Text("Escolha um artista")
                    .font(.custom("Georgia", size: 18))
                    .foregroundStyle(.gray)
                    .padding(.bottom, 10)

                ForEach(artistas, id: \.nome) { artista in
                    NavigationLink(value: artista) {
                        HStack(spacing: 16) {
                            Image(artista.foto)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 150)
                                .clipShape(RoundedRectangle(cornerRadius: 16))

                            Text(artista.nome)
                                .font(.custom("Georgia", size: 26))
                                .foregroundStyle(Color(red: 0.25, green: 0.20, blue: 0.15))

                            Spacer()

                            Image(systemName: "chevron.right")
                                .foregroundStyle(.gray)
                        }
                        .padding(12)
                        .background(Color(red: 0.80, green: 0.76, blue: 0.89))
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                    }
                    .buttonStyle(.plain)
                }

                Spacer()
            }
            .padding(20)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.95, green: 0.94, blue: 0.98))
            .navigationDestination(for: Artista.self) { artista in
                TelaCarrossel(artista: artista)
            }
        }
    }
}

#Preview {
    TelaInicial()
}


// tela toda .background(Color(red: 0.97, green: 0.94, blue: 0.89))
// cards .background(Color(red: 0.94, green: 0.86, blue: 0.84))
