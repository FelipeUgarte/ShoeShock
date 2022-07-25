//
//  DataService.swift
//  ShoeShock-fuh
//
//  Created by Felipe Ugarte on 27-05-22.
//

import Foundation
import Combine

class DataService {
    static let instance = DataService()

    // MARK: - Shoes Properties
    private var shoes = [
        ShoeModel(name: "Shoe1",
                  brand: "Nike",
                  price: 2.4,
                  shoeImage: "shoe1-puma",
                  shoeDescription: Constants.instance.shoeDescriptions,
                  shoeAditionalImages: [
                    "shoe1-puma",
                    "shoe1-puma",
                    "shoe1-puma",
                    "shoe1-puma",
                    "shoe1-puma"
                  ],
                  like: false
                 ),
        ShoeModel(name: "Shoe2",
                  brand: "Nike",
                  price: 3.5,
                  shoeImage: "shoe2-weinbrenner",
                  shoeDescription: Constants.instance.shoeDescriptions,
                  shoeAditionalImages: [
                    "shoe2-weinbrenner",
                    "shoe2-weinbrenner",
                    "shoe2-weinbrenner",
                    "shoe2-weinbrenner",
                    "shoe2-weinbrenner"
                  ],
                  like: true
                 ),
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
                  ],
                  like: false
                 ),
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
                  ],
                  like: false
                 )
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
                  ],
                  like: false
                 ),
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
                  ],
                  like: false
                 ),
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
                  ],
                  like: false
                 ),
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
                  ],
                  like: false
                 )
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

    // MARK: - Shoes Methods
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

    // MARK: - MayBag
    private var bag: MyBagModel = MyBagModel(product: [], totalCost: 0)

    func getBag() -> Future<MyBagModel, Error> {
        return Future { send in
            DispatchQueue.main.async {
                send(.success(self.bag))
            }
        }
    }



    func addProductToBag(shoeId: UUID) {

        //TODO: - Revisar si el producto ya está en el carro antes de agregar para no duplicarlo
        let shoe = shoes[getProductIndex(shoeId: shoeId)]
        let shoeToAdd: BagProductsModel = BagProductsModel(id: shoe.id, name: shoe.name, image: shoe.shoeImage, price: shoe.price, quantity: 1)
        self.bag.bagProducts.append(shoeToAdd)
        updateTotal()
    }

    func removeShoe(_ product: Int) {
        guard !bag.bagProducts.isEmpty else {
            print("No more products to remove")
            return }
        bag.bagProducts.remove(at: product)
    }

    func changeQuantity(newQuantity: Int, product: Int) {
        bag.bagProducts[product].changeQuantity(newQuantity)
        updateTotal()
    }

    func likeShoeToggle(shoeId: UUID) {
        shoes[getProductIndex(shoeId: shoeId)].likeToggle()
    }

    func getProductIndex(shoeId: UUID) -> Int {
        var shoeIndex = 0
        for i in 0..<shoes.count {
            if shoes[i].id == shoeId {
                shoeIndex = i
            }
        }
        return shoeIndex
    }

    fileprivate func updateTotal() {
        var calculatedCost = 0.0
        for product in bag.bagProducts {
            calculatedCost += Double(product.quantity) * product.price
        }
        self.bag.totalCost = calculatedCost
        print(bag.totalCost)
    }
}

extension Notification.Name {
    static let shoePost = Notification.Name("ShoesPosted")
}
