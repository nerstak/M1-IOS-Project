//
//  Data.swift
//  BigEvent
//
//  Created by Louis-Marie Merminod on 03/04/2021.
//

import Foundation

class Api {
    func getSchedules(completion: @escaping ([Activity]) -> ()) {

        guard let url = URL(string: "https://api.airtable.com/v0/appXKn0DvuHuLw4DV/Schedule?view=Full%20schedule&api_key=keyuGTkgeGQoidxs6") else {
            return
        }

        URLSession.shared.dataTask(with: url) { (data, _, _) in
            if let data = data {
                let response = (try? JSONDecoder().decode(Schedule.self, from: data))?.records ?? []
                DispatchQueue.main.async {
                    completion(response)
                }
            }
        }.resume()
    }

    func getTopic(idTopic: String, completion: @escaping (String) -> ()) {

        guard let url = URL(string: "https://api.airtable.com/v0/appXKn0DvuHuLw4DV/Topics%20%26%20themes/\(idTopic)?api_key=keyuGTkgeGQoidxs6") else {
            return
        }

        URLSession.shared.dataTask(with: url) { (data, _, _) in
            if let data = data {
                let response = (try? JSONDecoder().decode(Topic.self, from: data))?.fields.topic ?? ""
                DispatchQueue.main.async {
                    completion(response)
                }
            }
        }.resume()
    }

    func getLocation(idLocation: String, completion: @escaping (String) -> ()) {

        guard let url = URL(string: "https://api.airtable.com/v0/appXKn0DvuHuLw4DV/Event%20locations/\(idLocation)?api_key=keyuGTkgeGQoidxs6") else {
            return
        }

        URLSession.shared.dataTask(with: url) { (data, _, _) in
            if let data = data {
                let response = (try? JSONDecoder().decode(Location.self, from: data))?.fields.spaceName ?? ""
                DispatchQueue.main.async {
                    completion(response)
                }
            }
        }.resume()
    }

    func getAttendees(completion: @escaping ([Person]) -> ()) {

        guard let url = URL(string: "https://api.airtable.com/v0/appXKn0DvuHuLw4DV/Speakers%20%26%20attendees?view=All%20people&api_key=keyuGTkgeGQoidxs6") else {
            return
        }

        URLSession.shared.dataTask(with: url) { (data, _, _) in
            if let data = data {
                let response = (try? JSONDecoder().decode(Persons.self, from: data))?.records ?? []
                DispatchQueue.main.async {
                    completion(response)
                }
            }
        }.resume()
    }

    func getPerson(idPerson: String, completion: @escaping (Person?) -> ()) {

        guard let url = URL(string: "https://api.airtable.com/v0/appXKn0DvuHuLw4DV/Speakers%20%26%20attendees/\(idPerson)?api_key=keyuGTkgeGQoidxs6") else {
            return
        }

        URLSession.shared.dataTask(with: url) {
            (data, _, _) in
            if let data = data {
                let response = (try? JSONDecoder().decode(Person.self, from: data))
                DispatchQueue.main.async {
                    completion(response)
                }
            }

        }.resume()
    }

    func getCompany(idCompany: String, completion: @escaping (String) -> ()) {

        guard let url = URL(string: "https://api.airtable.com/v0/appXKn0DvuHuLw4DV/Sponsors/\(idCompany)?api_key=keyuGTkgeGQoidxs6") else {
            return
        }

        URLSession.shared.dataTask(with: url)  {(data , _, _) in
            if let data = data {
                let response = (try? JSONDecoder().decode(Company.self, from: data))?.fields.company ?? ""
                DispatchQueue.main.async {
                    completion(response)
                }
            }
        }.resume()
    }

    func getSponsors(completion: @escaping ([Sponsor]) -> ()) {

        guard let url = URL(string: "https://api.airtable.com/v0/appXKn0DvuHuLw4DV/Sponsors?view=All%20sponsor%20companies&api_key=keyuGTkgeGQoidxs6") else {
            return
        }

        URLSession.shared.dataTask(with: url) { (data, _, _) in
            if let data = data {
                let response = (try? JSONDecoder().decode(Sponsors.self, from: data))?.records ?? []
                DispatchQueue.main.async {
                    completion(response)
                }
            }
        }.resume()
    }

}
