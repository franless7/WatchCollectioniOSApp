//
//  FamilyPickerViewController.swift
//  WatchCollectionApp
//
//  Created by Fatih Yörük on 21.12.2023.
//

import UIKit

class FamilyPickerViewController: UIViewController {
  
    var selectedBrandName: String?
    var selectedFamilyName: String?
    
    private var familyData: [Family] = []
  
    private lazy var familyPicker: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Select Family"
        familyPicker.delegate = self
        familyPicker.dataSource = self
        getFamilyData()
        view.addSubview(familyPicker)
    }

    // MARK: - Functions

    private func getFamilyData() {
        guard let brandName = selectedBrandName else {
            return
        }
        
        WDService.shared.execute(WDRequest(endpoint: .allfamily), brandName: brandName, excepting: [Family].self) { result in
            switch result {
            case .success(let familyData):
                self.familyData = familyData
                DispatchQueue.main.async {
                    self.familyPicker.reloadAllComponents()
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    override func viewDidLayoutSubviews() {
        familyPicker.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 400)
        familyPicker.center = view.center
    }
}

extension FamilyPickerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return familyData[row].familyName
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return familyData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedFamilyName = familyData[row].familyName
        let modelPickerVC = ModelPickerViewController()
        modelPickerVC.selectedBrandName = selectedBrandName
        modelPickerVC.selectedFamilyName = selectedFamilyName
        navigationController?.pushViewController(modelPickerVC, animated: true)
    }
}

