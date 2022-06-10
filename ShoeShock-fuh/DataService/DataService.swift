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
        Shoe(name: "Shoe1",
             brand: "Nike",
             price: 129.99,
             shoeImage: "shoe1-puma",
             shoeAditionalImages: [
                "shoe1-puma",
                "shoe1-puma",
                "shoe1-puma",
                "shoe1-puma",
                "shoe1-puma"
             ]),
        Shoe(name: "Shoe2",
             brand: "Nike",
             price: 129.99,
             shoeImage: "shoe2-weinbrenner",
             shoeAditionalImages: [
                "shoe2-weinbrenner",
                "shoe2-weinbrenner",
                "shoe2-weinbrenner",
                "shoe2-weinbrenner",
                "shoe2-weinbrenner"
             ]),
        Shoe(name: "Shoe3",
             brand: "Nike",
             price: 129.99,
             shoeImage: "shoe3-under-armour",
             shoeAditionalImages: [
                "shoe3-under-armour",
                "shoe3-under-armour",
                "shoe3-under-armour",
                "shoe3-under-armour",
                "shoe3-under-armour"
             ]),
        Shoe(name: "Shoe4",
             brand: "Nike",
             price: 129.99,
             shoeImage: "shoe4-power",
             shoeAditionalImages: [
                "shoe4-power",
                "shoe4-power",
                "shoe4-power",
                "shoe4-power",
                "shoe4-power"
             ])
    ]
    
    private var brands = [
        BrandModel(name: "Nike"),
        BrandModel(name: "Addidas"),
        BrandModel(name: "Jordan"),
        BrandModel(name: "Puma"),
        BrandModel(name: "Power")
    ]
    
    private var shoesListDetail = [
        Shoe(name: "Shoe1",
             brand: "Nike",
             price: 129.99,
             shoeImage: "shoe1-puma", shoeAditionalImages: [
                "shoe1-puma",
                "shoe1-puma",
                "shoe1-puma",
                "shoe1-puma",
                "shoe1-puma"
             ]),
        Shoe(name: "Shoe2",
             brand: "Nike",
             price: 129.99,
             shoeImage: "shoe2-weinbrenner",
            shoeAditionalImages: [
                "shoe2-weinbrenner",
                "shoe2-weinbrenner",
                "shoe2-weinbrenner",
                "shoe2-weinbrenner",
                "shoe2-weinbrenner"
            ]),
        Shoe(name: "Shoe3",
             brand: "Nike",
             price: 129.99,
             shoeImage: "shoe3-under-armour",
            shoeAditionalImages: [
                "shoe3-under-armour",
                "shoe3-under-armour",
                "shoe3-under-armour",
                "shoe3-under-armour",
                "shoe3-under-armour"
            ]),
        Shoe(name: "Shoe4",
             brand: "Nike",
             price: 129.99,
             shoeImage: "shoe4-power",
            shoeAditionalImages: [
                "shoe4-power",
                "shoe4-power",
                "shoe4-power",
                "shoe4-power",
                "shoe4-power"
            ])
    ]
    
    private let size: [SizeModel] = [
        SizeModel(size: "7"),
        SizeModel(size: "7.5"),
        SizeModel(size: "8"),
        SizeModel(size: "8.5"),
        SizeModel(size: "9"),
        SizeModel(size: "9.5"),
        SizeModel(size: "10")
    ]
    
    func getShoes() -> [Shoe] {
        return shoes
    }
    
    func getBrands() -> [BrandModel] {
        return brands
    }
    
    func getMoreShoes() -> [Shoe] {
        return shoesListDetail
    }
    
    func getSizes() -> [SizeModel] {
        return size
    }
}
