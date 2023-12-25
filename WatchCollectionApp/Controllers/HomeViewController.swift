//
//  HomeViewController.swift
//  WatchCollectionApp
//
//  Created by Fatih Yörük on 23.12.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let brandListView = BrandListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Home"
        setUpView()
    }
    
    private func setUpView() {
        view.addSubview(brandListView)
        NSLayoutConstraint.activate([
            brandListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            brandListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            brandListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            brandListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor)
        ])
    }
}


   


