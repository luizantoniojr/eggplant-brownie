//
//  Refeicao.swift
//  eggplant-brownie
//
//  Created by Luiz Antônio da Silva Júnior on 07/12/20.
//

import UIKit

class Refeicao: NSObject {

    let nome: String
    let felicidade: Int
    let itens: [Item]
    
    init(_ nome: String, _ felicidade: Int, _ itens: [Item] = []) {
        self.nome = nome
        self.felicidade = felicidade
        self.itens = itens
    }
    
    func obterTotalDeCalorias() -> Double {
        var total = 0.0
        
        for item in itens {
            total = item.calorias
        }
        
        return total
    }
}
