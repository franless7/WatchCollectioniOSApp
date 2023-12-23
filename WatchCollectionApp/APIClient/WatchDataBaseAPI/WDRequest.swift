//
//  WDRequest.swift
//  WatchCollectionApp
//
//  Created by Fatih Yörük on 22.12.2023.
//

import Foundation

final class WDRequest {
  
    private struct Constants {
        static let baseUrl = "https://watch-database1.p.rapidapi.com/"
    }
    
    public let endpoint: WDEndpoint
    
    public var brandName: String?
    public var familyName: String?
    public var modelName: String?
    
    private var urlString: String {
        var string = Constants.baseUrl
        
        if endpoint.rawValue == "allbrands" {
            string += "all-brands"
        }
       
        if endpoint.rawValue == "allfamily" {
            string += "all-family-by"
            string += "/"
            string += "brandname"
            string += "/"
            string += "\(self.brandName ?? "")"
        }
        
        if endpoint.rawValue == "allmodels" {
            string += "all-models-by"
            string += "/"
            string += "brandname"
            string += "/"
            string += "\(self.brandName ?? "")"
            string += "/"
            string += "family"
            string += "/"
            string += "\(self.familyName ?? "")"
        }
        
        if endpoint.rawValue == "allwatches" {
            string += "all-watches-by/"
            string += "brandname/"
            string += "\(self.brandName?.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? "")/"
            string += "family/"
            string += "\(self.familyName?.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? "")/"
            string += "model/"
            string += "\(self.modelName?.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? "")"
        }
        
        return string
    }
    
    public var url: URL? {
        return URL(string: urlString)
    }
    
    public let httpMethod = "GET"
    public let headers = [
        "X-RapidAPI-Key": "9c40ffca0emsh4703806e05217a6p1da71djsn2a99d76c2535",
        "X-RapidAPI-Host": "watch-database1.p.rapidapi.com"
    ]
    
    public init(
        endpoint: WDEndpoint,
        brandName: String? = nil,
        familyName: String? = nil,
        modelName: String? = nil
    ) {
        self.endpoint = endpoint
        self.brandName = brandName
        self.familyName = familyName
        self.modelName = modelName
    }
}
