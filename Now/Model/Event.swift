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
    let body_text: String?
    let price: String?
    let images: [Images]?
    let site_url: String?
}

struct Dates: Codable {
    let start: Int?
    let end: Int?
}

struct Place: Codable {
    let id: Int?
}

struct Images: Codable {
    let image: String?
}





