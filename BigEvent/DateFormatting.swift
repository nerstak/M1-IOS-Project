//
//  DateFormatting.swift
//  BigEvent
//
//  Created by user188893 on 4/4/21.
//

import Foundation

struct DateForm {
    let RFC3339DateFormatter = DateFormatter()
    let timeFormatter = DateFormatter()
    
    init() {
        RFC3339DateFormatter.locale = Locale(identifier: "fr_FR_POSIC")
        RFC3339DateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.000Z"
        

        timeFormatter.dateFormat = "HH:mm"
    }
    
    func convertToDate(string: String) -> Date {
        return RFC3339DateFormatter.date(from: string) ?? Date()
    }
    
    func convertToString(date: Date) -> String {
        return RFC3339DateFormatter.string(from: date)
    }
    
    func convertToHoursMinutes(string: String) -> String {
        return timeFormatter.string(from: convertToDate(string: string))
    }
}
