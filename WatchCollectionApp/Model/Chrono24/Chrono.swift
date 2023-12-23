//
//  Brand.swift
//  WatchCollectionApp
//
//  Created by Fatih Yörük on 18.12.2023.
//

import Foundation

struct ChronoProduct: Decodable {
    let id: String
    let sku: String
    let name: String
    let slug: String
    let brand: String
    let model: String
    let price: String
    let gender: String
    let images: [String]
    let location: String
    let movement: String
    let condition: String
    let decription: String
    let breadcrumbs: [String]
    let availability: String
    let listing_code: String
    let case_material: String
    let price_currency: String
    let price_formated: Int
    let bracelet_material: String
    let price_valid_until: String
    let scope_of_delivery: String
    let year_of_production: String
}
