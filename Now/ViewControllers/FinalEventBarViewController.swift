//
//  FinalEvent.swift
//  Now
//
//  Created by Дэвид Бердников on 13.02.2022.
//

import UIKit

class FinalEventBarViewController: UIViewController {
    @IBOutlet weak var eventImage: UIImageView!
    
    var item = ""
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func fetchData(time: String, item: String) {
        let url = "https://kudago.com/public-api/v1.4/events/?lang=ru&fields=dates,title,short_title,slug,place,description,body_text,price,images,site_url&categories=\(item)&expand=images&location=msk&actual_since=\(time)"
        
        Network.shared.fetchEventData(from: url) {  result in
            
            guard let randomEvent = result.results?.randomElement() else { return }
            guard let images = randomEvent.images else { return }
            guard let rndImage = images.randomElement() else { return }
            guard let url = rndImage.image else { return }
            print(url)
            guard let imageData = ImageManager.shared.fetchImage(from: url) else { return }
            print(imageData)
            DispatchQueue.main.async {
                self.eventImage.image = UIImage(data: imageData)
            }
        }
    }
}



