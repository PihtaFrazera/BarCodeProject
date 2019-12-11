//
//  RegionNameCorrectTest.swift
//  BarCodeProjectTests
//
//  Created by Alexey Minin on 11/12/2019.
//  Copyright © 2019 Alexey Minin. All rights reserved.
//

import XCTest
@testable import BarCodeProject

class RegionNameCorrectTest: XCTestCase {
    var api: API!

    override func setUp() {
        super.setUp()
        api = API()
    }

    override func tearDown() {
        api = nil
        super.tearDown()
    }

    func testExample() {
      let expectedRegionName = "0c5b2444-70a0-4932-980c-b4dc0d3f02b5"
        
      XCTAssertEqual(api.region, expectedRegionName, "Регион кто то сменил")
    }
}
