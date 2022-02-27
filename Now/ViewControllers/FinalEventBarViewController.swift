//
//  FinalEvent.swift
//  Now
//
//  Created by Дэвид Бердников on 13.02.2022.
//

import UIKit

class FinalEventBarViewController: UIViewController {
    @IBOutlet weak var imageBar: UIImageView!
    var images: [Image]?
    var item = ""
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func fetchData(time: String, item: String) {
        let url = "https://kudago.com/public-api/v1.4/events/?lang=ru&fields=dates,title,short_title,slug,place,description,body_text,price,images,site_url&categories=\(item)&expand=images&location=msk&actual_since=\(time)"
        Network.shared.fetchEventData(from: url) {  result in
            guard let randomEvent = result.results?.randomElement() else { return }
            
            guard let images1 = randomEvent.images else { return }
            
            DispatchQueue.main.async {
                self.images = images1
                print(self.images ?? "0")
            }
        }
    }
}

