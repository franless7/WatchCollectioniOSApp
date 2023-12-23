//
//  BrandPickerViewController.swift
//  WatchCollectionApp
//
//  Created by Fatih Yörük on 21.12.2023.
//

import UIKit

class BrandPickerViewController: UIViewController {
    
    private var brand: [Brand] = []

    private lazy var brandPicker: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Select Brand Type"
        view.addSubview(brandPicker)
        
        brandPicker.delegate = self
        brandPicker.dataSource = self
        
        getBrandData()
    }
    
    // MARK: - Functions

    private func getBrandData() {
        WDService.shared.execute(WDRequest(endpoint: .allbrands), excepting: [Brand].self) { result in
            switch result {
            case .success(let brands):
                self.brand = brands
                DispatchQueue.main.async {
                    self.brandPicker.reloadAllComponents()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        brandPicker.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 400)
        brandPicker.center = view.center
    }
}

extension BrandPickerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return brand[row].brandName
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return brand.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedBrandName = brand[row].brandName
        let familyPickerVC = FamilyPickerViewController()
        familyPickerVC.selectedBrandName = selectedBrandName
        navigationController?.pushViewController(familyPickerVC, animated: true)
    }
}
