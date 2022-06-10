//
//  SizeModel.swift
//  ShoeShock-fuh
//
//  Created by Felipe Ugarte on 01-06-22.
//

import Foundation

struct SizeModel {
    var id = UUID()
    var size: String
    
    init(size: String) {
        self.size = size
    }
}
