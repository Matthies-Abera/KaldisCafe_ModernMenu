//
//  Table.swift
//  KaldisCafe_ModernMenu
//
//  Created by Matthies Abera on 10/9/20.
//  Copyright © 2020 Thinking Bear Solutions. All rights reserved.
//

import Foundation

struct Table {
    
    var tableNumber: Int
    var docket: Docket?
    
    init(tableNumber: Int, docket: Docket?) {
        self.tableNumber = tableNumber
        self.docket = docket
    }
    
}
