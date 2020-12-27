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
    let itemDao = ItemDao()
    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var felicidadeTextField: UITextField?
    @IBOutlet weak var itensTableView: UITableView?
    
    override func viewDidLoad() {
        let botaoAdicionar = UIBarButtonItem(title: "Adicionar", style: .plain, target: self, action: #selector(abriAdicionarItem))
        navigationItem.rightBarButtonItem = botaoAdicionar
        
        carregarItens()
    }
    
    private func carregarItens() {
        do {
            itens = try itemDao.ler()
            reloadData()
        } catch {
            Alerta(controller: self).exibir(message: "Não foi possível ler os itens")
        }
    }

    @objc func abriAdicionarItem() {
        let adicionarItensViewController = AdicionarItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    
    func adicionarItem(_ item: Item) {
        do {
            itens.append(item)
            try itemDao.salvar(itens)
            reloadData()
        } catch {
            itens.removeLast()
            Alerta(controller: self).exibir(message: "Não foi possível salvar os itens")
        }
    }
    
    private func reloadData() {
        if let tableView = itensTableView {
            tableView.reloadData()
        } else {
            Alerta(controller: self).exibir(message: "Não foi possível atualizar a tabela")
        }
    }
    
    @IBAction func adicionar(_ sender: Any) {
        if let refeicao = obterReficaoDoFormulario() {
            delegate?.adicionar(refeicao)
            navigationController?.popViewController(animated: true)
        }
    }
    
    func obterReficaoDoFormulario() -> Refeicao? {
        if
        let nome = nomeTextField?.text,
        let felicidadeText =  felicidadeTextField?.text,
        let felicidade = Int(felicidadeText) {
            return Refeicao(nome, felicidade, itensSelecionados)
        } else {
            Alerta(controller: self).exibir(message: "Erro ao ler campos do formulário")
            return nil
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
