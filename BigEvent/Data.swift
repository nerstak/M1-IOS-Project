//
//  Data.swift
//  BigEvent
//
//  Created by Louis-Marie Merminod on 03/04/2021.
//

import Foundation

class Api {
    func getSchedules(completion: @escaping ([Schedule]) -> ()) {

        guard let url = URL(string: "https://api.airtable.com/v0/appXKn0DvuHuLw4DV/Schedule?view=Full%20schedule&api_key=keyuGTkgeGQoidxs6") else {
            return
        }

        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let response = try! JSONDecoder().decode(Record.self, from: data!)
            DispatchQueue.main.async {
                completion(response.records)
            }
        }.resume()
    }

    func getTopics(idTopic: String, completion: @escaping (String) -> ()) {

        guard let url = URL(string: "https://api.airtable.com/v0/appXKn0DvuHuLw4DV/Topics%20%26%20themes/\(idTopic)?api_key=keyuGTkgeGQoidxs6") else {
            return
        }

        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let response = try! JSONDecoder().decode(Topic.self, from: data!)
            DispatchQueue.main.async {
                completion(response.fields.topic)
            }
        }.resume()
    }
}
