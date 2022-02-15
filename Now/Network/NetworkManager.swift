//
//  NetworkManager.swift
//  Now
//
//  Created by Дэвид Бердников on 13.02.2022.
//

import Foundation

final class Network {
    
    static let shared = Network()
    
    static let url = "https://kudago.com/public-api/v1.4/events/?lang=ru&fields=dates,title,short_title,slug,place,description,body_text,price,images,site_url&expand=images&location=msk&actual_since= 1644761128"
    
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
    
    
    
    func fetchData(from url: String, completion: @escaping(Event) -> Void) {
        guard let url = URL(string: url) else { return }
        print("1")
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                print(error?.localizedDescription ?? "no descripption")
                return
            }
            
            do {
                let result = try JSONDecoder().decode(Event.self, from: data)
                DispatchQueue.main.async {
                    print("data: \(result)")
                    completion(result)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
    private init() {}
}


