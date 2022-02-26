//
//  FinalEvent.swift
//  Now
//
//  Created by Дэвид Бердников on 13.02.2022.
//

import UIKit

class FinalEventBarViewController: UIViewController {
        
    private var events: Event?
    private let time = String(Int(Date().timeIntervalSince1970))
    var item = ""
        
    override func viewDidLoad() {
        super.viewDidLoad()
//        fetchData(time: time, item: item)
    }
    
    func fetchData(time: String, item: String) {
        let url = "https://kudago.com/public-api/v1.4/events/?lang=ru&fields=dates,title,short_title,slug,place,description,body_text,price,images,site_url&categories=\(item)&expand=images&location=msk&actual_since=\(time)"
        Network.shared.fetchData(from: url) { result in
            print(result.results?.randomElement() ?? "")
            print("+1 \(item)")
        }
    }
}

