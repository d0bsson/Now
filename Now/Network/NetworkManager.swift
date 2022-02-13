//
//  NetworkManager.swift
//  Now
//
//  Created by Дэвид Бердников on 13.02.2022.
//

import Foundation

final class Network {
    
    static let shared = Network()
    
    func getURL(city location: String, when day: String) -> URL? {
        var components = URLComponents()
        
        components.scheme = "https"
        components.host = "kudago.com"
        components.path = "/public-api/v1.4/events/"
        components.queryItems = [
            URLQueryItem(name: "lang", value: "ru"),
            URLQueryItem(name: "fields", value: "dates,title,short_title,slug,place,description,body_text,price,images,site_url"),
            URLQueryItem(name: "expand", value: "images"),
            URLQueryItem(name: "location", value: location),
            URLQueryItem(name: "actual_since", value: day)
        ]

        let url = components.url
        return url
    }
    
    func fetchData(from url: String?, with complition: @escaping (Event) -> Void) {
        guard let stringURL = url else { return }
        guard let url = URL(string: stringURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let event = try JSONDecoder().decode(Event.self, from: data)
                DispatchQueue.main.async {
                    complition(event)
                }
            } catch let error {
                print(error)
            }
            
        }.resume()
    }
    
    private init() {}
}


