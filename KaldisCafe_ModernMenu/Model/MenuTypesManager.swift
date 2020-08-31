//
//  MenuTypesManager.swift
//  KaldisCafe_ModernMenu
//
//  Created by Matthies Abera on 31/8/20.
//  Copyright © 2020 Thinking Bear Solutions. All rights reserved.
//

import Foundation

protocol MenuTypesManagerDelegate {
    
    func didUpdateSubMenuTypes(_ MenuTypesManager: MenuTypesManager, _ subMenu: [String])
    
    func didFailWithError(_ error: Error)
}

struct MenuTypesManager {
    
    var delegate: MenuTypesManagerDelegate?
    
    let menuNames = [
        "food menu",
        "drinks menu"
    ]
    
    let subMenuNames = [
        ["breakfast", "lunch and dinner", "vegetarian", "extras"],
        ["beverage", "coffee ceremony"]
    ]
    
    
}
