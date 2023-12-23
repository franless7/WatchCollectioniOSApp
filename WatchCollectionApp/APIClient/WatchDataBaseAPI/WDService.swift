//
//  WDService.swift
//  WatchCollectionApp
//
//  Created by Fatih Yörük on 22.12.2023.
//

import Foundation

final class WDService {
    
    static let shared = WDService()
    
    private init() { }
    
    enum WDServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    public func execute<T: Codable>(
        _ request: WDRequest,
        brandName: String? = nil,
        familyName: String? = nil,
        modelName: String? = nil,
        excepting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        
        switch request.endpoint {
            
            case .allbrands:
                break
            case .allfamily:
                if let brandName = brandName {
                    request.brandName = brandName
                }
            case .allmodels:
                if let brandName = brandName, let familyName = familyName {
                    request.brandName = brandName
                    request.familyName = familyName
                }
            case .allwatches:
                if let brandName = brandName, let familyName = familyName, let modelName = modelName {
                    request.brandName = brandName
                    request.familyName = familyName
                    request.modelName = modelName
                }
            default:
                    print("error")
                break
        }
        
        
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(WDServiceError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(WDServiceError.failedToGetData))
                return
            }
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(.success(result))
            }
            catch {
                completion(.failure(error))
            }
            
        }
        task.resume()
    }
    
    private func request(from wdRequest: WDRequest) -> URLRequest? {
        guard let url = wdRequest.url else { return nil }
        
        var request = URLRequest(
            url: url,
            cachePolicy: .useProtocolCachePolicy,
            timeoutInterval: 10.0
        )
        
        request.httpMethod = wdRequest.httpMethod
        request.allHTTPHeaderFields = wdRequest.headers
        
        return request
    }
}
