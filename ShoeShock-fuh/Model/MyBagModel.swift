//
//  MyBagModel.swift
//  ShoeShock-fuh
//
//  Created by Felipe Ugarte on 30-06-22.
//

import Foundation

class MyBagModel {
    var id = UUID()
    var bagProducts: [BagProductsModel]
    var totalCost: Double

    init(product: [BagProductsModel], totalCost: Double) {
        self.bagProducts = product
        self.totalCost = totalCost
    }
}

class BagProductsModel {
    private(set) public var id = UUID()
    private(set) public var name: String
    private(set) public var price: Double
    private(set) public var quantity: Int

    init(name: String, price: Double, quantity: Int) {
        self.name = name
        self.price = price
        self.quantity = quantity
    }
}


