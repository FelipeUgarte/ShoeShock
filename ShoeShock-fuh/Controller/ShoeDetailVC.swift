//
//  ShoeDetailVCViewController.swift
//  ShoeShock-fuh
//
//  Created by Felipe Ugarte on 09-06-22.
//

import UIKit

class ShoeDetailVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var smallShoesImagesCellectionView: UICollectionView!
    @IBOutlet weak var sizesCellectionView: UICollectionView!
    
    @IBOutlet weak var largeShoeImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var shoeDescription: UILabel!
    @IBOutlet weak var moreDetailTitle: UILabel!
    @IBOutlet weak var sizeText: UILabel!
    @IBOutlet weak var uk: UILabel!
    @IBOutlet weak var usa: UILabel!
    @IBOutlet weak var addToBagBT: UIButton!
    
    private(set) public var shoeToShow = ShoeModel(name: "", brand: "", price: 0, shoeImage: "", shoeDescription: "", shoeAditionalImages: [""])

    override func viewDidLoad() {
        super.viewDidLoad()

        smallShoesImagesCellectionView.dataSource = self
        smallShoesImagesCellectionView.delegate = self
        sizesCellectionView.dataSource = self
        sizesCellectionView.delegate = self


        largeShoeImage.image = UIImage(named: shoeToShow.shoeImage)
        name.text = shoeToShow.name
        price.text = String.localizedStringWithFormat("$ %.2f", shoeToShow.price)
        shoeDescription.text = shoeToShow.shoeDescription

        moreDetailTitle.text = "MORE DETAILS"
        sizeText.text = "Size"
        uk.text = "UK"
        usa.text = "USA"
        addToBagBT.setTitle("Add to Bag", for: .normal)
        
        uk.textColor = .gray
        usa.textColor = .black
    }
    
    func initShoes(shoe: ShoeModel) {
        shoeToShow = shoe
        navigationItem.title = shoeToShow.name
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == sizesCellectionView {
            print("Number of items sizes")
            return DataService.instance.getSizes().count
        } else if collectionView == smallShoesImagesCellectionView {
            print("Number of items small images")
            return shoeToShow.shoeAditionalImages.count
        } else {
            return 0
        }


    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == sizesCellectionView {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SizeCell", for: indexPath) as? SizeCell {
                let size = DataService.instance.getSizes()[indexPath.row]
                cell.updateSizeCell(size: size)
                return cell
            }
            return SizeCell()
        } else if collectionView == smallShoesImagesCellectionView {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SmallImagesCell", for: indexPath) as? SmallImagesCell {
                let smallImage = shoeToShow.shoeAditionalImages[indexPath.row]
                cell.updateImageCell(imageName: smallImage)
                return cell
            }
            return SmallImagesCell()
        } else {
            return SizeCell()
        }
    }

    @IBAction func addToBagButtonTapped(_ sender: UIButton) {

        let alert = UIAlertController(title: "Shoe added to you bag", message: nil, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "cancel", style: UIAlertAction.Style.default, handler: nil ))

        self.present(alert, animated: true, completion: nil)

    }
}
