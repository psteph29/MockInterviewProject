//
//  Network .swift
//  MockInterviewProject#2
//
//  Created by Paige Stephenson on 7/17/23.
//

import Foundation
import UIKit

enum LoadUserError: Error, LocalizedError {
    case userNotFound
    case imageNotFound
}

class Network: Codable {
    
    var baseURL = URL(string: "https://randomuser.me/api")!
    
    func loadUsers(gender: Bool, location: Bool, nationality: Bool, count: Int) async throws -> [Person] {
        
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)!
        
        var includes = "name,picture"
        
        if gender {
            includes.append(",gender")
        }
        
        if location {
            includes.append(",location")
        }
        
        if nationality {
            includes.append(",nat")
        }
        
        let incItem = URLQueryItem(name: "inc", value: includes)
        let resultsItem = URLQueryItem(name: "results", value: "\(count)")
        urlComponents.queryItems = [incItem, resultsItem]
        
        let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw LoadUserError.userNotFound
        }
        
        let decoder = JSONDecoder()
        let personResults = try decoder.decode(Results.self, from: data)
        return personResults.results
    }
    
    func fetchPhoto(from url: URL) async throws -> UIImage {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw LoadUserError.imageNotFound
        }
        guard let image = UIImage(data: data) else {
            throw LoadUserError.imageNotFound
        }
        return image 
    }
    
}







//NEED TO MAKE A CALL FOR THE PHOTO WITH THE URL AS A STRING
