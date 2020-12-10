//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Luiz Antônio da Silva Júnior on 08/12/20.
//

import UIKit

class RefeicoesTableViewController : UITableViewController {
    
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
        
        return cell
    }
    
    func adicionar(refeicao:Refeicao) {
        refeicoes.append(refeicao)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? RefeicaoViewController {
            viewController.tableViewController = self
        }
    }
}
