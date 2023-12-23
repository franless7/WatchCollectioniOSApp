//
//  HomeViewController.swift
//  WatchCollectionApp
//
//  Created by Fatih Yörük on 23.12.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    var selectedBrandName: String?
    var selectedFamilyName: String?
    var selectedModelNumber: String?
    
    var allWatches: [Watch] = []
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        getAllWatches()
        tableView.frame = view.bounds
        view.addSubview(tableView)
    }
    
    func getAllWatches() {
        guard let brandName = selectedBrandName,
              let familyName = selectedFamilyName,
              let modelName = selectedModelNumber else {
            return
        }
        
        WDService.shared.execute(
            WDRequest(endpoint: .allwatches),
            brandName: brandName,
            familyName: familyName,
            modelName: modelName,
            excepting: [Watch].self)
        { result in
            switch result {
            case .success(let watches):
                self.allWatches = watches
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allWatches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let watch = allWatches[indexPath.row]
        cell.textLabel?.text = watch.watchName
        return cell
    }
}

