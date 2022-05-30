//
//  DataService.swift
//  ShoeShock-fuh
//
//  Created by Felipe Ugarte on 27-05-22.
//

import Foundation

class DataService {
    static let instance = DataService()
    
    
    private var shoes = [
        Shoe(name: "Shoe1", brand: "Puma", price: 129.99, shoeImage: "shoe1-puma"),
        Shoe(name: "Shoe2", brand: "Weinbrebber", price: 129.99, shoeImage: "shoe2-weinbrenner"),
        Shoe(name: "Shoe3", brand: "Under Armour", price: 129.99, shoeImage: "shoe3-under-armour"),
        Shoe(name: "Shoe4", brand: "Power", price: 129.99, shoeImage: "shoe4-power")
    ]
    
    func getShoes() -> [Shoe] {
        return shoes
    }
}
