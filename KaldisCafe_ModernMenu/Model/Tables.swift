//
//  Tables.swift
//  KaldisCafe_ModernMenu
//
//  Created by Matthies Abera on 10/9/20.
//  Copyright © 2020 Thinking Bear Solutions. All rights reserved.
//

import Foundation

class Tables {
    
    /// Tables Variable
    var tables = [
        Table(tableNumber: 1, docket: nil),
        Table(tableNumber: 2, docket: nil),
        Table(tableNumber: 3, docket: nil),
        Table(tableNumber: 4, docket: nil),
        Table(tableNumber: 5, docket: nil),
        Table(tableNumber: 6, docket: nil),
        Table(tableNumber: 7, docket: nil),
        Table(tableNumber: 8, docket: nil),
        Table(tableNumber: 9, docket: nil),
        Table(tableNumber: 10, docket: nil),
        Table(tableNumber: 11, docket: nil),
        Table(tableNumber: 12, docket: nil),
        Table(tableNumber: 13, docket: nil),
        Table(tableNumber: 14, docket: nil),
        Table(tableNumber: 15, docket: nil),
        Table(tableNumber: 16, docket: nil),
    ]
    
    /// Initializes a new set of tables with the provided parts and specifications.
    init() {
        
    }
    
    /**
    Checks to see if a given table is currently open
    
    - Parameter index: Table number
    
    - Returns: true or false boolean value
    */
    func isTableOpen(index: Int) -> Bool {
        
        if (self.tables[index - 1].docket != nil) {
            return true
        } else {
            return false
        }
    }
    
    /**
    Checks to see if any table is open
    
    - Returns: true or false boolean value
    */
    func anyTableIsOpen() -> Bool {
        
        for index in 0..<tables.count {
            if tables[index].docket != nil {
                return true
            }
        }
        
        return false
    }
}
