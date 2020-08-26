//
//  DrinkMenu.swift
//  KaldisCafe_ModernMenu
//
//  Created by Matthies Abera on 26/8/20.
//  Copyright © 2020 Thinking Bear Solutions. All rights reserved.
//

import Foundation

struct DrinkMenu {
    
    // TODO: CHECK IF YOU NEED TO CHANGE LET TO VAR
    var drinkMenu: [[MenuItem]] {
        let beverageMenu = BeverageMenu().beverageMenu
        let coffeeCeremony = CoffeCeremony().coffeeCeremony
        
        return [beverageMenu, coffeeCeremony]
    }
}
