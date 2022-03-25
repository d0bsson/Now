//
//  FinalEventCultureViewController.swift
//  Now
//
//  Created by Дэвид Бердников on 16.02.2022.
//

import UIKit

class FinalEventCultureViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    
    var time = ""
    var item = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Constans.getGradient(with: self.view, to: backgroundView)
        
        fetchData(time: time, item: item)
    }
    
    func fetchData(time: String, item: String) {
        let url = "https://kudago.com/public-api/v1.4/places/?lang=ru&fields=dates,title,short_title,slug,place,description,body_text,price,images,site_url&categories=\(item)&expand=images&location=msk&actual_since=\(time)"
        
        Network.shared.fetchPlaceData(from: url) { result in
            print(result.results?.randomElement() ?? "")
            print("+1 \(item)")
        }
    }
}
