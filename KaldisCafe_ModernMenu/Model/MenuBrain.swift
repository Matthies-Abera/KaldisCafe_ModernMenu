//
//  MenuBrain.swift
//  KaldisCafe_ModernMenu
//
//  Created by Matthies Abera on 2/9/20.
//  Copyright © 2020 Thinking Bear Solutions. All rights reserved.
//

import Foundation

class MenuBrain {
    
    init() {
        
    }
    
    var menu = Menu().menu
    
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
        print("Error: Not a menu item")
        return "Not a menu item"
    }
    
    func add(_ item: MenuItem, in MenuType: Int, and subMenuType: Int) {
        
        menu[MenuType][subMenuType].append(item)
    }
    
    func edit(_ item: MenuItem , in menuTypeSelected: Int, and subMenuTypeSelected: Int, and menuItemSelected: Int) {
        
        menu[menuTypeSelected][subMenuTypeSelected][menuItemSelected] = item
    }
    
    func deleteItem(in menuTypeSelected: Int, and subMenuTypeSelected: Int, and menuItemSelected: Int) {
        
        menu[menuTypeSelected][subMenuTypeSelected].remove(at: menuItemSelected)
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
