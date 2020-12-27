//
//  ItemDao.swift
//  eggplant-brownie
//
//  Created by Luiz Antônio da Silva Júnior on 27/12/20.
//

import Foundation

class ItemDao {
    
    let dao = BaseDao(fileName: String(describing: Item.self))
    
    func Salvar(_ itens: [Item]) throws {
        try dao.Salvar(lista: itens)
    }
    
    func Ler() throws -> [Item] {
        return try dao.Ler() as! [Item];
    }
}
