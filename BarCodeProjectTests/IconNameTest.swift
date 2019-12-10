//
//  IconNameTest.swift
//  IconNameTest
//
//  Created by Alexey Minin on 28/11/2019.
//  Copyright © 2019 Alexey Minin. All rights reserved.
//

import XCTest
@testable import BarCodeProject

class IconNameTest: XCTestCase {
    var controller: Controllers!
    
    override func setUp() {
        super.setUp()
        controller = Controllers()
    }

    override func tearDown() {
        controller = nil
        super.tearDown()
    }

    func testCorrectTabBarImageName() {
     let expectedNameIconShop = "iconShop"
     let expectedNameTabBar = "tabBar"
        
     XCTAssertEqual(controller.iconShop, UIImage(named: "\(expectedNameIconShop)"), "Кто то изменил название икноки магазина")
     XCTAssertEqual(controller.tabBarImage, UIImage(named: "\(expectedNameTabBar)"), "Кто то изменил название икноки TаbBar")
    }
    
}
