//
//  CalendarUITests.swift
//  BigEventUITests
//
//  Created by Louis-Marie Merminod on 06/04/2021.
//

import XCTest

class CalendarUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
    }

    func testExample() throws {
        var response = app.scrollViews.firstMatch.descendants(matching: .button).firstMatch
        response.tap()
        response = app.otherElements["detailsView"]
        XCTAssert(response.exists)
    }

}
