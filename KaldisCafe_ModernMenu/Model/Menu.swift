//
//  Menu.swift
//  KaldisCafe_ModernMenu
//
//  Created by Matthies Abera on 26/8/20.
//  Copyright © 2020 Thinking Bear Solutions. All rights reserved.
//

import Foundation

class Menu {
    
    var menu: [[[MenuItem]]] = [
        FoodMenu().foodMenu,
        DrinkMenu().drinkMenu
    ]
    
    let menuNames = [
        "food menu",
        "drinks menu"
    ]
    
    let subMenuNames = [
        ["breakfast", "lunch and dinner", "vegetarian", "extras"],
        ["beverage", "coffee ceremony"]
    ]
    
    var foodSubMenus = [
    
        ["Qinche", "Foule", "Che-che-bsa", "Scrambled Eggs", "Enkulal Besiga", "Breakfast Combination"],
        ["Tibs", "Goden Tibs", "Derek Tibs", "Quanta Firfir", "Kitfo", "Kei Wot"],
        ["Shiro", "Ater Kik Wot", "Atkilt Wot", "Mild misir wot"],
        ["Salad", "Spaghetti", "Assa Mild"]
    ]
    
    var drinkSubMenus = [
        
        ["Coffee", "Tea", "Soft Drinks", "Hot Chocolate", "Local Beers", "Ethiopian Beers", "Amber Beer"],
        ["Coffee Ceremony"]
    ]
    
    init() {
        
    }
    
    func get(_ feature: String , of name: String) -> Any {
        
        // LOOP THROUGH MENU
        for menuType in menu {
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
    
    func add(_ item: MenuItem, in menuType: Int, and subMenuType: Int) {
        
        menu[menuType][subMenuType].append(item)
    }
    
    func edit(_ item: MenuItem , in menuTypeSelected: Int, and subMenuTypeSelected: Int, and menuItemSelected: Int) {
        
        menu[menuTypeSelected][subMenuTypeSelected][menuItemSelected] = item
    }
    
    func deleteItem(in menuTypeSelected: Int, and subMenuTypeSelected: Int, and menuItemSelected: Int) {
        
        menu[menuTypeSelected][subMenuTypeSelected].remove(at: menuItemSelected)
    }
    
    func alreadyContains(_ name: String) -> Bool {
        
        // LOOP THROUGH MENU: IF ITEM FOUND RETURN TRUE
        for menuType in menu {
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
