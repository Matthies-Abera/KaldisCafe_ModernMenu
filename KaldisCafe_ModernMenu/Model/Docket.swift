//
//  Docket.swift
//  KaldisCafe_ModernMenu
//
//  Created by Matthies Abera on 10/9/20.
//  Copyright © 2020 Thinking Bear Solutions. All rights reserved.
//

import Foundation

class Docket {
    
    var docketItems: [DocketItem]
    var docketNumber: Int
    var tableNumber: Int
    var totalAmount: Float
    var timeClosed: Date?
    var date: Date?
    var menu: Menu
    
    init(docketNumber: Int, tableNumber: Int, docketItems: [DocketItem], totalAmount: Float, timeClosed: Date?, date: Date?, menu: Menu) {
        self.docketNumber = docketNumber
        self.tableNumber = tableNumber
        self.docketItems = []
        self.totalAmount = totalAmount
        self.timeClosed = nil
        self.date = nil
        self.menu = menu
    }
    
    func doesDocketContain(_ itemName: String) -> Bool {
        
        for index in 0..<docketItems.count {
            if docketItems[index].name == itemName {
                return true
            }
        }
        
        return false
    }
    
    func addItem(_ itemName: String) {
        
        // get price of item
        let price = menu.get("price", of: itemName)
        
        // create new docket item
        let docketItem = DocketItem(quantity: 1, name: itemName, price: price as! Float)
        
        // append new docket item to docketItems
        docketItems.append(docketItem)
    }
    
    func increaseQuantity(of itemName: String) {
        
        for index in 0..<docketItems.count {
            if docketItems[index].name == itemName {
                docketItems[index].quantity += 1
                return
            }
        }
    }
    
    func decreaseQuantity(of itemName: String) {
        
        for index in 0..<docketItems.count {
            if docketItems[index].name == itemName {
                
                // decrease quantity
                docketItems[index].quantity -= 1
                
                // if quantity equals zero remove item completely
                if docketItems[index].quantity == 0 {
                    docketItems.remove(at: index)
                    return
                }
                
                return
            }
        }
    }
    
    func displayDocket() -> String {
        
        var docketReceipt = ""
        
        for index in 0..<docketItems.count {
            docketReceipt += "\(docketItems[index].quantity)x\t\(docketItems[index].name)\t\(docketItems[index].price * Float(docketItems[index].quantity))0\n"
        }
        
        return docketReceipt
    }
    
    func getTotalAmount() -> Float {
        
        var total: Float = 0.0
        
        for index in 0..<docketItems.count {
            total += docketItems[index].price * Float(docketItems[index].quantity)
        }
        
        return total
    }
    
}
