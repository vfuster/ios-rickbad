//
//  HistoryViewController.swift
//  rickbad
//
//  Created by Valeria Fuster on 03/09/22.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var historyTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        historyTableView.dataSource = self
    }
    
    private func registerCell() {
        let xibHistoryCell = UINib(nibName: "HistoryCell", bundle: nil)
        let indentifierHistoryCell = "HistoryCell"
        historyTableView.register(xibHistoryCell, forCellReuseIdentifier: indentifierHistoryCell)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let winnerCell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath) as! HistoryCell
        
        winnerCell.setupCell()
        
        return winnerCell
        
    }

}
