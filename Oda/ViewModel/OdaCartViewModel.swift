//
//  OdaCartViewModel.swift
//  Oda
//
//  Created by joey chau on 16/10/2021.
//

import Foundation

class OdaCartViewModel: ObservableObject {
    
    @Published var products = [Product]()
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        if let url = URL(string: "https://api.jsonbin.io/b/60832bec4465377a6bc6b6e6") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
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
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}





