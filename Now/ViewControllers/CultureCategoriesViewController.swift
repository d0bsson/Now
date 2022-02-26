//
//  CultureCategoriesViewController.swift
//  Now
//
//  Created by Дэвид Бердников on 11.02.2022.
//

import UIKit

class CultureCategoriesViewController: UICollectionViewController {
    
    var cultures: [Culture] = []
    
    private let time = String(Int(Date().timeIntervalSince1970))
    private let urlCulture = "https://kudago.com/public-api/v1.4/place-categories/?lang=ru"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cultures.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cultureCell", for: indexPath) as! CultureCell
        cell.cultureCellLabel.text = cultures[indexPath.item].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: UIScreen.main.bounds.height / 6)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = cultures[indexPath.item].slug ?? "unowed"
        
        switch item {
        case "airports":            tranferItem(time: time, item: item)
        case "amusement":           tranferItem(time: time, item: item)
        case "animal-shelters":     tranferItem(time: time, item: item)
        case "anticafe":            tranferItem(time: time, item: item)
        case "art-centers":         tranferItem(time: time, item: item)
        case "art-space":           tranferItem(time: time, item: item)
        case "attractions":         tranferItem(time: time, item: item)
        case "bar":                 tranferItem(time: time, item: item)
        case "brewery":             tranferItem(time: time, item: item)
        case "bridge":              tranferItem(time: time, item: item)
        case "business":            tranferItem(time: time, item: item)
        case "car-washes":          tranferItem(time: time, item: item)
        case "cats":                tranferItem(time: time, item: item)
        case "church":              tranferItem(time: time, item: item)
        case "cinema":              tranferItem(time: time, item: item)
        case "clubs":               tranferItem(time: time, item: item)
        case "comedy-club":         tranferItem(time: time, item: item)
        case "concert-hall":        tranferItem(time: time, item: item)
        case "coworking":           tranferItem(time: time, item: item)
        case "culture":             tranferItem(time: time, item: item)
        case "dance-studio":        tranferItem(time: time, item: item)
        case "dogs":                tranferItem(time: time, item: item)
        case "education-centers":   tranferItem(time: time, item: item)
        case "fountain":            tranferItem(time: time, item: item)
        case "handmade":            tranferItem(time: time, item: item)
        case "homesteads":          tranferItem(time: time, item: item)
        case "hostels":             tranferItem(time: time, item: item)
        case "inn":                 tranferItem(time: time, item: item)
        case "kids":                tranferItem(time: time, item: item)
        case "library":             tranferItem(time: time, item: item)
        case "metro":               tranferItem(time: time, item: item)
        case "monastery":           tranferItem(time: time, item: item)
        case "museums":             tranferItem(time: time, item: item)
        case "observatory":         tranferItem(time: time, item: item)
        case "other":               tranferItem(time: time, item: item)
        case "palace":              tranferItem(time: time, item: item)
        case "park":                tranferItem(time: time, item: item)
        case "photo-places":        tranferItem(time: time, item: item)
        case "prirodnyj-zapovednik":tranferItem(time: time, item: item)
        case "questroom":           tranferItem(time: time, item: item)
        case "recreation":          tranferItem(time: time, item: item)
        case "restaurants":         tranferItem(time: time, item: item)
        case "rynok":               tranferItem(time: time, item: item)
        case "salons":              tranferItem(time: time, item: item)
        case "shops":               tranferItem(time: time, item: item)
        case "sights":              tranferItem(time: time, item: item)
        case "stable":              tranferItem(time: time, item: item)
        case "station":             tranferItem(time: time, item: item)
        case "strip-club":          tranferItem(time: time, item: item)
        case "suburb":              tranferItem(time: time, item: item)
        case "synagogue":           tranferItem(time: time, item: item)
        case "temple":              tranferItem(time: time, item: item)
        case "theatre":             tranferItem(time: time, item: item)
        default:                    tranferItem(time: time, item: item)
        }
    }
    
    private func tranferItem(time: String, item: String) {
        let vc = FinalEventCultureViewController()
        vc.fetchData(time: time, item: item)
        vc.item = item
    }
    
    private func fetchData() {
        Network.shared.fetchCultureCategories(from: urlCulture) { [weak self] culture in
            self?.cultures = culture
            self?.collectionView.reloadData()
        }
    }
}
