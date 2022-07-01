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
        ShoeModel(name: "Shoe1",
             brand: "Nike",
             price: 129.4499,
             shoeImage: "shoe1-puma",
             shoeDescription: Constants.instance.shoeDescriptions,
             shoeAditionalImages: [
                "shoe1-puma",
                "shoe1-puma",
                "shoe1-puma",
                "shoe1-puma",
                "shoe1-puma"
             ]),
        ShoeModel(name: "Shoe2",
             brand: "Nike",
             price: 129.99,
             shoeImage: "shoe2-weinbrenner",
             shoeDescription: Constants.instance.shoeDescriptions,
             shoeAditionalImages: [
                "shoe2-weinbrenner",
                "shoe2-weinbrenner",
                "shoe2-weinbrenner",
                "shoe2-weinbrenner",
                "shoe2-weinbrenner"
             ]),
        ShoeModel(name: "Shoe3",
             brand: "Nike",
             price: 129.99,
             shoeImage: "shoe3-under-armour",
             shoeDescription: Constants.instance.shoeDescriptions,
             shoeAditionalImages: [
                "shoe3-under-armour",
                "shoe3-under-armour",
                "shoe3-under-armour",
                "shoe3-under-armour",
                "shoe3-under-armour"
             ]),
        ShoeModel(name: "Shoe4",
             brand: "Nike",
             price: 129.99,
             shoeImage: "shoe4-power",
             shoeDescription: Constants.instance.shoeDescriptions,
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
        ShoeModel(name: "Shoe1",
             brand: "Nike",
             price: 129.99,
             shoeImage: "shoe1-puma",
             shoeDescription: Constants.instance.shoeDescriptions,
             shoeAditionalImages: [
                "shoe1-puma",
                "shoe1-puma",
                "shoe1-puma",
                "shoe1-puma",
                "shoe1-puma"
             ]),
        ShoeModel(name: "Shoe2",
             brand: "Nike",
             price: 129.99,
             shoeImage: "shoe2-weinbrenner",
             shoeDescription: Constants.instance.shoeDescriptions,
            shoeAditionalImages: [
                "shoe2-weinbrenner",
                "shoe2-weinbrenner",
                "shoe2-weinbrenner",
                "shoe2-weinbrenner",
                "shoe2-weinbrenner"
            ]),
        ShoeModel(name: "Shoe3",
             brand: "Nike",
             price: 129.99,
             shoeImage: "shoe3-under-armour",
             shoeDescription: Constants.instance.shoeDescriptions,
            shoeAditionalImages: [
                "shoe3-under-armour",
                "shoe3-under-armour",
                "shoe3-under-armour",
                "shoe3-under-armour",
                "shoe3-under-armour"
            ]),
        ShoeModel(name: "Shoe4",
             brand: "Nike",
             price: 129.99,
             shoeImage: "shoe4-power",
             shoeDescription: Constants.instance.shoeDescriptions,
            shoeAditionalImages: [
                "shoe4-power",
                "shoe4-power",
                "shoe4-power",
                "shoe4-power",
                "shoe4-power"
            ])
    ]
    
    private let size: [SizeModel] = [
        SizeModel(sizeNumber: "7"),
        SizeModel(sizeNumber: "7.5"),
        SizeModel(sizeNumber: "8"),
        SizeModel(sizeNumber: "8.5"),
        SizeModel(sizeNumber: "9"),
        SizeModel(sizeNumber: "9.5"),
        SizeModel(sizeNumber: "10")
    ]

    private var bag: MyBagModel = MyBagModel(product: [], totalCost: 0)
    
    func getShoes() -> [ShoeModel] {
        return shoes
    }
    
    func getBrands() -> [BrandModel] {
        return brands
    }
    
    func getMoreShoes() -> [ShoeModel] {
        return shoesListDetail
    }
    
    func getSizes() -> [SizeModel] {
        return size
    }

    func updateBag(mybag: MyBagModel) {
        self.bag = mybag
    }

    func getBag() -> MyBagModel {
        return bag
    }
}
