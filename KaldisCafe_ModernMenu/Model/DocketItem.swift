//
//  DocketItem.swift
//  KaldisCafe_ModernMenu
//
//  Created by Matthies Abera on 10/9/20.
//  Copyright © 2020 Thinking Bear Solutions. All rights reserved.
//

import Foundation

struct DocketItem {
    
    /// Quantity of docket item
    var quantity: Int
    /// Name of docket item
    var name: String
    /// Price of docket item
    var price: Float
    
    /**
    Initializes a new docket item with the provided parts and specifications.

    - Parameters:
       - quantity: Quantity of docket item
       - name: Name of docket item
       - price: Price of docket item

    - Returns: A docket item
    */
    init(quantity: Int, name: String, price: Float) {
        self.quantity = quantity
        self.name = name
        self.price = price
    }
    
}
