//
//  BaseDao.swift
//  eggplant-brownie
//
//  Created by Luiz Antônio da Silva Júnior on 27/12/20.
//

import Foundation

class BaseDao {
    
    let fileName: String
    
    init(fileName: String) {
        self.fileName =  fileName
    }
    
    func Salvar(lista: [Any]) throws {
        if let caminho = obterCaminho() {
            let dados = try NSKeyedArchiver.archivedData(withRootObject: lista, requiringSecureCoding: false)
            try dados.write(to: caminho)
        }
    }
    
    func Ler() throws -> [Any] {
        if let caminho = obterCaminho() {
            let dados = try Data(contentsOf: caminho)
            if let lista = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as? [Any] {
                return lista
            }
        }
        return Array<Any>()
    }
    
    private func obterCaminho() -> URL? {
        let diretorios = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        guard let diretorio = diretorios.first else {
            return nil
        }
        return diretorio.appendingPathComponent(fileName)
    }
}
