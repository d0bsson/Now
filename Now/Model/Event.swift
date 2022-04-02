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
    let shortTitle: String?
    let slug: String?
    let place: BarPlace?
    let description: String?
    let bodyText: String?
    let price: String?
    var images: [EventImage]?
    var siteURL: String?
    
    enum CodingKeys: String, CodingKey {
            case dates, title, slug, place
            case description = "description"
            case bodyText = "body_text"
            case price, images
            case siteURL = "site_url"
            case shortTitle = "short_title"
        }
}

struct EventImage: Codable {
    let image: String?
}

struct Dates: Codable {
    let start: Date?
    let end: Date?
}

struct BarPlace: Codable {
    let id: Int?
    let title, slug, address, phone: String
        let subway: String
        let siteURL: String
        let isClosed: Bool
        let coords: Coords
        let isStub: Bool

        enum CodingKeys: String, CodingKey {
            case id, title, slug, address, phone, subway
            case siteURL = "site_url"
            case isClosed = "is_closed"
            case coords
            case isStub = "is_stub"
        }
}

struct Coords: Codable {
    let lat, lon: Double
}









