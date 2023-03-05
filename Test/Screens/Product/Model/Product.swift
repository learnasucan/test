//
//  Product.swift
//  Test
//
//  Created by Prachit on 04/03/23.
//

import Foundation

struct Product: Codable {
    let id : Int
    let title : String
    let price : Float
    let description : String
    let category : String
    let image : String
    let rating : Rate
}

struct Rate : Codable {
    let rate : Float
    let count : Int
}
