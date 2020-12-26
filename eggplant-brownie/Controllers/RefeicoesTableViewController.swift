//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Luiz Antônio da Silva Júnior on 08/12/20.
//

import UIKit

class RefeicoesTableViewController : UITableViewController, AdicionarRefeicaoDelegate {
    
    var refeicoes = Array<Refeicao>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = UIColor.systemGreen
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let refeicao = refeicoes[indexPath.row]
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        cell.textLabel?.text = refeicao.nome
        cell.backgroundColor = UIColor.systemGreen
        
        let selectedCell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        selectedCell.textLabel?.text = refeicao.nome
        selectedCell.backgroundColor = UIColor.green
        cell.selectedBackgroundView = selectedCell
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(mostrarDetalhe))
        cell.addGestureRecognizer(longPress)
        
        return cell
    }
    
    @objc func mostrarDetalhe(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            let celula = gesture.view as! UITableViewCell
            if let indexPath = tableView.indexPath(for: celula) {
                let refeicao = refeicoes[indexPath.row]
                Alerta(controller: self).exibir(title: refeicao.nome, message: refeicao.obterDetalhes())
            }
        }
    }
    
    func adicionar(_ refeicao:Refeicao) {
        refeicoes.append(refeicao)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if
        segue.identifier == "adicionar",
        let viewController = segue.destination as? RefeicaoViewController {
                viewController.delegate = self
            }
    }
}
