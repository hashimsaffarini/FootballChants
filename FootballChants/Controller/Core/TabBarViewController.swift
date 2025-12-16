//
//  ChantsTabBarViewController.swift
//  FootballChants
//
//  Created by Hashim Saffarini on 16/12/2025.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
    private func setupTabs() {
        let chantsVC = ChantsViewController()
        let playersVC = PlayersViewController()
        let favoritesVC = FavoritesViewController()
        
        chantsVC.navigationItem.largeTitleDisplayMode = .automatic
        playersVC.navigationItem.largeTitleDisplayMode = .automatic
        favoritesVC.navigationItem.largeTitleDisplayMode = .automatic
        
        let nav1 = UINavigationController(rootViewController: chantsVC)
        let nav2 = UINavigationController(rootViewController: playersVC)
        let nav3 = UINavigationController(rootViewController: favoritesVC)
        
        nav1.tabBarItem = UITabBarItem(title: "Teams", image: UIImage(systemName: "person.3.fill"), tag: 0)
        nav2.tabBarItem = UITabBarItem(title: "Players", image: UIImage(systemName: "sportscourt.fill"), tag: 1)
        nav3.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "star.fill"), tag: 2)
        
        
        for nav in [nav1, nav2 , nav3]{
            nav.navigationBar.prefersLargeTitles = true
        }
        
        setViewControllers([nav1, nav2 , nav3], animated: true)
    }

}
