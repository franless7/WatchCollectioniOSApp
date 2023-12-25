//
//  BrandCollectionViewCellViewModel.swift
//  WatchCollectionApp
//
//  Created by Fatih Yörük on 24.12.2023.
//

import Foundation

final class BrandCollectionViewCellViewModel {
    public let brandName: String
    private let brandImage: URL?

    // MARK: - Init
    
    init (
        brandName: String,
        brandImage: URL?
    ) {
        self.brandName = brandName
        self.brandImage = brandImage
    }
    
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        
        guard let url = brandImage else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}
