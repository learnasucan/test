//
//  ProductVM.swift
//  Test
//
//  Created by Prachit on 05/03/23.
//

import Foundation

enum Event {
    case loading
    case loaded
    case stopLoading
    case error(Error)
}

class ProductVM {
    
    var products: [Product] = []
    
    var eventHandler: ((_ event: Event) -> Void)?
    
    func fetchData() {
        self.eventHandler?(.loading)
        APIManager.shared.fetchProduct { result in
            switch result {
            case .success(let products):
                self.products = products
                self.eventHandler?(.loaded)
                print(products)
            case .failure(let error):
                self.eventHandler?(.error(error))
                print(error.localizedDescription)
            }
        }
    }
    
}
