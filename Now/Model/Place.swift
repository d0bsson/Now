//
//  Place.swift
//  Now
//
//  Created by Дэвид Бердников on 26.02.2022.
//

import Foundation

struct Place: Codable {
    let count: Int?
    let next: Int?
    let previous: Int?
    let results: [BarResult]?
}

struct PlaceResult: Codable {
    let id: Int
    let title, slug, address, phone: String
    let siteURL: String
    let subway: String
    let isClosed: Bool
    let location: String
    let hasParkingLot: Bool

    enum CodingKeys: String, CodingKey {
        case id, title, slug, address, phone
        case siteURL = "site_url"
        case subway
        case isClosed = "is_closed"
        case location
        case hasParkingLot = "has_parking_lot"
    }
}
