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
    

    func testDetailsViewAccess() throws {
        let element = app.scrollViews.firstMatch.descendants(matching: .button).firstMatch
        element.tap()
        let staticText = app.scrollViews.staticTexts["Activity informations"]
        XCTAssert(staticText.isHittable)
    }
    
    func testCalendarViewScroll() throws {
        let scrollview = app.scrollViews.firstMatch
        scrollview.swipeUp()
        let element = scrollview.descendants(matching: .button).element(boundBy: 5)
        element.tap()
        let staticText = app.scrollViews.staticTexts["Activity informations"]
        XCTAssert(staticText.isHittable)
    }
    
    func testCalendarDisplay() throws {
        let staticText = app.scrollViews.firstMatch.staticTexts["Friday - 15/11/19"]
        XCTAssert(staticText.isHittable)
    }

    func testAttendeesList() throws {
        let element = app.tabBars.firstMatch.buttons.element(boundBy: 1)
        element.tap()
        let staticText1 = app.staticTexts["loading..."]
        XCTAssert(staticText1.isHittable)
        sleep(3)
        let staticText2 = app.scrollViews.firstMatch.staticTexts["Attendees"]
        XCTAssert(staticText2.isHittable)
    }
    
    func testAttendeesListScroll() throws {
        let element = app.tabBars.firstMatch.buttons.element(boundBy: 1)
        element.tap()
        sleep(3)
        let scrollView = app.scrollViews.firstMatch
        scrollView.swipeUp()
        let staticText = scrollView.descendants(matching: .staticText)["Peyton Devereaux"]
        XCTAssert(staticText.isHittable)
    }
    
    func testSponsorsList() throws {
        let element = app.tabBars.firstMatch.buttons.element(boundBy: 2)
        element.tap()
        let staticText = app.scrollViews.firstMatch.staticTexts["Sponsors"]
        XCTAssert(staticText.isHittable)
    }
    
    func testSponsorsListScroll() throws {
        let element = app.tabBars.firstMatch.buttons.element(boundBy: 2)
        element.tap()
        sleep(3)
        let scrollView = app.scrollViews.firstMatch
        scrollView.swipeUp()
        let staticText = scrollView.descendants(matching: .staticText)["Playpen.io"]
        XCTAssert(staticText.isHittable)
    }
    
}
