import UIKit

struct Image : Codable {
    let url : String
}

struct Field : Codable {
    let name: String
    let type: String?
    let images: [Image]?
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case type = "Type"
        case images = "Images"
    }
}

struct Furniture : Codable {
    let id: String
    let fields: Field
}

struct Record : Codable {
    let records: [Furniture]
}

protocol RequestFactoryProtocol {
    func createRequest(urlStr: String) -> URLRequest
    func getFurnitureList(callback: @escaping ([Furniture]?) -> Void)
}

class RequestFactory : RequestFactoryProtocol {
    func createRequest(urlStr: String) -> URLRequest {
        let url = URL(string: urlStr)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 100
        let accessToken = "keyuGTkgeGQoidxs6"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        return request
    }
    
    func getFurnitureList(callback: @escaping ([Furniture]?) -> Void) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: createRequest(urlStr:"https://api.airtable.com/v0/appurgriHL535VVAP/Furniture?api_key=keyuGTkgeGQoidxs6")) {
            (data, response, error) in
            if let data = data, error == nil {
                if let responseHttp = response as? HTTPURLResponse,
                   responseHttp.statusCode == 200 {
                    if let response = try? JSONDecoder().decode(Record.self,from: data) {
                        callback(response.records)
                    }
                    else {
                        print("Decode error")
                        callback(nil)
                    }
                }
                else {
                    print(response)
                    callback(nil)
                }
            }
            else {
                callback(nil)
            }
        }
        task.resume()
    }
}

var rf: RequestFactory = RequestFactory()
rf.getFurnitureList() {
    (furnitures) in
    if let furnitures: [Furniture] = furnitures {
        for furniture in furnitures {
            print(furniture.id)
            print(furniture.fields.name)
            print(furniture.fields.type ?? "not defined")
            if let images : [Image] = furniture.fields.images {
                for image in images {
                    print(image.url)
                }
            }
        } }
    else {
        print("An error occured")
    }
}
