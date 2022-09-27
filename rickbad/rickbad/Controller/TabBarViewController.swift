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
        
        setViewControllers([createBattleController(), createHistoryController()], animated: true)
        selectedIndex = 0
        setupTabBar()
    }
    
    private func createBattleController() -> UINavigationController {
        let battleController = BattleViewController()
        battleController.tabBarItem = UITabBarItem(title: "Batalhas", image: UIImage(systemName: "house"), tag: 0)
        
        let navigationController = UINavigationController(rootViewController: battleController)
        return navigationController
    }
    
    private func createHistoryController() -> UINavigationController {
        let historyController = HistoryViewController()
        historyController.tabBarItem = UITabBarItem(title: "Histórico", image: UIImage(systemName: "leaf.fill"), tag: 0)
        
        let navigationController = UINavigationController(rootViewController: historyController)
        return navigationController
    }
    
    private func setupTabBar(){
        tabBar.barTintColor = .black
        tabBar.isTranslucent = false
        tabBar.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        tabBar.tintColor = .green
    }
}
