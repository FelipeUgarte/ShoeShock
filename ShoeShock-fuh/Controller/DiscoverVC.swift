//
//  ViewController.swift
//  ShoeShock-fuh
//
//  Created by Felipe Ugarte on 26-05-22.
//

import UIKit

class DiscoverVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var productTableView: UICollectionView!
    @IBOutlet weak var upcomingBT: UIButton!
    @IBOutlet weak var featured: UIButton!
    @IBOutlet weak var new: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productTableView.dataSource = self
        productTableView.delegate = self
        
        upcomingBT.titleLabel?.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        featured.titleLabel?.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        new.titleLabel?.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
    }
    
        // MARK: - Table view data source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        DataService.instance.getShoes().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoeCell", for: indexPath) as? HeroBannerCell {
            let shoe = DataService.instance.getShoes()[indexPath.row]
            cell.updateCell(shoes: shoe)
            return cell
        }
        return HeroBannerCell()
    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        DataService.instance.getShoes().count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if let cell = tableView.dequeueReusableCell(withIdentifier: "ShoeCell") as? HeroBannerCell {
//            let shoe = DataService.instance.getShoes()[indexPath.row]
//            cell.updateCell(shoes: shoe)
//            return cell
//        }
//        return HeroBannerCell()
//    }


}

