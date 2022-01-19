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
    let discount: Discount?
    let availability: Availability
}

struct Images: Codable {
    let thumbnail: Thumbnail
}

struct Thumbnail: Codable {
    let url: String
}

struct Discount: Codable {
    let isDiscounted: Bool
    let undiscountedGrossPrice: String
    let undiscountedGrossUnitPrice: String
    let descriptionShort: String
}

struct Availability: Codable {
    let isAvailable: Bool
    let code: String
    let description: String
    let descriptionShort: String
}

