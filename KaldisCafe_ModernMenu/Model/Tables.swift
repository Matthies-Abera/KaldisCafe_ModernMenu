//
//  Tables.swift
//  KaldisCafe_ModernMenu
//
//  Created by Matthies Abera on 10/9/20.
//  Copyright © 2020 Thinking Bear Solutions. All rights reserved.
//

import Foundation

struct Tables {
    
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
    
    func isTableOpen(index: Int) -> Bool {
        
        if (self.tables[index - 1].docket != nil) {
            return true
        } else {
            return false
        }
    }
}
