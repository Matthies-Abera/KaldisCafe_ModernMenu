//
//  MenuItem.swift
//  KaldisCafe_ModernMenu
//
//  Created by Matthies Abera on 26/8/20.
//  Copyright © 2020 Thinking Bear Solutions. All rights reserved.
//

import Foundation

struct MenuItem {
    
    var name: String
    var description: String
    var price: Float
    
    init(name: String, description: String, price: Float) {
        self.name = name
        self.description = description
        self.price = price
    }
    
}
