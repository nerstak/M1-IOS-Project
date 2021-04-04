//
//  Models.swift
//  BigEvent
//
//  Created by Louis-Marie Merminod on 24/03/2021.
//

import Foundation
import SwiftUI

struct Schedule: Codable {
    let records: [Activity]
}

struct Activity: Codable, Identifiable {
    let id: String
    var fields: ActivityFields
}

struct ActivityFields: Codable {
    var topics: [String]?
    let type: String
    let activity: String
    let start: String
    let end: String
    let locationId: [String]
    let speakerIds: [String]?

    enum CodingKeys: String, CodingKey {
        case topics = "Topic / theme"
        case activity = "Activity"
        case type = "Type"
        case start = "Start"
        case end = "End"
        case locationId = "Location"
        case speakerIds = "Speaker(s)"
    }

    func getColor() -> Color {
        switch type {
        case "Keynote":
            return Color.orange
        case "Panel":
            return Color.blue
        case "Workshop":
            return Color.pink
        case "Breakout session":
            return Color.purple
        case "Meal":
            return Color.yellow
        case "Networking":
            return Color.green
        default:
            return Color.gray
        }
    }
}

struct Topic: Codable {
    let fields: TopicFields
}

struct TopicFields: Codable {
    var topic: String

    enum CodingKeys: String, CodingKey {
        case topic = "Topic / theme"
    }
}
