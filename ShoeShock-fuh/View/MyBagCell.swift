//
//  MyBagCell.swift
//  ShoeShock-fuh
//
//  Created by Felipe Ugarte on 02-07-22.
//

import UIKit

class MyBagCell: UITableViewCell {

    @IBOutlet weak var shoeImageImageView: UIImageView!
    @IBOutlet weak var shoeNameLabel: UILabel!
    @IBOutlet weak var shoePrice: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var increaseButton: UIButton!
    @IBOutlet weak var decreaseButtton: UIButton!

    func updateCell(shoe: BagProductsModel) {
        shoeImageImageView.image = UIImage(named: shoe.image)
        shoeNameLabel.text = shoe.name
        shoePrice.text = String(shoe.price)
        quantityLabel.text = String(shoe.quantity)
    }
}
