//
//  FinalEvent.swift
//  Now
//
//  Created by Дэвид Бердников on 13.02.2022.
//

import UIKit

class FinalEventBarViewController: UIViewController {
    
    @IBOutlet weak var eventImage: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var nameEventLabel: UILabel!
    @IBOutlet weak var descriptionEventLabel: UILabel!
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var time = ""
    var item = ""
        
    override func viewDidLoad() {
        super.viewDidLoad()
        Constans.getGradient(with: self.view, to: backgroundView)
        nameEventLabel.layer.cornerRadius = 15
        
        fetchData(time: time, item: item)
        
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        
    }
    
    func fetchData(time: String, item: String) {
        let url = "https://kudago.com/public-api/v1.4/events/?lang=ru&fields=dates,title,short_title,slug,place,description,body_text,price,images,site_url&categories=\(item)&expand=images&location=msk&actual_since=\(time)"

        Network.shared.fetchEventData(from: url) { result in
            guard let randomEvent = result.results?.randomElement() else { return }
            
// MARK: - Get random image from Event
            guard let images = randomEvent.images else { return }
            guard let randomImage = images.randomElement() else { return }
            guard let urlImage = randomImage.image else { return }
            guard let imageData = ImageManager.shared.fetchImage(from: urlImage) else { return }
            
// MARK: - Get date of event
//            guard let date = randomEvent.dates else { return }
//            guard let endDate = date.end else { return }
            
// MARK: - Get name event
            guard let nameEvent = randomEvent.title else { return }
            self.nameEventLabel.text = nameEvent
            
// MARK: - Get description event
            guard let descriptionEvent = randomEvent.description else { return }
            let decoderString = String(htmlEncodedString: descriptionEvent)
            self.descriptionEventLabel.text = decoderString
            
            DispatchQueue.main.async {
                self.eventImage.image = UIImage(data: imageData)
                self.activityIndicator.stopAnimating()
            }
        }
    }
}



