//
//  Item.swift
//  eggplant-brownie
//
//  Created by Luiz Antônio da Silva Júnior on 07/12/20.
//

import UIKit

class Item: NSObject {
    let nome: String
    let calorias: Double
    
    init(nome: String, calorias:Double) {
        self.nome = nome
        self.calorias = calorias
    }
}
