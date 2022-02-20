//
//  NetworkManager.swift
//  Now
//
//  Created by Дэвид Бердников on 13.02.2022.
//

import Foundation

final class Network {
    
    static let shared = Network()
    private init() {}
    
//    func getURL(city location: String, when day: String) -> URL? {
//        var components = URLComponents()
//
//        components.scheme = "https"
//        components.host = "kudago.com"
//        components.path = "/public-api/v1.4/events/"
//        components.queryItems = [
//            URLQueryItem(name: "lang", value: "ru"),
//            URLQueryItem(name: "fields", value: "dates,title,short_title,slug,place,description,body_text,price,images,site_url"),
//            URLQueryItem(name: "expand", value: "images"),
//            URLQueryItem(name: "location", value: location),
//            URLQueryItem(name: "actual_since", value: day)
//        ]
//
//        let url = components.url
//        return url
//    }
    
    
    
    
    func fetchData(from url: String, with complition: @escaping (Event) -> Void) {
        guard let urlString = URL(string: url) else { return }
        URLSession.shared.dataTask(with: urlString) { (data, _, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let result = try JSONDecoder().decode(Event.self, from: data)
                DispatchQueue.main.async {
                    complition(result)
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    func fetchCategories(from url: String, with comlition: @escaping ([Bar]) -> Void) {
        guard let urlString = URL(string: url) else { return }
        URLSession.shared.dataTask(with: urlString) { data, _, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            do {
                let result = try JSONDecoder().decode([Bar].self, from: data)
                DispatchQueue.main.async {
                    comlition(result)
                }
                
            } catch let error {
                print(error)
            }
        }.resume()
    }
}




