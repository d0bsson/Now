//
//  FinalEvent.swift
//  Now
//
//  Created by Дэвид Бердников on 13.02.2022.
//

import UIKit

class FinalEventBarViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    private var event: Event?
    private let time = String(Int(Date().timeIntervalSince1970))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData(time: time)
    }
    
    private func fetchData(time: String) {
        let url = "https://kudago.com/public-api/v1.4/events/?lang=ru&fields=dates,title,short_title,slug,place,description,body_text,price,images,site_url&expand=images&location=msk&actual_since=\(time)"
        
        print("ENTER METHOD \n")
        Network.shared.fetchData(from: url) { event in
            self.titleLabel.text = String(event.count)
        }
    }
    
}

