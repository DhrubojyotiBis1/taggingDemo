//
//  taggingDemoTests.swift
//  taggingDemoTests
//
//  Created by Dhrubojyoti on 28/03/20.
//  Copyright © 2020 Dhrubojyoti. All rights reserved.
//

import XCTest
@testable import taggingDemo

class taggingDemoTests: XCTestCase {

    var categorySelected:selectedCatagory!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.categorySelected = selectedCatagory()
    }

    func testDefaulSelectedCategory() {
        XCTAssertNil(categorySelected.category)
    }
    
    func testAssignmentSelectedCategory(){
        self.categorySelected.category = .game
        XCTAssertEqual(self.categorySelected.category, .game)
    }

    func testSelectedCategoryIsValidCategory() {
        self.categorySelected.category = .art
        var isValidCategory:Bool!
        if self.categorySelected.category == .art || self.categorySelected.category == .game || self.categorySelected.category == .animation || self.categorySelected.category == .music || self.categorySelected.category == .experimental || self.categorySelected.category == .others || self.categorySelected.category == .story{
            
            isValidCategory = true
        }
        XCTAssertTrue(isValidCategory)
    }

}
