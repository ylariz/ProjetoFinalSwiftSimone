//
//  MusicasViewModel.swift
//  ProjetoFinalSwiftSimone
//
//  Created by LARISSA SILVA LEITE on 10/10/26.
//

import Foundation

@Observable
class MusicasViewModel{
    private var musicas: [Musica] = []
    private var carregando: Bool = true
    private var mensagemErro: String? = nil
    private let service = MusicaService()
    
    public var musicasGet: [Musica] {
        get{
            return self.musicas
        }
    }
    
    public var carregandoGet: Bool{
        get {
            return self.carregando
        }
    }
    
    public var mensagemErroGet: String?{
        get {
            return self.mensagemErro
        }
    }
    
    func buscarMusicas(termo: String) async {
        carregando = true
        mensagemErro = nil
        
        do{
            musicas = try await service.buscarMusicas(termo: termo)
        }catch{
            mensagemErro = "Não foi possivel carregar as músicas. Verifique a internet"
        }
        carregando = false
    }
    
    func duracaoFormatada(musica: Musica) -> String {
        let totalSegundos = musica.duracaoMillis / 1000
        let minutos = totalSegundos / 60
        let segundos = totalSegundos % 60
        return String(format: "%d:02d", minutos, segundos)
    }
    
    func dataFormatada(musica: Musica) -> String {
        let leitor = ISO8601DateFormatter()
        guard let data = leitor.date(from: musica.dataLancamento) else{
            return musica.dataLancamento
        }
        
        let formatador = DateFormatter()
        formatador.dateFormat = "dd/MM/yyyy"
        return formatador.string(from: data)
    }
}
