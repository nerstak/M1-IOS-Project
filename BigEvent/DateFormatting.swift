//
//  DateFormatting.swift
//  BigEvent
//
//  Created by user188893 on 4/4/21.
//

import Foundation


/// Structure to handle most dateformatting, using RFC3339 as its main formatting
struct DateForm {
    let RFC3339DateFormatter = DateFormatter()
    let timeFormatter = DateFormatter()
    let simpleDateFormatter = DateFormatter()
    
    init() {
        RFC3339DateFormatter.locale = Locale(identifier: "fr_FR_POSIC")
        RFC3339DateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.000Z"
        
        timeFormatter.dateFormat = "HH:mm"
        
        simpleDateFormatter.dateFormat = "dd/MM/yy"
    }
    
    /// Convert string RFC3339 to date
    /// - Parameter string: RFC3339 string
    /// - Returns: Date
    func convertToDate(string: String) -> Date {
        return RFC3339DateFormatter.date(from: string) ?? Date()
    }
    
    /// Convert date to string RFC3339
    /// - Parameter date: Date
    /// - Returns: RFC3339 string
    func convertToString(date: Date) -> String {
        return RFC3339DateFormatter.string(from: date)
    }
    
    
    /// Convert a RFC3339 string to HH:mm string
    /// - Parameter string: RFC3339 string
    /// - Returns: HH:mm string
    func convertToHoursMinutes(string: String) -> String {
        return timeFormatter.string(from: convertToDate(string: string))
    }
    
    
    /// Convert a string of RFC3339 to simpledate string
    /// - Parameter string: string RFC3339
    /// - Returns: simpledate string
    func convertToSimpleDate(string: String) -> String {
        return simpleDateFormatter.string(from: convertToDate(string: string))
    }
}
