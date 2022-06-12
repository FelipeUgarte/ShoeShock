//
//  ShoeDetailVCViewController.swift
//  ShoeShock-fuh
//
//  Created by Felipe Ugarte on 09-06-22.
//

import UIKit

class ShoeDetailVC: UIViewController {
    
    @IBOutlet weak var smallShoesImages: UICollectionView!
    @IBOutlet weak var sizes: UICollectionView!
    
    @IBOutlet weak var largeShoeImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var shoeDescription: UILabel!
    @IBOutlet weak var moreDetailTitle: UILabel!
    @IBOutlet weak var sizeText: UILabel!
    @IBOutlet weak var uk: UILabel!
    @IBOutlet weak var usa: UILabel!
    @IBOutlet weak var addToBagBT: UIButton!
    
    private(set) public var shoeToShow = Shoe(name: "", brand: "", price: 0, shoeImage: "", shoeAditionalImages: [""])

    override func viewDidLoad() {
        super.viewDidLoad()
        
        largeShoeImage.image = UIImage(named: shoeToShow.shoeImage)
        name.text = shoeToShow.name
        price.text = String(shoeToShow.price)
        shoeDescription.text = "Description"

        moreDetailTitle.text = "MORE DETAILS"
        sizeText.text = "Size"
        uk.text = "UK"
        usa.text = "USA"
        addToBagBT.setTitle("Add to Bag", for: .normal)
        
        uk.textColor = .gray
        usa.textColor = .black
    }
    
    func initShoes(shoe: Shoe) {
        shoeToShow = shoe
        navigationItem.title = shoeToShow.name
    }
}
