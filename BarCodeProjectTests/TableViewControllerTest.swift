//
//  TableViewControllerTest.swift
//  BarCodeProjectTests
//
//  Created by Alexey Minin on 11/12/2019.
//  Copyright © 2019 Alexey Minin. All rights reserved.
//

import XCTest
@testable import BarCodeProject

class TableViewControllerTest: XCTestCase {

    var tableViewControllerUnderTest: TableBarCodeView!
    
    override func setUp() {
        super.setUp()
        tableViewControllerUnderTest = TableBarCodeView()
        self.tableViewControllerUnderTest.loadView()
        self.tableViewControllerUnderTest.viewDidLoad()
        
    }

    override func tearDown() {
        tableViewControllerUnderTest = nil
        super.tearDown()
    }
    
    
    func testTableViewHasDelegate() {
        XCTAssertNotNil(tableViewControllerUnderTest.tableView.delegate)
    }
    
    func testHasATableView() {
        XCTAssertNotNil(tableViewControllerUnderTest.tableView)
    }
    
    func testTableViewHasDataSource() {
        XCTAssertNotNil(tableViewControllerUnderTest.tableView.dataSource)
    }
}
