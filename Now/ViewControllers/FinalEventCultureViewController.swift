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
            print(randomPlace)
            if let images = randomPlace.images {
                if let image = images.randomElement() {
                    if let urlImage = image.image {
                        if let imageData = ImageManager.shared.fetchImage(from: urlImage) {
                            self.placeImage.image = UIImage(data: imageData)
                            self.placeActivityIndicator.stopAnimating()
                        }
                    }
                }
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
