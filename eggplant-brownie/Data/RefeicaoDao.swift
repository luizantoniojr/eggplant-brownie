//
//  RefeicaoDao.swift
//  eggplant-brownie
//
//  Created by Luiz Antônio da Silva Júnior on 27/12/20.
//

import Foundation

class RefeicaoDao {
    
    let dao = BaseDao(fileName: String(describing: Refeicao.self))
    
    func salvar(_ refeicoes: [Refeicao]) throws {
        try dao.salvar(refeicoes)
    }
    
    func ler() throws -> [Refeicao] {
        return try dao.ler() as! [Refeicao];
    }
    
    func remover(at index: Int) throws {
        try dao.remover(at: index)
    }
}
