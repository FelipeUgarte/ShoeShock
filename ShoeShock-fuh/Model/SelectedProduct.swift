//
//  ShoppingCart.swift
//  ShoeShock-fuh
//
//  Created by Felipe Ugarte on 27-05-22.
//

import Foundation

class SelectedProduct {
    
    var item: Shoe
    var cuantity: Int
    var subtotal: Double
    
    init(item: Shoe, cuantity: Int, subtotal: Double) {
        self.item = item
        self.cuantity = cuantity
        self.subtotal = subtotal
    }
    
    func updateSubtotal() {
        let itemPrice = item.price
        let cuantity = cuantity
        let subtotal = itemPrice * Double(cuantity)
        self.subtotal += subtotal
    }
}
