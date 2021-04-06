//
//  APITest.swift
//  BigEventTests
//
//  Created by Louis-Marie Merminod on 06/04/2021.
//

import XCTest
@testable import BigEvent

class APITest: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testGetSchedules() throws {
        Api().getSchedules { schedule in
            XCTAssertNotNil(schedule)
        }
    }
    
    func testGetTopic() throws {
        Api().getTopic(idTopic: "rec2hhpQxN998u8AD") { topic in
            XCTAssertEqual("Welcome to HomeTech 2019!", topic)
        }
    }
    
    func testGetLocation() throws {
        Api().getLocation(idLocation: "recoyHw0KB4S6hta9") { topic in
            XCTAssertEqual("President's dining hall", topic)
        }
    }
    
    func testGetAttendees() throws {
        Api().getAttendees { person in
            XCTAssertNotNil(person)
        }
    }
    
    func testGetPerson() throws {
        Api().getPerson(idPerson: "recYFwGSFyMK0IXkO") { person in
            XCTAssertEqual("belinda@email.com", person.fields.email)
        }
    }
    
    func testGetCompany() throws {
        Api().getCompany(idCompany: "recfHCalbyNhSTdlD") { company in
            XCTAssertEqual("SimplySafe", company)
        }
    }
    
    func testGetSponsors() throws {
        Api().getSponsors{ sponsor in
            XCTAssertNotNil(sponsor)
        }
    }
    
}
