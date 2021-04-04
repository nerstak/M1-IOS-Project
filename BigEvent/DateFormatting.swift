//
//  DateFormatting.swift
//  BigEvent
//
//  Created by user188893 on 4/4/21.
//

import Foundation

struct DateForm {
    let RFC3339DateFormatter = DateFormatter()
    
    init() {
        RFC3339DateFormatter.locale = Locale(identifier: "fr_FR_POSIC")
        RFC3339DateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.ZZZZ"
    }
    
    func convertToDate(date: String) -> Date {
        return RFC3339DateFormatter.date(from: date)!
    }
    
    func convertToString(date: Date) -> String {
        return RFC3339DateFormatter.string(from: date)
    }
}
