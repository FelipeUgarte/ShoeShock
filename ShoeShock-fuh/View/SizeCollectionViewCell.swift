//
//  SizeCollectionViewCell.swift
//  ShoeShock-fuh
//
//  Created by Felipe Ugarte on 01-06-22.
//

import UIKit

class SizeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var sizeLabel: UILabel!
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 10
    }
    
    func updateSizeCell(size: SizeModel) {
        sizeLabel.text = size.size
    }
}
