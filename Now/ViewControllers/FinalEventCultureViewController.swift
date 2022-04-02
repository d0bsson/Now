//
//  FinalEventCultureViewController.swift
//  Now
//
//  Created by Дэвид Бердников on 16.02.2022.
//

import UIKit
import SafariServices

class FinalEventCultureViewController: UIViewController {
    private var randomPlace: BarResult?
    
    @IBOutlet weak var placeImage: UIImageView!
    
    @IBOutlet weak var namePlaceLabel: UILabel!
    @IBOutlet weak var descriptionPlaceLabel: UILabel!
    @IBOutlet weak var addressPlaceLabel: UILabel!
    @IBOutlet weak var pricePlaceLabel: UILabel!
    @IBOutlet weak var datePlaceLabel: UILabel!
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var placeActivityIndicator: UIActivityIndicatorView!
    
    var time = ""
    var item = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        Constans.getGradient(with: self.view, to: backgroundView)
        Constans.adjustsFontSize(labels: [namePlaceLabel,
                                          descriptionPlaceLabel,
                                          addressPlaceLabel])
        fetchData(time: time, item: item)
        
        placeActivityIndicator.startAnimating()
        placeActivityIndicator.hidesWhenStopped = true
    }
    
    func fetchData(time: String, item: String) {
        let url = "https://kudago.com/public-api/v1.4/places/?lang=ru&fields=dates,title,short_title,slug,place,description,body_text,price,images,site_url&categories=\(item)&expand=images&location=msk&actual_since=\(time)"
        
        Network.shared.fetchEventData(from: url) { result in
            guard let randomPlace = result.results?.randomElement() else { return }
            self.randomPlace = randomPlace
                        
            guard let urlImage = randomPlace.images?.randomElement()?.image else { return }
            guard let imageData = ImageManager.shared.fetchImage(from: urlImage) else { return }
            
// MARK: - Get date of event
//                        guard let date = randomPlace.dates else { return }
//                        guard let endDate = date.first else { return }
//                        guard let startDate = endDate.start else { return }
//                        self.datePlaceLabel.text = String(startDate)

// MARK: - Get name event
                        guard let nameEvent = randomPlace.title else { return }
                        self.namePlaceLabel.text = nameEvent

// MARK: - Get description event
                        guard let descriptionEvent = randomPlace.description else { return }
                        let decoderString = String(htmlEncodedString: descriptionEvent)
                        self.descriptionPlaceLabel.text = decoderString

// MARK: - Get address event
                        guard let place = randomPlace.place else { return }

            DispatchQueue.main.async {
                self.placeImage.image = UIImage(data: imageData)
                self.addressPlaceLabel.text = place.address
                self.placeActivityIndicator.stopAnimating()
            }
        }
    }
    
    @IBAction func refreshPlacePressed() {
        fetchData(time: time, item: item)
    }
    
    
    @IBAction func buyTicketPlacePressed() {
        guard let url = URL(string: randomPlace?.siteURL ?? "") else { return }
        let source = SFSafariViewController(url: url)
        present(source, animated: true)
    }
}
