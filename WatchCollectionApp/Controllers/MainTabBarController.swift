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
        let brand = BrandPickerViewController()
        let family = FamilyPickerViewController()
        let model = ModelPickerViewController()
        let home = HomeViewController()
        
        let vc1 = UINavigationController(rootViewController: brand)
        let vc2 = UINavigationController(rootViewController: family)
        let vc3 = UINavigationController(rootViewController: model)
        let vc4 = UINavigationController(rootViewController: home)
        
        vc1.tabBarItem = UITabBarItem(title: "",
                                      image: UIImage(systemName: ""),
                                      tag: 1)
        vc2.tabBarItem = UITabBarItem(title: "",
                                      image: UIImage(systemName: ""),
                                      tag: 2)
        vc3.tabBarItem = UITabBarItem(title: "",
                                      image: UIImage(systemName: ""),
                                      tag: 3)
       
        
        for nav in [vc1, vc2, vc3, vc4] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        setViewControllers(
            [vc1, vc2, vc3, vc4],
            animated: true
        )
    }
}
