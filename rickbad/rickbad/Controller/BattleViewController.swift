//
//  BattleViewController.swift
//  rickbad
//
//  Created by Valeria Fuster on 03/09/22.
//

import UIKit

class BattleViewController: UIViewController {
    
    private var charactersRicks: [CharacterRickMorty] = []
    private var charactersBad: [CharacterBad] = []
    
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
        estadoTelaQuandoInicia()
        requestChacacter()
        setupLayoutButton()
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
                    let results = try decoder.decode(CharacterRickMortyResponse.self, from: data)
                    self.charactersRicks = results.results
                    print(results)
                    
                    guard let urlBad = URL(string: "https://www.breakingbadapi.com/api/characters") else {
                        return
                    }
                    
                    let requestBad = URLRequest(url: urlBad)
                    request.httpMethod = "GET"
                    
                    let taskBad = URLSession.shared.dataTask(with: requestBad) { (dataBad, responseBad, errorBad) in
                        
                        if let errorBad = errorBad {
                            print("Error took place Bad \(errorBad)")
                            return
                        }
                        
                        if let dataBad = dataBad {
                            do {
                                let resultsBad = try decoder.decode([CharacterBad].self, from: dataBad)
                                self.charactersBad = resultsBad
                                print(resultsBad)
                                
                                // mudar aqui o estado da tela
                                DispatchQueue.main.async {
                                    self.mudarEstadoTelaPraConteudo()
                                }

                            } catch {
                                print(error)
                            }
                        }
                    }
                    taskBad.resume()
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    private func setupViewCarregamento() {
        
        messageLoading.textColor = UIColor.white
        
        viewFirstImage.backgroundColor = UIColor(red: 50/255, green: 51/255, blue: 50/255, alpha: 1)
        viewFirstImage.layer.cornerRadius = 25
        
        namePersonOne.textColor = UIColor.white
    }
    
    private func setupViewBatalha() {
        viewSecondImage.backgroundColor = UIColor(red: 50/255, green: 51/255, blue: 50/255, alpha: 1)
        viewSecondImage.layer.cornerRadius = 25
        
        namePersonTwo.textColor = UIColor.white
    }
    
    private func mudarEstadoTelaPraConteudo() {
        loadingContainer.isHidden = true
        contentContainer.isHidden = false
        setupButtonBattleEnable()
        
        let randomRick = charactersRicks.randomElement()
        let randomBad = charactersBad.randomElement()
        
        namePersonOne.text = randomBad?.name
        namePersonTwo.text = randomRick?.name
        
        guard let urlString = randomRick?.image, let urlRick = URL(string: urlString) else {
            return
        }
        
        let taskRickImage = URLSession.shared.dataTask(with: urlRick) { (data, response, responseError) in

            if let imageRick = data {
                DispatchQueue.main.async {
                    self.secondImage.image = UIImage(data: imageRick)
                }
            }
        }
        taskRickImage.resume()
        
        guard let urlStringBad = randomBad?.img, let urlBad = URL(string: urlStringBad) else {
            return
        }
        
        let taskBadImage = URLSession.shared.dataTask(with: urlBad) { (data, response, responseError) in
            
            if let imageBad = data {
                DispatchQueue.main.async {
                    self.firstImage.image = UIImage(data: imageBad)
                }
            }
        }
        taskBadImage.resume()
    }
    
    private func estadoTelaQuandoInicia() {
        loadingContainer.isHidden = false
        contentContainer.isHidden = true
        setupButtonBattleDisable()
    }
    
    private func setupLayoutButton() {
        buttonStartBattle.layer.cornerRadius = 20
        buttonStartBattle.tintColor = .white
    }
    
    private func setupButtonBattleEnable() {
        buttonStartBattle.isEnabled = true
        buttonStartBattle.backgroundColor = UIColor(red: 47/255, green: 147/255, blue: 33/255, alpha: 1)
    }
    
    private func setupButtonBattleDisable() {
        buttonStartBattle.isEnabled = false
        buttonStartBattle.backgroundColor = .lightGray
    }
    
    @IBAction func startBattle(_ sender: Any) {
        
        guard let nomePersonagemUm = namePersonOne.text, let nomePersonagemDois = namePersonTwo.text else {
            return
        }
        
        let tamanhoNomeBad = nomePersonagemUm.count
        let tamanhoNomeRick = nomePersonagemDois.count
        
        if tamanhoNomeBad > tamanhoNomeRick {
            showAlert(ganhador: nomePersonagemUm)
        } else {
            showAlert(ganhador: nomePersonagemDois)
        }

    }
    
    private func showAlert(ganhador: String) {
        let alert = UIAlertController(title: "Resultado", message: "O ganhador da batalha é: \(ganhador)", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Fechar", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Nova Batalha", style: .default, handler: { _ in
            self.mudarEstadoTelaPraConteudo()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}
