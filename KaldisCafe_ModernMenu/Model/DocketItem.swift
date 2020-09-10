//
//  DocketItem.swift
//  KaldisCafe_ModernMenu
//
//  Created by Matthies Abera on 10/9/20.
//  Copyright © 2020 Thinking Bear Solutions. All rights reserved.
//

import Foundation

struct DocketItem {
    
    var quantity: Int
    var name: String
    var price: Float
    
    init(quantity: Int, name: String, price: Float) {
        self.quantity = quantity
        self.name = name
        self.price = price
    }
    
}
