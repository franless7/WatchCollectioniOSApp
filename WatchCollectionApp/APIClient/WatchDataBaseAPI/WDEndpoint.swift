//
//  WDEndpoint.swift
//  WatchCollectionApp
//
//  Created by Fatih Yörük on 22.12.2023.
//

import Foundation

enum WDEndpoint: String {
    /// Endpoint to all Brands
    case allbrands
    /// Endpoint to all family by brand name
    case allfamily
    /// Endpoint to all models by brand and family
    case allmodels
    /// Endpoint to watches by brand family model
    case allwatches
    /// Endpoint to media links
    case medialinks
}
