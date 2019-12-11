//
//  ArrayDataForSwapTest.swift
//  BarCodeProjectTests
//
//  Created by Alexey Minin on 10/12/2019.
//  Copyright © 2019 Alexey Minin. All rights reserved.
//

import XCTest
@testable import BarCodeProject

class ArrayDataForSwapTest: XCTestCase {
    var dataForSwap: DataForSwap!
    
    override func setUp() {
        super.setUp()
        dataForSwap = DataForSwap()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        dataForSwap = nil
        super.tearDown()
    }

    func testArraEqualNil() {
        
        XCTAssertEqual(dataForSwap.images, [], "Массив картинок не пустой")
        XCTAssertEqual(dataForSwap.name, [], "Массив имени не пустой")
        XCTAssertEqual(dataForSwap.price, [], "Массив цены не пустой")
    }

}
