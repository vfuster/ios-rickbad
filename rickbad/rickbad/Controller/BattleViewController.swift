//
//  BattleViewController.swift
//  rickbad
//
//  Created by Valeria Fuster on 03/09/22.
//

import UIKit

class BattleViewController: UIViewController {
    
    private var charactersRicks: [CharacterRickMorty] = []
    
    // Outlets View Carregamento
    @IBOutlet weak var loadingContainer: UIView!
    
    @IBOutlet weak var iconLoading: UIImageView!
    @IBOutlet weak var messageLoading: UILabel!
    
    // Outlets View Batalha
    @IBOutlet weak var contentContainer: UIView!
    
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
        loadingContainer.isHidden = false
        contentContainer.isHidden = true
        requestChacacter()
        
    }
    
    private func requestChacacter() {
        
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in

            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let results = try
                    decoder.decode(CharacterRickMortyResponse.self, from: data)
                    self.charactersRicks = results.results
                    print(results)
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
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
