//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Luiz Antônio da Silva Júnior on 06/12/20.
//

import UIKit

protocol AdicionarRefeicaoDelegate {
    func adicionar(_ refeicao:Refeicao)
}

class RefeicaoViewController: UIViewController, UITableViewDataSource {

    var delegate: AdicionarRefeicaoDelegate?
    let itens = ["Farinha", "Açucar", "Sal", "Pimenta", "Chocolate"]
    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var felicidadeTextField: UITextField?
    
    
    @IBAction func adicionar(_ sender: Any) {
        
        if
        let nome = nomeTextField?.text,
        let felicidadeText =  felicidadeTextField?.text,
        let felicidade = Int(felicidadeText) {
            let refeicao = Refeicao(nome: nome, felicidade: felicidade)
            delegate?.adicionar(refeicao)
            
            navigationController?.popViewController(animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell()
        let item = itens[indexPath.row]
        celula.textLabel?.text = item
        
        return celula
    }
}
