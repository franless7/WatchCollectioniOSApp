//
//  BrandListViewViewModel.swift
//  WatchCollectionApp
//
//  Created by Fatih Yörük on 24.12.2023.
//

import UIKit

final class BrandListViewViewModel: NSObject {
    
    private var brands: [Brandname] = [] {
        didSet {
            for brand in brands {
                let viewModel = BrandCollectionViewCellViewModel(
                    brandName: brand.name,
                    brandImage: URL(string: brand.image)
                )
                cellViewModels.append(viewModel)
            }
        }
    }
    
    private var cellViewModels: [BrandCollectionViewCellViewModel] = []
    
    func fetchBrands(with search: String) {
        WDService.shared.execute(WDRequest(endpoint: .search, query: search), excepting: [Brandname].self) { [weak self] result in
            switch result {
            case .success(let model):
                self?.brands = model
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension BrandListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, 
    UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: BrandCollectionViewCell.cellIdentifier,
            for: indexPath
        ) as? BrandCollectionViewCell else {
            fatalError("Unsported cell")
        }
        cell.configure(with: cellViewModels[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width-30)/2
        
        return CGSize(
            width: width,
            height: width * 1.5
        )
    }
}
