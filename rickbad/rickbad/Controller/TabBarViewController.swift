//
//  TabBarViewController.swift
//  rickbad
//
//  Created by Valeria Fuster on 03/09/22.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewControllers([createBattleController()], animated: true)
        selectedIndex = 0
        setupTabBar()
    }
    
    private func createBattleController() -> UINavigationController {
        
        let battleController = BattleViewController()
        battleController.tabBarItem = UITabBarItem(title: "Batalha", image: UIImage(systemName: "house.fill"), tag: 0)
        
        let navigationController = UINavigationController(rootViewController: battleController)
        return navigationController
    }
    
    private func setupTabBar(){
        tabBar.barTintColor = .black
        tabBar.isTranslucent = false
        tabBar.backgroundColor = UIColor(red: 0.27, green: 0.733, blue: 0.938, alpha: 1)
    }
}
