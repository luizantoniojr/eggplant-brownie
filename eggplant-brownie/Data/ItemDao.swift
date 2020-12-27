//
//  ItemDao.swift
//  eggplant-brownie
//
//  Created by Luiz Antônio da Silva Júnior on 27/12/20.
//

import Foundation

class ItemDao {
    
    let dao = BaseDao(fileName: String(describing: Item.self))
    
    func salvar(_ itens: [Item]) throws {
        try dao.salvar(itens)
    }
    
    func ler() throws -> [Item] {
        return try dao.ler() as! [Item];
    }
}
