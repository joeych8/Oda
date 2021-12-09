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
    
   // @Binding var shoppingCart = [Int: Int]   //FIXME: ADDTOCART
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        if let url = URL(string: "https://api.jsonbin.io/b/60832bec4465377a6bc6b6e6") {
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
    
    
  
    
    
    /*

    func addProductToCart(productId: Int, productQuantity: Int) {
        
        guard let quantity = shoppingCart[productId] else {
            
            shoppingCart[productId] = productQuantity
            return
        }
        
        shoppingCart[productId] = quantity + productQuantity
    
    }
    
    func removeFromCart (productId: Int, removeQuantity: Int) {
        guard let quantity = shoppingCart[productId] else {
         return
        }
        
        shoppingCart[productId] = quantity - removeQuantity
        
        if let newQuantity = shoppingCart[productId], newQuantity <= 0 {
            
            shoppingCart[productId] = nil
        }
        
        }
        
        
        
    func getShoppingCart() -> (itemCount: Int, totalCost: Double) {
        
        //let productSum = Int(product.grossPrice)
        
        //konverter pris til int
        //multipliser pris per produkt med antall
        //summer alle priser
        
        return (shoppingCart.count, 23.33 )
        
    }
    
    
    */
    
    
}





