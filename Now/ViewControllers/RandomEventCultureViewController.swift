//
//  FinalEventCultureViewController.swift
//  Now
//
//  Created by Дэвид Бердников on 16.02.2022.
//

import UIKit
import SafariServices

class RandomEventCultureViewController: UIViewController {
    private var randomPlace: PlaceResult?
    
    @IBOutlet weak var placeImage: UIImageView!
    
    @IBOutlet weak var namePlaceLabel: UILabel!
    @IBOutlet weak var descriptionPlaceLabel: UILabel!
    @IBOutlet weak var addressPlaceLabel: UILabel!
    @IBOutlet weak var subwayPlace: UILabel!
    @IBOutlet weak var phonePlaceLabel: UILabel!
    
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
        print(item)
        print("111")
        
        placeActivityIndicator.startAnimating()
        placeActivityIndicator.hidesWhenStopped = true
    }
    
    func fetchData(time: String, item: String) {
        let url = "https://kudago.com/public-api/v1.4/places/?lang=ru&fields=images,short_title,address,phone,description,foreign_url,subway&expand=&text_format=&ids=&location=msk&has_showings=&categories=\(item)"
        
        Network.shared.fetchPlaceData(from: url) { result in
            guard let randomPlace = result.results?.randomElement() else { return }
            self.randomPlace = randomPlace
// MARK: - Get name event
            guard let urlImage = randomPlace.images?.randomElement()?.image else { return }
            guard let imageData = ImageManager.shared.fetchImage(from: urlImage) else { return }
            
// MARK: - Get name event
            guard let namePlace = randomPlace.shortTitle else { return }
// MARK: - Get description event
            guard let descriptionEvent = randomPlace.resultDescription else { return }
            let decoderString = String(htmlEncodedString: descriptionEvent)
            
// MARK: - Get address event
            guard let addressPlace = randomPlace.address else { return }
            
// MARK: - Get phone number
            guard let phonePlace = randomPlace.phone else { return }
            
// MARK: - Get subway place
            guard let subwayPlace = randomPlace.subway else { return }
            
            DispatchQueue.main.async {
                self.placeImage.image = UIImage(data: imageData)
                self.namePlaceLabel.text = namePlace
                self.descriptionPlaceLabel.text = decoderString
                self.addressPlaceLabel.text = addressPlace
                self.phonePlaceLabel.text = phonePlace
                self.subwayPlace.text = "метро \(subwayPlace)"
                self.placeActivityIndicator.stopAnimating()
            }
        }
    }
    
    @IBAction func refreshPlacePressed() {
        fetchData(time: time, item: item)
    }
    
    
    @IBAction func buyTicketPlacePressed() {
        guard let url = URL(string: randomPlace?.foreignURL ?? "") else { return }
        let source = SFSafariViewController(url: url)
        present(source, animated: true)
    }
    @IBAction func sharePlaceButtonPressed() {
        Constans.shareButton(view: self, url: randomPlace?.foreignURL)
        
    }
}
