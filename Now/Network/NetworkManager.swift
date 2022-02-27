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
    
    func fetchBarResult(from url: String, with complition: @escaping (BarResult) -> Void) {
        guard let urlString = URL(string: url) else { return }
        URLSession.shared.dataTask(with: urlString) { (data, _, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let result = try JSONDecoder().decode(BarResult.self, from: data)
                DispatchQueue.main.async {
                    complition(result)
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    func fetchEventData(from url: String, with complition: @escaping (Event) -> Void) {
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
    
    func fetchBarCategories(from url: String, with comlition: @escaping ([Bar]) -> Void) {
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
    
    func fetchPlaceData(from url: String, with complition: @escaping (Place) -> Void) {
        guard let urlString = URL(string: url) else { return }
        URLSession.shared.dataTask(with: urlString) { (data, _, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let result = try JSONDecoder().decode(Place.self, from: data)
                DispatchQueue.main.async {
                    complition(result)
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    
    func fetchCultureCategories(from url: String, with comlition: @escaping ([Culture]) -> Void) {
        guard let urlString = URL(string: url) else { return }
        URLSession.shared.dataTask(with: urlString) { data, _, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            do {
                let result = try JSONDecoder().decode([Culture].self, from: data)
                DispatchQueue.main.async {
                    comlition(result)
                }
                
            } catch let error {
                print(error)
            }
        }.resume()
    }
}




