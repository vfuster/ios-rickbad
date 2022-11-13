//
//  HistoryViewController.swift
//  rickbad
//
//  Created by Valeria Fuster on 03/09/22.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource {
    
    private var battles: [Battle] = []
    private let key = "battle-key"
    
    @IBOutlet weak var historyTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        historyTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        readBattlesFromUserDefaults()
        historyTableView.reloadData()

    }
    
    private func registerCell() {
        let xibHistoryCell = UINib(nibName: "HistoryCell", bundle: nil)
        let indentifierHistoryCell = "HistoryCell"
        historyTableView.register(xibHistoryCell, forCellReuseIdentifier: indentifierHistoryCell)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return battles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let winnerCell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath) as! HistoryCell
        
        let battle = battles[indexPath.row]
        winnerCell.setupCell(battle: battle)
        
        return winnerCell
        
    }
    
    private func readBattlesFromUserDefaults() {
        let decoder = JSONDecoder()
        let userDefaults = UserDefaults.standard
        
        if let data = userDefaults.value(forKey: key) as? Data,
           let battlesDecode = try? decoder.decode([Battle].self, from: data) {
            self.battles = battlesDecode.reversed()
        }
    }
}
