//
//  OdaCartViewModel.swift
//  Oda
//
//  Created by joey chau on 16/10/2021.
//

import Foundation
import SwiftUI

class OdaCartViewModel: ObservableObject {
    
    @Published var products = [Product]()
    @Published var shoppingCart = [Int: Int]()
    
    init() {
        fetchData()
    }

    func fetchData() {
        if let url = URL(string: "https://api.npoint.io/d4e0a014b1cfc5254bcb") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase //MARK: convert from snakeCase to camelCase
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(OdaData.self, from: safeData)
                            DispatchQueue.main.async { [weak self] in
                                self?.products = results.items.map { item in
                                    item.product
                                }
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    func getShoppingCart() -> (itemCount: Int, totalCost: Double) {
        
        let itemCount = shoppingCart.compactMap({$0.value}).reduce(0, +)
        var totalCost: Double = 0
        
        for shoppingCartProduct in shoppingCart {
            if let product = products.filter({$0.id == shoppingCartProduct.key}).first,
               let productPrice = Double(product.grossPrice) {
                totalCost += Double(shoppingCartProduct.value) * productPrice
            }
        }
        let totalCostTwoDecimals = Double(round(100 * totalCost) / 100)
        
        return (itemCount, totalCostTwoDecimals)
    }
    
}





