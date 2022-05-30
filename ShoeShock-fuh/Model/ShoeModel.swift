//
//  ShoeModel.swift
//  ShoeShock-fuh
//
//  Created by Felipe Ugarte on 27-05-22.
//

import Foundation

struct Shoe {
    private(set) public var id = UUID()
    private(set) public var name: String
    private(set) public var brand: String
    private(set) public var price: Double
    private(set) public var shoeImage: String
    
    init(name: String, brand: String, price: Double, shoeImage: String) {
        self.name = name
        self.brand = brand
        self.price = price
        self.shoeImage = shoeImage
    }
}
