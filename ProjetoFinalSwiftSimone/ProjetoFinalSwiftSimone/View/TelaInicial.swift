//
//  TelaInicial.swift
//  ProjetoFinalSwiftSimone
//
//  Created by LARISSA SILVA LEITE on 10/10/26.
//


import SwiftUI

struct TelaInicial: View{
    let artistas: [Artista] = [
        Artista(nome: "Clairo", termoBusca: "clairo", foto: "clairo"),
        
        Artista(nome: "Sombr", termoBusca: "sombr", foto: "sombr"),
        
        Artista(nome: "Olivia Rodrigo", termoBusca: "olivia+rodrigo", foto: "olivia")
    ]
    
    var body: some View{
        VStack(spacing: 20){
            Text("Meu Espaço Musical")
                .font(.custom("Georgia", size: 34))
                .foregroundStyle(Color(red: 0.25, green: 0.20, blue: 0.15))
            
            Text("Escolha Um Artista")
                .font(.custom("Georgia", size: 18))
                .foregroundStyle(.gray)
                .padding(.bottom, 10)
            
            ForEach(artistas, id: \.nome) { artista in
                HStack(spacing: 16){
                    Image(artista.foto)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 175, height: 175)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                    
                    Text(artista.nome)
                        .font(.custom("Georgia", size: 26))
                        .foregroundStyle(Color(red: 0.25, green: 0.20, blue: 0.15))
                    
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.black)
                }
                .padding(12)
                .backgroundStyle(Color(red: 0.90, green: 0.91, blue: 0.84))
                .clipShape(RoundedRectangle(cornerRadius: 24))
            }
            Spacer()
        
        }
        .padding(20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.97, green: 0.94, blue: 0.89))
    }
}

#Preview {
    TelaInicial()
}
