//
//  Place.swift
//  Now
//
//  Created by Дэвид Бердников on 26.02.2022.
//

import Foundation

// MARK: - Place
struct Place: Codable {
    let count: Int?
    let next: String?
    let previous: String?
    let results: [PlaceResult]?
}

// MARK: - Result
struct PlaceResult: Codable {
    let address, phone, resultDescription: String?
    let foreignURL: String?
    let subway: String?
    let images: [PlaceImage]?
    let shortTitle: String?

    enum CodingKeys: String, CodingKey {
        case address, phone
        case resultDescription = "description"
        case foreignURL = "foreign_url"
        case subway, images
        case shortTitle = "short_title"
    }
}

// MARK: - Image
struct PlaceImage: Codable {
    let image: String?
}
