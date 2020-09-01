//
//  Menu.swift
//  KaldisCafe_ModernMenu
//
//  Created by Matthies Abera on 26/8/20.
//  Copyright © 2020 Thinking Bear Solutions. All rights reserved.
//

import Foundation

struct Menu {
    
    var menu: [[[MenuItem]]] {
        let foodMenu = FoodMenu().foodMenu
        let drinkMenu = DrinkMenu().drinkMenu
        
        return [foodMenu, drinkMenu]
    }
    
    func get(_ feature: String , of name: String, in theMenu: [[[MenuItem]]]) -> Any {
        
        // LOOP THROUGH MENU
        for menuType in theMenu {
            for subMenuType in menuType {
                for item in subMenuType {
                    
                    // IF ITEM FOUND PRINT DESIRED FEATURE
                    if (item.name == name) {
                        switch feature {
                        case "name":
                            return item.name
                        case "description":
                            return item.description
                        case "price":
                            return item.price
                        default:
                            return item.name
                        }
                    }
                }
            }
        }
        
        // TESTING: NON MENU ITEM PARSED
        return "No a menu item"
    }
    
    func alreadyContains(_ name: String, in theMenu: [[[MenuItem]]]) -> Bool {
        
        // LOOP THROUGH MENU: IF ITEM FOUND RETURN TRUE
        for menuType in theMenu {
            for subMenuType in menuType {
                for item in subMenuType {
                    if (item.name.uppercased() == name.uppercased()) {
                        return true
                    }
                }
            }
        }

        // IF NOT FOUND RETURN FALSE
        return false
    }
}
