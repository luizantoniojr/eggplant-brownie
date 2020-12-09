//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Luiz Antônio da Silva Júnior on 08/12/20.
//

import UIKit

class RefeicoesTableViewController : UITableViewController {
    
    let refeicoes = [Refeicao(nome: "Macarrão",felicidade: 5), Refeicao(nome: "Churros",felicidade: 4)]
    
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
        
        //ToDo:Ajustar cores
        selectedCell.textLabel?.textColor = UIColor.white
        selectedCell.textLabel?.highlightedTextColor = UIColor.white
        selectedCell.backgroundColor = UIColor.black
        cell.selectedBackgroundView = selectedCell
        
        return cell
    }
}
