//
//  Docket.swift
//  KaldisCafe_ModernMenu
//
//  Created by Matthies Abera on 10/9/20.
//  Copyright © 2020 Thinking Bear Solutions. All rights reserved.
//

import Foundation

class Docket {
    
    /// Docket number associated to an instance of a docket
    var docketNumber: Int
    /// Table number the docket is associated with
    var tableNumber: Int
    /// Collection of docket items
    var docketItems: [DocketItem]
    /// Total order amount of the docket
    var totalAmount: Float
    /// Date representation of time docket was payed and closed
    var timeClosed: Date?
    /// Date representation of day docket was payed and closed
    var dayClosed: Date?
    /// Menu associated to docket
    var menu: Menu
    
    /**
    Initializes a new docket with the provided parts and specifications.

    - Parameters:
       - docketNumber: Docket number associated to an instance of a docket
       - tableNumber: Table number the docket is associated with
       - docketItems: Collection of docket items
       - totalAmount: Total order amount of the docket
       - timeClosed: Date representation of time docket was payed and closed
       - dayClosed: Date representation of day docket was payed and closed
       - menu: Menu associated to docket

    - Returns: A docket
    */
    init(docketNumber: Int, tableNumber: Int, docketItems: [DocketItem], totalAmount: Float, timeClosed: Date?, dayClosed: Date?, menu: Menu) {
        self.docketNumber = docketNumber
        self.tableNumber = tableNumber
        self.docketItems = []
        self.totalAmount = totalAmount
        self.timeClosed = nil
        self.dayClosed = nil
        self.menu = menu
    }
    
    /**
    Checks to see if a docket contains a particular docket item

    - Parameter itemName: Name of docket item

    - Returns: true or false boolean value
    */
    func doesDocketContain(_ itemName: String) -> Bool {
        
        for index in 0..<docketItems.count {
            if docketItems[index].name == itemName {
                return true
            }
        }
        
        return false
    }
    
    /**
    Appends a new docket item to the docket

    - Parameter itemName: Name of docket item
    */
    func addItem(_ itemName: String) {
        
        /// get price of item
        let price = menu.get("price", of: itemName)
        
        /// create new docket item
        let docketItem = DocketItem(quantity: 1, name: itemName, price: price as! Float)
        
        /// append new docket item to docketItems
        docketItems.append(docketItem)
    }
    
    /**
    Increases the quantity of a docket item
     
    - Parameter itemName: Name of docket item
    */
    func increaseQuantity(of itemName: String) {
        
        for index in 0..<docketItems.count {
            if docketItems[index].name == itemName {
                docketItems[index].quantity += 1
                return
            }
        }
    }
    /**
    Decreases the quantity of a docket item

     If the quantity of the given  item reaches 0 the item is removed
     
    - Parameter itemName: Name of docket item
    */
    func decreaseQuantity(of itemName: String) {
        
        for index in 0..<docketItems.count {
            if docketItems[index].name == itemName {
                
                /// decrease quantity
                docketItems[index].quantity -= 1
                
                /// if quantity equals zero remove item completely
                if docketItems[index].quantity == 0 {
                    docketItems.remove(at: index)
                    return
                }
                
                return
            }
        }
    }
    
    /**
    Returns a formatted string representation of the collection of docket items
     
    - Returns: a formatted string representation of the collection of docket items
    */
    func displayDocket() -> String {
        
        var docketReceipt = ""
        
        for index in 0..<docketItems.count {
            docketReceipt += "\(docketItems[index].quantity)x\t\(docketItems[index].name)\t\(docketItems[index].price * Float(docketItems[index].quantity))0\n"
        }
        
        return docketReceipt
    }
    
    /**
    Returns the total amount of the docket
     
    - Returns: total amount of the docket
    */
    func getTotalAmount() -> Float {
        
        var total: Float = 0.0
        
        for index in 0..<docketItems.count {
            total += docketItems[index].price * Float(docketItems[index].quantity)
        }
        
        return total
    }
    
}
