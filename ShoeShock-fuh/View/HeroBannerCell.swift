//
//  HeroBannerCell.swift
//  ShoeShock-fuh
//
//  Created by Felipe Ugarte on 27-05-22.
//

import UIKit

class HeroBannerCell: UICollectionViewCell {

    @IBOutlet weak var brand: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var love: UIButton!
    @IBOutlet weak var shoeImage: UIImageView!
    
    func updateCell(shoes: Shoe) {
        brand.text = shoes.brand
        name.text = shoes.name
        price.text = String(shoes.price)
        shoeImage.image = UIImage(named: shoes.shoeImage)
    }
}
