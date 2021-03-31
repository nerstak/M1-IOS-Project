//
//  Models.swift
//  BigEvent
//
//  Created by Louis-Marie Merminod on 24/03/2021.
//

import Foundation

struct Record: Codable {
    let records: [Schedule]
}

struct Schedule: Codable {
    let id: String
    var fields: ScheduleFields
}

struct ScheduleFields: Codable {
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

extension ScheduleFields {

}

extension Schedule {
    mutating func getTopicsNames() {
        if let topics = self.fields.topics {
            for topic in topics {
                RequestFactory().getTopic(idTopic: topic) { s in
                    self.fields.topics = s
                }
            }
        } else {
            print("An error occured")
        }
    }
}
