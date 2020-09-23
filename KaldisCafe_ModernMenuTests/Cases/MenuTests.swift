//
//  MenuTests.swift
//  KaldisCafe_ModernMenuTests
//
//  Created by Matthies Abera on 19/9/20.
//  Copyright © 2020 Thinking Bear Solutions. All rights reserved.
//

import XCTest
@testable import KaldisCafe_ModernMenu

class MenuTests: XCTestCase {

    var menu: Menu!
    
    func testMenuNames() {
        
        menu = Menu()
        
        let foodMenu = menu.menuNames[0]
        let drinksMenu = menu.menuNames[1]
        
        XCTAssertEqual(foodMenu, "food menu")
        XCTAssertEqual(drinksMenu, "drinks menu")
    }
    
    func testSubMenuNames() {
         
        menu = Menu()
        
        let breakfast = menu.subMenuNames[0][0]
        let lunchAndDinner = menu.subMenuNames[0][1]
        let vegetarian = menu.subMenuNames[0][2]
        let extras = menu.subMenuNames[0][3]
        
        let beverage = menu.subMenuNames[1][0]
        let coffeeCeremony = menu.subMenuNames[1][1]
        
        XCTAssertEqual(breakfast, "breakfast")
        XCTAssertEqual(lunchAndDinner, "lunch and dinner")
        XCTAssertEqual(vegetarian, "vegetarian")
        XCTAssertEqual(extras, "extras")
        
        XCTAssertEqual(beverage, "beverage")
        XCTAssertEqual(coffeeCeremony, "coffee ceremony")
    }
    
    func testGetMenuItemFeature() {
        
        menu = Menu()
        
        let menuItem = MenuItem(name: "Cheeseburger", description: "A delicious burger with cheese", price: 3.99)
        
        menu.add(menuItem, in: 0, and: 1)
        
        let name = menu.get("name", of: "Cheeseburger") as! String
        let description = menu.get("description", of: "Cheeseburger") as! String
        let price = menu.get("price", of: "Cheeseburger") as! Float
        
        XCTAssertEqual(name, "Cheeseburger")
        XCTAssertEqual(description, "A delicious burger with cheese")
        XCTAssertEqual(price, 3.99)
    }
    
    func testAddMenuItem() {
        
        menu = Menu()
        
        let menuItem = MenuItem(name: "Cheeseburger", description: "A delicious burger with cheese", price: 3.99)
        
        menu.add(menuItem, in: 0, and: 1)
        
        let addedMenuItem = menu.alreadyContains("Cheeseburger")
        
        XCTAssertTrue(addedMenuItem)
    }
    
    func testEditMenuItem() {
        
        menu = Menu()
        
        let menuItem = MenuItem(name: "Cheeseburger", description: "A delicious burger with cheese", price: 3.99)
        
        menu.add(menuItem, in: 0, and: 1)
        
        let editedMenuItem = MenuItem(name: "Cheeseburger", description: "A delicious burger with cheese", price: 4.99)
        
        menu.edit(editedMenuItem, in: 0, and: 1, and: 6)
        
        XCTAssertEqual(menu.menu[0][1][6].price, 4.99)
    }
    
    func testDeleteMenuItem() {
        
        menu = Menu()
        
        let menuItem = MenuItem(name: "Cheeseburger", description: "A delicious burger with cheese", price: 3.99)
        
        menu.add(menuItem, in: 0, and: 1)
        
        let countBeforeDeletion = menu.menu[0][1].count
        
        menu.deleteItem(in: 0, and: 1, and: 6)
        
        let countAfterDeletion = menu.menu[0][1].count
        
        XCTAssertEqual(countBeforeDeletion - countAfterDeletion, 1)
    }
    
    func testAlreadyContainsMenuItem() {
        
        menu = Menu()
        
        let menuItem = MenuItem(name: "Cheeseburger", description: "A delicious burger with cheese", price: 3.99)
        
        menu.add(menuItem, in: 0, and: 1)
        
        let alreadyContains = menu.alreadyContains("Cheeseburger")
        
        XCTAssertTrue(alreadyContains)
    }
}
