//
//  WDRequest.swift
//  WatchCollectionApp
//
//  Created by Fatih Yörük on 22.12.2023.
//

import Foundation

final class WDRequest {
  
    private struct Constants {
        static let baseUrl = "https://app.retailed.io/api/v1/chrono24/"
    }
    
    public let endpoint: WDEndpoint
    
    public let query: String
    
    private var urlString: String {
        var string = Constants.baseUrl
        
        if endpoint.rawValue == "search" {
            string += "search?query=\(query)"
        }
        
        return string
    }
    
    public var url: URL? {
        return URL(string: urlString)
    }
    
    public let httpMethod = "GET"
    
    public let contentType = "Content-Type"
    public let applicationJson = "application/json"
    
    public let xApiKey = "x-api-key"
    public let apiKey = "26a6c399-b6ec-478a-b60f-14a27dc2cc97"

    
    public init(
        endpoint: WDEndpoint,
        query: String
    ) {
        self.endpoint = endpoint
        self.query = query
    }
}
