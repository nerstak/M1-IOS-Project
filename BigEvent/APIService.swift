//
//  APIService.swift
//  BigEvent
//
//  Created by Louis-Marie Merminod on 24/03/2021.
//

import Foundation

class RequestFactory {
    func createRequest(urlStr: String) -> URLRequest {
        let url = URL(string: urlStr)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 100
        let accessToken = "keyuGTkgeGQoidxs6"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        return request
    }

    func getScheduleList(callback: @escaping ([Schedule]?) -> Void) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: createRequest(urlStr: "https://api.airtable.com/v0/appXKn0DvuHuLw4DV/Schedule?view=Full%20schedule&api_key=keyuGTkgeGQoidxs6")) {
            (data, response, error) in
            if let data = data, error == nil {
                if let responseHttp = response as? HTTPURLResponse,
                   responseHttp.statusCode == 200 {
                    if let response = try? JSONDecoder().decode(Record.self, from: data) {
                        callback(response.records)
                    } else {
                        print("Decode error")
                        callback(nil)
                    }
                } else {
                    print(response)
                    callback(nil)
                }
            } else {
                callback(nil)
            }
        }
        task.resume()
    }

    func getTopic(idTopic: String, callback: @escaping (String) -> Void) {
        let session = URLSession(configuration: .default)
        var topic: String = idTopic
        let task = session.dataTask(with: createRequest(urlStr: "https://api.airtable.com/v0/appXKn0DvuHuLw4DV/Topics%20%26%20themes/\(idTopic)?api_key=keyuGTkgeGQoidxs6")) {
            (data, response, error) in
            if let data = data, error == nil {
                if let responseHttp = response as? HTTPURLResponse,
                   responseHttp.statusCode == 200 {
                    if let response = try? JSONDecoder().decode(Topic.self, from: data) {
                        callback(response.fields.topic)
                        // print(topic)
                    } else {
                        print("Decode error")
                        callback(idTopic)
                    }
                } else {
                    print(response)
                    callback(idTopic)
                }
            }
        }
        task.resume()
    }
}
