//
//  Menu.swift
//  KaldisCafe_ModernMenu
//
//  Created by Matthies Abera on 26/8/20.
//  Copyright © 2020 Thinking Bear Solutions. All rights reserved.
//

import Foundation

class Menu {
    
    /// Menu Variable: Dependent on sub menu's
    var menu: [[[MenuItem]]] = [
        FoodMenu().foodMenu,
        DrinkMenu().drinkMenu
    ]
    
    /// Constant for Menu Type Names
    let menuNames = [
        "food menu",
        "drinks menu"
    ]
    
    /// Constant for Sub Menu Type Names
    let subMenuNames = [
        ["breakfast", "lunch and dinner", "vegetarian", "extras"],
        ["beverage", "coffee ceremony"]
    ]
    
    /// Initializes a new menu with the provided parts and specifications.
    init() {
        
    }
    
    /**
    Retreives a particular feature of a given menu item
     
    - Parameter feature: Feature the user wants to retreive
    - Parameter name: Name of the menu item
     
    - Returns: Value corresponding to type of feature chosen
     */
    func get(_ feature: String , of name: String) -> Any {
        
        /// Loop through menu
        for menuType in menu {
            for subMenuType in menuType {
                for item in subMenuType {
                    
                    /// If item found: Return desired feature
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
        
        /// Testing: Non menu item parsed
        print("Error: Not a menu item")
        return "Not a menu item"
    }
    
    /**
    Appends a new item into the correct position within the 3D menu array
    
    - Parameter item: Menu Item trying to be Added
    - Parameter menuTypeSelected: Integer representation of Menu Type position within 3D Array
    - Parameter subMenuTypeSelected: Integer representation of Sub Menu Type  position within 3D Array
    */
    func add(_ item: MenuItem, in menuTypeSelected: Int, and subMenuTypeSelected: Int) {
        
        menu[menuTypeSelected][subMenuTypeSelected].append(item)
    }
    
    /**
    Alters a given menu item's properties
    
    - Parameter item: Menu Item trying to be Added
    - Parameter menuTypeSelected: Integer representation of Menu Type position within 3D Array
    - Parameter subMenuTypeSelected: Integer representation of Sub Menu Type  position within 3D Array
    - Parameter menuItemSelected: Integer representation of Menu Item's  position within 3D Array
    */
    func edit(_ item: MenuItem , in menuTypeSelected: Int, and subMenuTypeSelected: Int, and menuItemSelected: Int) {
        
        menu[menuTypeSelected][subMenuTypeSelected][menuItemSelected] = item
    }
    
    /**
    Deletes a given menu item from the menu
    
    - Parameter menuTypeSelected: Integer representation of Menu Type position within 3D Array
    - Parameter subMenuTypeSelected: Integer representation of Sub Menu Type  position within 3D Array
    - Parameter menuItemSelected: Integer representation of Menu Item's  position within 3D Array
    */
    func deleteItem(in menuTypeSelected: Int, and subMenuTypeSelected: Int, and menuItemSelected: Int) {
        
        menu[menuTypeSelected][subMenuTypeSelected].remove(at: menuItemSelected)
    }
    
    /**
    Checks if the menu contains an item with a given name
    
    - Parameter name: Name of the menu item
     
    - Returns: True or false boolean value
    */
    func alreadyContains(_ name: String) -> Bool {
        
        /// Loop through menu: if item is found return true
        for menuType in menu {
            for subMenuType in menuType {
                for item in subMenuType {
                    if (item.name.uppercased() == name.uppercased()) {
                        return true
                    }
                }
            }
        }

        /// If not found: return false
        return false
    }
}
