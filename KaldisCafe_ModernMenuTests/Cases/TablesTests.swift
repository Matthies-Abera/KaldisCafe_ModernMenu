//
//  TablesTests.swift
//  KaldisCafe_ModernMenuTests
//
//  Created by Matthies Abera on 19/9/20.
//  Copyright © 2020 Thinking Bear Solutions. All rights reserved.
//

import XCTest
@testable import KaldisCafe_ModernMenu

class TablesTests: XCTestCase {

    var tables: Tables!
    
    func testIfTablesOpen() {
        
        tables = Tables(currentDocketNumber: 1, todaysRevenue: 0.00)
        
        let openTable = tables.isTableOpen(tableNumber: 1)
        
        XCTAssertFalse(openTable)
    }
    
    func testIfTablesClosed() {
        
        tables = Tables(currentDocketNumber: 1, todaysRevenue: 0.00)
        
        let closedTable = !tables.isTableOpen(tableNumber: 1)
        
        XCTAssertTrue(closedTable)
    }
    
    func testAnyTablesOpen() {
        
        tables = Tables(currentDocketNumber: 1, todaysRevenue: 0.00)
        
        let areAnyTablesOpen = tables.anyTableIsOpen()
        
        XCTAssertFalse(areAnyTablesOpen)
    }
}
