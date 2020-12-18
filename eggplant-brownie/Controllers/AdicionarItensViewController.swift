//
//  AdicionarItensViewController.swift
//  eggplant-brownie
//
//  Created by Luiz Antônio da Silva Júnior on 17/12/20.
//

import UIKit

protocol AdicionarItemDelegate {
    func adicionarItem(_ item:Item)
}

class AdicionarItensViewController: UIViewController {

    var delegate: AdicionarItemDelegate?
    
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var caloriaTextField: UITextField?
    
    init(delegate: AdicionarItemDelegate) {
        super.init(nibName: "AdicionarItensViewController" , bundle: nil)
        self.delegate = delegate
    } 
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @IBAction func adicionar(_ sender: Any) {
        
        if
            let nome = nomeTextField?.text,
            let caloriaText = caloriaTextField?.text,
            let caloria = Double.init(caloriaText) {
            
            let item = Item(nome: nome, calorias: caloria)
            
            delegate?.adicionarItem(item);
            
            navigationController?.popViewController(animated: true)
        }
    }
}
