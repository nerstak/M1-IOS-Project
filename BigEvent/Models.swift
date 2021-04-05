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

struct Location: Codable {
    let id: String
    var fields: LocationFields
}

struct LocationFields: Codable {
    let spaceName: String

    enum CodingKeys: String, CodingKey {
        case spaceName = "Space name"
    }
}

struct Persons: Codable {
    let records: [Person]
}

struct Person: Codable, Identifiable {
    let id: String
    var fields: PersonFields
}

struct PersonFields: Codable {
    var name: String
    var role: String
    var email: String
    var phone: String
    var company: [String]

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case role = "Role"
        case email = "Email"
        case phone = "Phone"
        case company = "Company"
    }

    func isSpeaker() -> Bool {
        return self.role == "Speaker";
    }

    func getColor() -> Color {
        if (isSpeaker()) {
            return Color.blue
        } else {
            return Color.pink
        }

    }
}

struct Company: Codable {
    let id: String
    var fields: CompanyFields
}

struct CompanyFields: Codable {
    let company: String

    enum CodingKeys: String, CodingKey {
        case company = "Company"
    }
}

struct Sponsors: Codable {
    let records: [Sponsor]
}

struct Sponsor: Codable, Identifiable {
    let id: String
    var fields: SponsorFields
}

struct SponsorFields: Codable {
    var previousSponsor: Bool
    var company: String
    var status: String
    var sponsoredAmount: Int
    var notes: String

    enum CodingKeys: String, CodingKey {
        case previousSponsor = "Previous sponsor"
        case company = "Company"
        case status = "Status"
        case sponsoredAmount = "Sponsored amount"
        case notes = "Notes"
    }
}

