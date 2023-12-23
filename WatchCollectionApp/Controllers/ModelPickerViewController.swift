//
//  ModelPickerViewController.swift
//  WatchCollectionApp
//
//  Created by Fatih Yörük on 23.12.2023.
//

import UIKit

class ModelPickerViewController: UIViewController {

    var selectedBrandName: String?
    var selectedFamilyName: String?
    var selectedModelNumber: String?
    
    private var modelData: [Model] = []
  
    private lazy var modelNamePicker: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Select Family"
        modelNamePicker.delegate = self
        modelNamePicker.dataSource = self
        getModelNameData()
        view.addSubview(modelNamePicker)
    }

    
    private func getModelNameData() {
        guard let brandName = selectedBrandName,
        let familyName = selectedFamilyName else {
            return
        }
        
        WDService.shared.execute(WDRequest(endpoint: .allmodels), 
                                 brandName: brandName,
                                 familyName: familyName,
                                 excepting: [Model].self) { result in
            switch result {
            case .success(let modelName):
                self.modelData = modelName
                DispatchQueue.main.async {
                    self.modelNamePicker.reloadAllComponents()
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    override func viewDidLayoutSubviews() {
        modelNamePicker.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 400)
        modelNamePicker.center = view.center
    }
}

extension ModelPickerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return modelData[row].modelName
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return modelData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedmodelNumber = modelData[row].modelName
        let homeVC = HomeViewController()
        homeVC.selectedBrandName = selectedBrandName
        homeVC.selectedFamilyName = selectedFamilyName
        homeVC.selectedModelNumber = selectedmodelNumber
        navigationController?.pushViewController(homeVC, animated: true)
    }
}

