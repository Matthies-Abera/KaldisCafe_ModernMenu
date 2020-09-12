//
//  DrinkMenu.swift
//  KaldisCafe_ModernMenu
//
//  Created by Matthies Abera on 26/8/20.
//  Copyright © 2020 Thinking Bear Solutions. All rights reserved.
//

import Foundation

struct DrinkMenu {
    
    var drinkMenu: [[MenuItem]] = [
        BeverageMenu().beverageMenu,
        CoffeCeremony().coffeeCeremony
    ]
}
