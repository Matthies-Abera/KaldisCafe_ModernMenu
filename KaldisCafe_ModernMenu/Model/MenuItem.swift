//
//  MenuItem.swift
//  KaldisCafe_ModernMenu
//
//  Created by Matthies Abera on 26/8/20.
//  Copyright © 2020 Thinking Bear Solutions. All rights reserved.
//

import Foundation

struct MenuItem {
    
    /// Name of item
    var name: String
    /// Detailed sentence of paragraph describing the item
    var description: String
    /// Price of item
    var price: Float
    
    /**
    Initializes a new menu item with the provided parts and specifications.

    - Parameters:
       - name: Name of item
       - description: Detailed sentence of paragraph describing the item
       - price: Price of item

    - Returns: A new menu item
    */
    init(name: String, description: String, price: Float) {
        self.name = name
        self.description = description
        self.price = price
    } 
    
}
