//
//  User.swift
//  MockInterviewProject#2
//
//  Created by Paige Stephenson on 7/17/23.
//

import Foundation

struct Results: Codable {
    let results: [Person]
}

struct Person: Codable {
    let gender: String?
    let name: Name
    let location: Location?
    let picture: Picture
    let nat: String?
}

struct Name: Codable {
    let title: String
    let first: String
    let last: String
}

struct Location: Codable {
    let street: Street
    let city: String
    let state: String
    let country: String
    let postcode: Int
    let coordinates: Coordinates
    let timezone: Timezone
}

struct Street: Codable {
    let number: Int
    let name: String
}

struct Coordinates: Codable {
    let latitude: String
    let longitude: String
}

struct Timezone: Codable {
    let offset: String
    let description: String
}

struct Picture: Codable {
    let large: String
    let medium: String
    let thumbnail: String
}
