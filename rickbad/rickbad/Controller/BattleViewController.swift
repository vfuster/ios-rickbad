//
//  BattleViewController.swift
//  rickbad
//
//  Created by Valeria Fuster on 03/09/22.
//

import UIKit

class BattleViewController: UIViewController {
    
    // Outlets View Carregamento
    @IBOutlet weak var iconLoading: UIImageView!
    @IBOutlet weak var messageLoading: UILabel!
    
    // Outlets View Batalha
    @IBOutlet weak var buttonStartBattle: UIButton!
    
    @IBOutlet weak var viewFirstImage: UIView!
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var namePersonOne: UILabel!
    
    
    @IBOutlet weak var viewSecondImage: UIView!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var namePersonTwo: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewCarregamento()
        setupViewBatalha()
        
    }
    
    func setupViewCarregamento() {
        
        messageLoading.textColor = UIColor.white
        
        viewFirstImage.backgroundColor = UIColor(red: 50/255, green: 51/255, blue: 50/255, alpha: 1)
        viewFirstImage.layer.cornerRadius = 25
        
        namePersonOne.textColor = UIColor.white
    }
    
    func setupViewBatalha() {
        viewSecondImage.backgroundColor = UIColor(red: 50/255, green: 51/255, blue: 50/255, alpha: 1)
        viewSecondImage.layer.cornerRadius = 25
        
        namePersonTwo.textColor = UIColor.white
    }
}
