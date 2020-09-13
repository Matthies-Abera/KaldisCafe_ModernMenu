//
//  Table.swift
//  KaldisCafe_ModernMenu
//
//  Created by Matthies Abera on 10/9/20.
//  Copyright © 2020 Thinking Bear Solutions. All rights reserved.
//

import Foundation

struct Table {
    
    /// Number accosiated to the table
    var tableNumber: Int
    /// Docket associated to the table
    var docket: Docket?
    
    /**
    Initializes a new bicycle with the provided parts and specifications.

    - Parameters:
       - tableNumber: Number accosiated to the table
       - docket: Docket associated to the table

    - Returns: A new table
    */
    init(tableNumber: Int, docket: Docket?) {
        self.tableNumber = tableNumber
        self.docket = docket
    }
    
}
