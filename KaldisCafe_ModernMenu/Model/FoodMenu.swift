//
//  FoodMenu.swift
//  KaldisCafe_ModernMenu
//
//  Created by Matthies Abera on 26/8/20.
//  Copyright © 2020 Thinking Bear Solutions. All rights reserved.
//

import Foundation

struct FoodMenu {
    
    // TODO: CHECK IF YOU NEED TO CHANGE LET TO VAR
    var foodMenu: [[MenuItem]] {
        let breakfastMenu = BreakfastMenu().breakfastMenu
        let lunchAndDinnerMenu = LunchAndDinnerMenu().lunchAndDinnerMenu
        let vegetarianMenu = VegetarianMenu().vegetarianMenu
        let extrasMenu = ExtrasMenu().extrasMenu
        
        return [breakfastMenu, lunchAndDinnerMenu, vegetarianMenu, extrasMenu]
    }
}
