//
//  ViewController.swift
//  ShoeShock-fuh
//
//  Created by Felipe Ugarte on 26-05-22.
//

import UIKit

class ShoeSelector: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    // CollectionsViews
    @IBOutlet weak var brandCollectionView: UICollectionView!
    @IBOutlet weak var productCollectionView: UICollectionView!
    @IBOutlet weak var moreShoesCollectionView: UICollectionView!
    
    // Buttons
    @IBOutlet weak var upcomingBT: UIButton!
    @IBOutlet weak var featured: UIButton!
    @IBOutlet weak var new: UIButton!
    
    var selectedShoe = Shoe(name: "", brand: "", price: 0, shoeImage: "", shoeAditionalImages: [""])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productCollectionView.dataSource = self
        productCollectionView.delegate = self
        brandCollectionView.dataSource = self
        brandCollectionView.delegate = self
        moreShoesCollectionView.dataSource = self
        moreShoesCollectionView.delegate = self
        
        // Rotate the text on the buttons
        upcomingBT.titleLabel?.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        featured.titleLabel?.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        new.titleLabel?.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        
    }

        // MARK: - Table view data source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // Iterate for each collectionView
        if collectionView == productCollectionView {
            return DataService.instance.getShoes().count
        } else if collectionView == moreShoesCollectionView {
            return DataService.instance.getMoreShoes().count
        } else {
            return DataService.instance.getBrands().count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Iterate for each collectionView
        if collectionView == productCollectionView {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoeCell", for: indexPath) as? HeroBannerCell {
                let shoe = DataService.instance.getShoes()[indexPath.row]
                cell.updateCell(shoes: shoe)
                return cell
            }
            return HeroBannerCell()
        } else if collectionView == moreShoesCollectionView {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoreShoeCell", for: indexPath) as? MoreShoeCell {
                let shoe = DataService.instance.getMoreShoes()[indexPath.row]
                cell.getMoreShoes(shoe: shoe)
                return cell
            }
            return MoreShoeCell()
        } else {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BrandCell", for: indexPath) as? BrandCell {
                let brand = DataService.instance.getBrands()[indexPath.row]
                cell.updateBrandCell(brand: brand)
                return cell
            }
            return BrandCell()
        }
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView == productCollectionView {
//            let cell =
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let shoe = DataService.instance.getShoes()[indexPath.row]
        performSegue(withIdentifier: "ShoeDetailVC", sender: shoe)
    }

//    override func prepare(for segue: ShoeDetailVC, sender: Any?) {
//        if let ShoeDetailVC = segue.description as? ShoeDetailVC {
//            assert(sender as? ShoeModel != nil)
//            ShoeDetailVC.init
//    }

}

