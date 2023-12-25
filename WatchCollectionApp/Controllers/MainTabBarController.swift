//
//  MainTabBarController.swift
//  WatchCollectionApp
//
//  Created by Fatih Yörük on 18.12.2023.
//

import UIKit

final class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabs()
    }
    
    private func setUpTabs() {
        let home = HomeViewController()
        let vc1 = UINavigationController(rootViewController: home)
        vc1.tabBarItem = UITabBarItem(title: "Home",
                                      image: UIImage(systemName: "house"),
                                      tag: 1)
        for nav in [vc1] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        setViewControllers(
            [vc1],
            animated: true
        )
    }
}
