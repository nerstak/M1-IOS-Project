//
//  ModelTest.swift
//  BigEventTests
//
//  Created by user187540 on 4/6/21.
//

import Foundation
import XCTest
@testable import BigEvent
import SwiftUI

class ModelTest: XCTestCase{
    func testInitSchedule(){
        let fields : ActivityFields = ActivityFields(topics:["recAKdp3HN8grGVua"], type:"Keynote", activity:"Afternoon keynote (Friday)", start:"2019-11-26T16:00:00.000Z", end:"2019-11-15T16:50:00.000Z", locationId:["recc0LBkI7amZjeSm"], speakerIds:["recgIq9dSaYx31O6S"])
        let activity: Activity = Activity(id:"rec4o7clxR6tnN4jC", fields: fields)
        let schedule: Schedule = Schedule(records:[activity])
        
        XCTAssertEqual(schedule.records[0].fields.topics?[0], "recAKdp3HN8grGVua")
        XCTAssertEqual(schedule.records[0].fields.type, "Keynote")
        XCTAssertEqual(schedule.records[0].fields.activity, "Afternoon keynote (Friday)")
        XCTAssertEqual(schedule.records[0].fields.start, "2019-11-26T16:00:00.000Z")
    }
    
    func testInitTopic(){
        let field : TopicFields  = TopicFields(topic: "Welcome to HomeTech 2019!")
        let topic : Topic = Topic(fields: field)
        
        XCTAssertEqual(topic.fields.topic,"Welcome to HomeTech 2019!")
    }
    func testInitPerson(){
        let field : PersonFields = PersonFields(name: "Belinda Chen", role: "Product manager",type:"Speaker", email: "belinda@email.com", phone: "(123) 456-7890", company: ["rec85MXeafiZSqdWr"])
        let record : Person = Person(id: "recYFwGSFyMK0IXkO", fields: field)
        let persons : Persons = Persons(records: [record])
        
        XCTAssertEqual(persons.records[0].id, "recYFwGSFyMK0IXkO")
        XCTAssertEqual(persons.records[0].fields.name, "Belinda Chen")
        XCTAssertEqual(persons.records[0].fields.role, "Product manager")
        XCTAssertEqual(persons.records[0].fields.type, "Speaker")
        XCTAssertEqual(persons.records[0].fields.email, "belinda@email.com")
        XCTAssertEqual(persons.records[0].fields.phone, "(123) 456-7890")
        XCTAssertEqual(persons.records[0].fields.company[0], "rec85MXeafiZSqdWr")
    }
    func testIsSpeakerPersonFields(){
        let attendee : PersonFields = PersonFields(name: "Belinda Chen", role: "Product manager", type:"Attendee", email: "belinda@email.com", phone: "(123) 456-7890", company: ["rec85MXeafiZSqdWr"])
        let speaker : PersonFields = PersonFields(name: "Belinda Chen", role: "Product manager",type:"Speaker", email: "belinda@email.com", phone: "(123) 456-7890", company: ["rec85MXeafiZSqdWr"])
        XCTAssertTrue(speaker.isSpeaker())
        XCTAssertFalse(attendee.isSpeaker())
    }
    func testGetColorPersonFields(){
        let attendee : PersonFields = PersonFields(name: "Belinda Chen", role: "Product manager", type:"Attendee", email: "belinda@email.com", phone: "(123) 456-7890", company: ["rec85MXeafiZSqdWr"])
        let speaker : PersonFields = PersonFields(name: "Belinda Chen", role: "Product manager",type:"Speaker", email: "belinda@email.com", phone: "(123) 456-7890", company: ["rec85MXeafiZSqdWr"])
        XCTAssertEqual(attendee.getColor(), Color.pink)
        XCTAssertEqual(speaker.getColor(), Color.blue)
    }
    func testGetColorActivityFields(){
        let keynote : ActivityFields = ActivityFields(topics:["recAKdp3HN8grGVua"], type:"Keynote", activity:"Afternoon keynote (Friday)", start:"2019-11-26T16:00:00.000Z", end:"2019-11-15T16:50:00.000Z", locationId:["recc0LBkI7amZjeSm"], speakerIds:["recgIq9dSaYx31O6S"])
        XCTAssertEqual(keynote.getColor(), Color.orange)
        let panel : ActivityFields = ActivityFields(topics:["recAKdp3HN8grGVua"], type:"Panel", activity:"Afternoon keynote (Friday)", start:"2019-11-26T16:00:00.000Z", end:"2019-11-15T16:50:00.000Z", locationId:["recc0LBkI7amZjeSm"], speakerIds:["recgIq9dSaYx31O6S"])
        XCTAssertEqual(panel.getColor(), Color.blue)
        let workshop : ActivityFields = ActivityFields(topics:["recAKdp3HN8grGVua"], type:"Workshop", activity:"Afternoon keynote (Friday)", start:"2019-11-26T16:00:00.000Z", end:"2019-11-15T16:50:00.000Z", locationId:["recc0LBkI7amZjeSm"], speakerIds:["recgIq9dSaYx31O6S"])
        XCTAssertEqual(workshop.getColor(), Color.pink)
        let breakout_session : ActivityFields = ActivityFields(topics:["recAKdp3HN8grGVua"], type:"Breakout session", activity:"Afternoon keynote (Friday)", start:"2019-11-26T16:00:00.000Z", end:"2019-11-15T16:50:00.000Z", locationId:["recc0LBkI7amZjeSm"], speakerIds:["recgIq9dSaYx31O6S"])
        XCTAssertEqual(breakout_session.getColor(), Color.purple)
        let meal : ActivityFields = ActivityFields(topics:["recAKdp3HN8grGVua"], type:"Meal", activity:"Afternoon keynote (Friday)", start:"2019-11-26T16:00:00.000Z", end:"2019-11-15T16:50:00.000Z", locationId:["recc0LBkI7amZjeSm"], speakerIds:["recgIq9dSaYx31O6S"])
        XCTAssertEqual(meal.getColor(), Color.yellow)
        let networking : ActivityFields = ActivityFields(topics:["recAKdp3HN8grGVua"], type:"Networking", activity:"Afternoon keynote (Friday)", start:"2019-11-26T16:00:00.000Z", end:"2019-11-15T16:50:00.000Z", locationId:["recc0LBkI7amZjeSm"], speakerIds:["recgIq9dSaYx31O6S"])
        XCTAssertEqual(networking.getColor(), Color.green)
        let unknown : ActivityFields = ActivityFields(topics:["recAKdp3HN8grGVua"], type:"unknown", activity:"Afternoon keynote (Friday)", start:"2019-11-26T16:00:00.000Z", end:"2019-11-15T16:50:00.000Z", locationId:["recc0LBkI7amZjeSm"], speakerIds:["recgIq9dSaYx31O6S"])
        XCTAssertEqual(unknown.getColor(), Color.gray)
    }
}
