//
//  Alerta.swift
//  eggplant-brownie
//
//  Created by Luiz Antônio da Silva Júnior on 26/12/20.
//
import UIKit

import Foundation

class Alerta {
    
    var viewController: UIViewController
    
    init(controller: UIViewController) {
        self.viewController = controller
    }
    
    func exibir(title: String = "Atenção", message: String) {
        self.exibir(title: title, message: message, actions: nil)
    }
    
    func exibir(title: String = "Atenção", message: String, actions: [UIAlertAction]?) {
    
        let alerta = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if let actions = actions {
            for action in actions {
                alerta.addAction(action)
            }
        } else {
            let btnOk = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alerta.addAction(btnOk)
        }
        
        viewController.present(alerta, animated: true, completion: nil)
    }
}
