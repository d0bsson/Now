//
//  NetworkManager.swift
//  Now
//
//  Created by Дэвид Бердников on 13.02.2022.
//

import Foundation

class Network {
    
    static let shared = Network()
    
    let currentDay = Int(Date().timeIntervalSince1970)
    
    func getUrl() {
        
        var components = URLComponents()
        components.
        
        
    }
    
    static let urlCatigories = "https://kudago.com/public-api/v1.2/events/?location=msk&categories=concert"
    
    static let url = "https://kudago.com/public-api/v1.4/events/?lang=ru&fields=dates,title,short_title,slug,place,description,body_text,price,images,site_url&expand=images&location=msk&actual_since= \((Int(Date().timeIntervalSince1970)))"
    
    
    private init() {}
}


