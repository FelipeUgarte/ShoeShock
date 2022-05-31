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
        Shoe(name: "Shoe1", brand: "Nike", price: 129.99, shoeImage: "shoe1-puma"),
        Shoe(name: "Shoe2", brand: "Nike", price: 129.99, shoeImage: "shoe2-weinbrenner"),
        Shoe(name: "Shoe3", brand: "Nike", price: 129.99, shoeImage: "shoe3-under-armour"),
        Shoe(name: "Shoe4", brand: "Nike", price: 129.99, shoeImage: "shoe4-power")
    ]
    
    private var brands = [
        Brand(name: "Nike"),
        Brand(name: "Addidas"),
        Brand(name: "Jordan"),
        Brand(name: "Puma"),
        Brand(name: "Power")
    ]
    
    private var moreShoes = [
        Shoe(name: "Shoe1", brand: "Nike", price: 129.99, shoeImage: "shoe1-puma"),
        Shoe(name: "Shoe2", brand: "Nike", price: 129.99, shoeImage: "shoe2-weinbrenner"),
        Shoe(name: "Shoe3", brand: "Nike", price: 129.99, shoeImage: "shoe3-under-armour"),
        Shoe(name: "Shoe4", brand: "Nike", price: 129.99, shoeImage: "shoe4-power")
    ]
    
    func getShoes() -> [Shoe] {
        return shoes
    }
    
    func getBrands() -> [Brand] {
        return brands
    }
    
    func getMoreShoes() -> [Shoe] {
        return moreShoes
    }
}
