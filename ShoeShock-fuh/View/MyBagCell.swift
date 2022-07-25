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
    @IBOutlet weak var decreaseButton: UIButton!

    private var cornerRadiusValue: CGFloat = 8
    private var quantity = 0
    private var cellIndex = 0
    private var delegate: UpdateBagDelegate?

    override func awakeFromNib() {
        increaseButton.layer.cornerRadius = cornerRadiusValue
        decreaseButton.layer.cornerRadius = cornerRadiusValue
    }

    func updateCell(shoe: BagProductsModel, cellIndex: Int) {
        shoeImageImageView.image = UIImage(named: shoe.image)
        shoeNameLabel.text = shoe.name
        shoePrice.text = String("$ \(shoe.price)")
        quantityLabel.text = String(shoe.quantity)
        self.quantity = shoe.quantity
        self.cellIndex = cellIndex
        print("Quantity pobtained: \(shoe.quantity)")
    }

    @IBAction func increaseBT(_ sender: Any) {
        self.quantity += 1
        quantityLabel.text = String(quantity)
        DataService.instance.changeQuantity(newQuantity: quantity, product: cellIndex)
        delegate?.updateTotalLabel()

    }

    @IBAction func decreaseBT(_ sender: Any) {
        if quantity > 1 {
            self.quantity -= 1
            print("Quantity: \(quantity)")
            quantityLabel.text = String(quantity)
            DataService.instance.changeQuantity(newQuantity: quantity, product: cellIndex)
            delegate?.updateTotalLabel()
        } else {
            print("Remove product: \(cellIndex)")
            quantityLabel.text = "0"
            DataService.instance.removeShoe(cellIndex)
            delegate?.updateTotalLabel()

        }
    }
}
