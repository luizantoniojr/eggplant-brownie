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

class RefeicaoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionarItemDelegate {
    
    var delegate: AdicionarRefeicaoDelegate?
    var itens: [Item] = []
    var itensSelecionados: [Item] = []
    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var felicidadeTextField: UITextField?
    @IBOutlet weak var ItensTableView: UITableView?
    
    override func viewDidLoad() {
        let botaoAdicionar = UIBarButtonItem(title: "Adicionar", style: .plain, target: self, action: #selector(abriAdicionarItem))
        navigationItem.rightBarButtonItem = botaoAdicionar
    }

    @objc func abriAdicionarItem() {
        let adicionarItensViewController = AdicionarItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    
    func adicionarItem(_ item: Item) {
        itens.append(item)
        ItensTableView?.reloadData()
    }
    
    @IBAction func adicionar(_ sender: Any) {
        
        if
        let nome = nomeTextField?.text,
        let felicidadeText =  felicidadeTextField?.text,
        let felicidade = Int(felicidadeText) {
            let refeicao = Refeicao(nome, felicidade, itensSelecionados)
            
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
        celula.textLabel?.text = item.nome
        
        return celula
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = itens[indexPath.row]
        
        if let celula = tableView.cellForRow(at: indexPath) {
            if celula.accessoryType == .none {
                celula.accessoryType = .checkmark
                itensSelecionados.append(item)
            } else {
                celula.accessoryType = .none
                if let position = itensSelecionados.firstIndex(of: item) {
                    itensSelecionados.remove(at: position)
                }
            }
        }
    }
}
