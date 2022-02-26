//
//  Event.swift
//  Now
//
//  Created by Дэвид Бердников on 13.02.2022.
//

import Foundation

struct Event: Codable {
    let count: Int?
    let next: String?
    let previous: String?
    let results: [BarResult]?
}

struct BarResult: Codable {
    let dates: [Dates]?
    let title: String?
    let slug: String?
    let place: BarPlace?
    let description: String?
    let bodyText: String?
    let price: String?
    let images: [Image]?
    let siteURL: String?
    
    enum CodingKeys: String, CodingKey {
            case dates, title, slug, place
            case description = "description"
            case bodyText = "body_text"
            case price, images
            case siteURL = "site_url"
        }
}

struct Dates: Codable {
    let start: Int?
    let end: Int?
}

struct BarPlace: Codable {
    let id: Int?
}

struct Image: Codable {
    let image: String?
}







