//
//  MyBagModel.swift
//  ShoeShock-fuh
//
//  Created by Felipe Ugarte on 30-06-22.
//

import Foundation

class MyBagModel {
    var bagProducts: [BagProductsModel]
    var totalCost: Double

    init(product: [BagProductsModel], totalCost: Double) {
        self.bagProducts = product
        self.totalCost = totalCost
    }
}

class BagProductsModel {
    private(set) public var id: UUID
    private(set) public var name: String
    private(set) public var image: String
    private(set) public var price: Double
    private(set) public var quantity: Int

    init(id: UUID, name: String, image: String, price: Double, quantity: Int) {
        self.id = id
        self.name = name
        self.image = image
        self.price = price
        self.quantity = quantity
    }

    func changeQuantity(_ newQuantity: Int) {
        self.quantity = newQuantity
    }
}


