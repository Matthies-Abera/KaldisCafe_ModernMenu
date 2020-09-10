//
//  Docket.swift
//  KaldisCafe_ModernMenu
//
//  Created by Matthies Abera on 10/9/20.
//  Copyright © 2020 Thinking Bear Solutions. All rights reserved.
//

import Foundation

struct Docket {
    
    var docketItems: [DocketItem]
    var docketNumber: Int
    var tableNumber: Int
    var totalAmount: Float
    var timeClosed: Date?
    var date: Date?
    
    init(docketNumber: Int, tableNumber: Int, docketItems: [DocketItem], totalAmount: Float, timeClosed: Date?, date: Date?) {
        self.docketNumber = docketNumber
        self.tableNumber = tableNumber
        self.docketItems = []
        self.totalAmount = totalAmount
        self.timeClosed = nil
        self.date = nil
    }
    
}
