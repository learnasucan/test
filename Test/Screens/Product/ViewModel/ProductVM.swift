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

class DummyEmptyProductVM {
    
    var products: [Product] = []
    
    var eventHandler: ((_ event: Event) -> Void)?
    
    func fetchData() {
        self.eventHandler?(.loaded)
        self.products = []
    }
    
}

class DummyDataProductVM {
    
    var products: [Product] = []
    
    var eventHandler: ((_ event: Event) -> Void)?
    
    func fetchData() {
        self.eventHandler?(.loading)
        
        products = fillData()
        self.eventHandler?(.loaded)
        
    }
    
    func fillData() ->  [Product] {
        return [Product(id: 0, title: "Jean", price: 200, description: "THis is jeans", category: "Levis", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/800px-Image_created_with_a_mobile_phone.png", rating: Rate(rate: 2, count: 2)),
                Product(id: 1, title: "Jean", price: 200, description: "THis is jeans", category: "Levis", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/800px-Image_created_with_a_mobile_phone.png", rating: Rate(rate: 2, count: 2)),
                Product(id: 2, title: "Jean", price: 200, description: "THis is jeans", category: "Levis", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/800px-Image_created_with_a_mobile_phone.png", rating: Rate(rate: 2, count: 2)),Product(id: 3, title: "Jean", price: 200, description: "THis is jeans", category: "Levis", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/800px-Image_created_with_a_mobile_phone.png", rating: Rate(rate: 2, count: 2)),Product(id: 4, title: "Jean", price: 200, description: "THis is jeans", category: "Levis", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/800px-Image_created_with_a_mobile_phone.png", rating: Rate(rate: 2, count: 2))
        ]
        
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
    
}


