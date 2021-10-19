//
//  OdaData.swift
//  Oda
//
//  Created by joey chau on 16/10/2021.
//

import Foundation
import SwiftUI

struct OdaData: Codable {
    let items: [OdaCartProducts]
}

struct OdaCartProducts: Codable {
    let product: Product
}

struct Product: Codable, Identifiable {
    let id: Int
    let name: String
    let nameExtra: String
    let grossPrice: String
    let grossUnitPrice: String
    let unitPriceQuantityAbbreviation: String
    let unitPriceQuantityName: String
    let images: [Images]
    let availability: Availability
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case nameExtra = "name_extra"
        case grossPrice = "gross_price"
        case grossUnitPrice = "gross_unit_price"
        case unitPriceQuantityAbbreviation = "unit_price_quantity_abbreviation"
        case unitPriceQuantityName = "unit_price_quantity_name"
        case images
        case availability
    }
}

struct Images: Codable {
    let thumbnail: Thumbnail
}

struct Thumbnail: Codable {
    let url: String
}

struct Availability: Codable {
    let isAvailable: Bool
    let code: String
    let description: String
    let descriptionShort: String
    
    private enum CodingKeys: String, CodingKey {
        case isAvailable = "is_available"
        case code
        case description
        case descriptionShort = "description_short"
    }
    
}

