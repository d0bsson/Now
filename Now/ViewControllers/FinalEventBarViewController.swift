//
//  FinalEvent.swift
//  Now
//
//  Created by Дэвид Бердников on 13.02.2022.
//

import UIKit
import SafariServices

class FinalEventBarViewController: UIViewController {
    private var randomEvent: BarResult?
    
    @IBOutlet weak var eventImage: UIImageView!
    
    @IBOutlet weak var nameEventLabel: UILabel!
    @IBOutlet weak var descriptionEventLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var sourceButton: UIButton!
    
    var time = ""
    var item = ""
        
    override func viewDidLoad() {
        descriptionEventLabel.adjustsFontSizeToFitWidth = true
        
        descriptionEventLabel.minimumScaleFactor = 0.0001
        super.viewDidLoad()
        Constans.getGradient(with: self.view, to: backgroundView)
        
        fetchData(time: time, item: item)
                
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
    }
    
    func fetchData(time: String, item: String) {
        let url = "https://kudago.com/public-api/v1.4/events/?lang=ru&fields=dates,title,slug,place,description,price,images,site_url&categories=\(item)&expand=images,place&location=msk&actual_since=\(time)"

        Network.shared.fetchEventData(from: url) { [self] result in
            guard let randomEvent = result.results?.randomElement() else { return }
            self.randomEvent = randomEvent
            
// MARK: - Get random image from Event
            guard let images = randomEvent.images else { return }
            guard let randomImage = images.randomElement() else { return }
            guard let urlImage = randomImage.image else { return }
            guard let imageData = ImageManager.shared.fetchImage(from: urlImage) else { return }
                        
// MARK: - Get date of event
            guard let date = randomEvent.dates else { return }
            guard let endDate = date.first else { return }
            guard let startDate = endDate.start else { return }
            
// MARK: - Get name event
            guard let nameEvent = randomEvent.title else { return }
            
// MARK: - Get description event
            guard let descriptionEvent = randomEvent.description else { return }
            let decoderString = String(htmlEncodedString: descriptionEvent)
            
// MARK: - Get address event
            guard let place = randomEvent.place else { return }
            
// MARK: - Get price event
            getPriceEvent(randomEvent: randomEvent)
            
            DispatchQueue.main.async {
                self.eventImage.image = UIImage(data: imageData)
                self.dateLabel.text = String(startDate)
                self.nameEventLabel.text = nameEvent
                self.descriptionEventLabel.text = decoderString
                self.addressLabel.text = place.address
                self.activityIndicator.stopAnimating()
            }
        }
    }
    @IBAction func refreshButtonPressed() {
        fetchData(time: time, item: item)
    }
    
    @IBAction func sourceButtonPressed() {
        guard let url = URL(string: randomEvent?.siteURL ?? "") else { return }
        let source = SFSafariViewController(url: url)
        present(source, animated: true)
    }
    
    private func getPriceEvent(randomEvent: BarResult) {
        if randomEvent.price != "" {
            self.priceLabel.text = randomEvent.price
        } else {
            self.priceLabel.text = "Бесплатно!"
        }
    }
}



