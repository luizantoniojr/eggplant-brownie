//
//  RefeicaoDao.swift
//  eggplant-brownie
//
//  Created by Luiz Antônio da Silva Júnior on 27/12/20.
//

import Foundation

class RefeicaoDao {
    
    let dao = BaseDao(fileName: String(describing: Refeicao.self))
    
    func Salvar(_ refeicoes: [Refeicao]) throws {
        try dao.Salvar(lista: refeicoes)
    }
    
    func Ler() throws -> [Refeicao] {
        return try dao.Ler() as! [Refeicao];
    }
}
