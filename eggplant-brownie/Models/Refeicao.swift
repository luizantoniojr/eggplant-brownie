//
//  Refeicao.swift
//  eggplant-brownie
//
//  Created by Luiz Antônio da Silva Júnior on 07/12/20.
//

import UIKit

class Refeicao: NSObject, NSCoding {
    
    let nome: String
    let felicidade: Float
    let itens: [Item]
    
    init(_ nome: String, _ felicidade: Float, _ itens: [Item] = []) {
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
    
    func obterDetalhes() -> String {
        var detalhes = "Felicidade \(Int(self.felicidade))"
        for item in self.itens {
            detalhes += ", \(item.nome) - calorias: \(item.calorias)"
        }
        return detalhes;
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(nome, forKey: "nome")
        coder.encode(felicidade, forKey: "felicidade")
        coder.encode(itens, forKey: "itens")
    }
    
    required init?(coder: NSCoder) {
        nome = coder.decodeObject(forKey: "nome") as! String
        felicidade = coder.decodeFloat(forKey: "felicidade")
        itens = coder.decodeObject(forKey: "itens") as! [Item]
    }
}
