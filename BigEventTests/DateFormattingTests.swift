import XCTest
@testable import BigEvent

class DateFormattingTests: XCTest {
    let df = DateForm()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testConvertToDate() throws {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.000Z"
        
        // Not a date in string
        XCTAssertEqual(Date(), df.convertToDate(string: "Not a date"))
        
        // Checking correct conversion
        XCTAssertEqual(dateFormatter.date(from: "2021-04-16T23:42:00.000Z"), df.convertToDate(string: "2021-04-16T23:42:00.000Z"))
        
        // Checking conversion with wrong formatting
        XCTAssertNotEqual(dateFormatter.date(from: "2021-04-16T23:42:00.000Z"), df.convertToDate(string: "04-16-2021T23:42:00.000Z"))
    }
    
    func testConvertToString() throws {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.000Z"
        guard let date = dateFormatter.date(from: "2021-04-16T23:42:00.000Z") else {
            return
        }
        
        // Checking correct conversion
        XCTAssertEqual("2021-04-16T23:42:00.000Z", df.convertToString(date: date))
        
        // Checking conversion with wrong formatting
        XCTAssertNotEqual("04-16-2021T23:42:00.000Z", df.convertToString(date: date))
    }
    
    func testConvertHoursMinutes() throws {
        XCTAssertEqual("23:42", df.convertToHoursMinutes(string: "2021-04-16T23:42:00.000Z"))
    }
    
    
    func testConvertSimpleDate() throws {
        XCTAssertEqual("16/04/2021", df.convertToSimpleDate(string: "2021-04-16T23:42:00.000Z"))
    }
}
