//
//  DocketTests.swift
//  KaldisCafe_ModernMenuTests
//
//  Created by Matthies Abera on 19/9/20.
//  Copyright © 2020 Thinking Bear Solutions. All rights reserved.
//

import XCTest
@testable import KaldisCafe_ModernMenu

class DocketTests: XCTestCase {

    var menu: Menu!
    var docket: Docket!
    
    func testDoesDocketContain() {
        
        menu = Menu()
        docket = Docket(docketNumber: 1, tableNumber: 1, docketItems: [], totalAmount: 0.00, timeClosed: nil, dayClosed: nil, menu: menu)
        
        let menuItem = MenuItem(name: "Cheeseburger", description: "A tasty cheeseburger", price: 3.99)
        menu.add(menuItem, in: 0, and: 1)
        
        docket.addItem("Cheeseburger")
        let doesDocketContainCheeseburger = docket.doesDocketContain("Cheeseburger")
        XCTAssertTrue(doesDocketContainCheeseburger)
        
        let doesDocketContainHamburger = docket.doesDocketContain("Hamburger")
        XCTAssertFalse(doesDocketContainHamburger)
    }
    
    func testAddItem() {
        
        menu = Menu()
        docket = Docket(docketNumber: 1, tableNumber: 1, docketItems: [], totalAmount: 0.00, timeClosed: nil, dayClosed: nil, menu: menu)
        
        let menuItem = MenuItem(name: "Cheeseburger", description: "A tasty cheeseburger", price: 3.99)
        menu.add(menuItem, in: 0, and: 1)
        
        let docketCountBeforeAdd = docket.docketItems.count
        docket.addItem("Cheeseburger")
        let docketCountAfterAdd = docket.docketItems.count
        
        XCTAssertEqual(docketCountAfterAdd - docketCountBeforeAdd, 1)
    }
    
    func testIncreaseQuantity() {
        
        menu = Menu()
        docket = Docket(docketNumber: 1, tableNumber: 1, docketItems: [], totalAmount: 0.00, timeClosed: nil, dayClosed: nil, menu: menu)
        
        let menuItem = MenuItem(name: "Cheeseburger", description: "A tasty cheeseburger", price: 3.99)
        menu.add(menuItem, in: 0, and: 1)
        
        docket.addItem("Cheeseburger")
        docket.increaseQuantity(of: "Cheeseburger")
        
        let cheeseburgerQuantity = docket.docketItems[0].quantity
        
        XCTAssertEqual(cheeseburgerQuantity, 2)
    }
    
    func testDecreaseQuantity() {
        
        menu = Menu()
        docket = Docket(docketNumber: 1, tableNumber: 1, docketItems: [], totalAmount: 0.00, timeClosed: nil, dayClosed: nil, menu: menu)
        
        let menuItem = MenuItem(name: "Cheeseburger", description: "A tasty cheeseburger", price: 3.99)
        menu.add(menuItem, in: 0, and: 1)
        
        docket.addItem("Cheeseburger")
        docket.increaseQuantity(of: "Cheeseburger")
        
        let docketCountBeforeDecrease = docket.docketItems[0].quantity
        docket.decreaseQuantity(of: "Cheeseburger")
        let docketCountAfterDecrease = docket.docketItems[0].quantity
        
        XCTAssertEqual(docketCountBeforeDecrease - docketCountAfterDecrease, 1)
    }
    
    func testDisplayDocket() {
        
        menu = Menu()
        docket = Docket(docketNumber: 1, tableNumber: 1, docketItems: [], totalAmount: 0.00, timeClosed: nil, dayClosed: nil, menu: menu)
        
        let emptyDocketString = docket.displayDocket()
        XCTAssertEqual(emptyDocketString, "")
        
        let menuItem = MenuItem(name: "Cheeseburger", description: "A tasty cheeseburger", price: 3.99)
        menu.add(menuItem, in: 0, and: 1)
        
        docket.addItem("Cheeseburger")
        let docketWithCheeseburgerString = docket.displayDocket()
        XCTAssertEqual(docketWithCheeseburgerString, "1x\tCheeseburger\t3.990\n")
    }
    
    func testGetTotalAmount() {
        
        menu = Menu()
        docket = Docket(docketNumber: 1, tableNumber: 1, docketItems: [], totalAmount: 0.00, timeClosed: nil, dayClosed: nil, menu: menu)
        
        let emptyDocketTotal = docket.getTotalAmount()
        XCTAssertEqual(emptyDocketTotal, 0.00)
        
        let menuItem = MenuItem(name: "Cheeseburger", description: "A tasty cheeseburger", price: 3.99)
        menu.add(menuItem, in: 0, and: 1)
        
        docket.addItem("Cheeseburger")
        let docketWithCheeseburgerTotal = docket.getTotalAmount()
        XCTAssertEqual(docketWithCheeseburgerTotal, 3.99)
        
    }
    
}
