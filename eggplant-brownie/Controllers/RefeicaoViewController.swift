//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Luiz Antônio da Silva Júnior on 06/12/20.
//

import UIKit

class RefeicaoViewController: UIViewController {

    var tableViewController: RefeicoesTableViewController?
    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var felicidadeTextField: UITextField?
    
    @IBAction func adicionar(_ sender: Any) {
        
        if
        let nome = nomeTextField?.text,
        let felicidadeText =  felicidadeTextField?.text,
        let felicidade = Int(felicidadeText){
            
            let refeicao = Refeicao(nome: nome, felicidade: felicidade)
            
            tableViewController?.adicionar(refeicao: refeicao)
            
            navigationController?.popViewController(animated: true)
        }
    }
}
