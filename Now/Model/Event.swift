//
//  Event.swift
//  Now
//
//  Created by Дэвид Бердников on 13.02.2022.
//

import Foundation

struct Event: Codable {
    let count: Int
    let next: String
    let previous: String?
    let results: [Result]?
}

struct Result: Codable {
    let dates: [Dates]?
    let title: String?
    let slug: String?
    let place: Place?
    let description: String?
    let bodyText: String?
    let price: String?
    let images: [Image]?
    let siteURL: String?
}

struct Dates: Codable {
    let start: Int?
    let end: Int?
}

struct Place: Codable {
    let id: Int?
}

struct Image: Codable {
    let image: String?
}

enum CodingKeys: String, CodingKey {
        case bodyText = "body_text"
        case siteURL = "site_url"
    }





