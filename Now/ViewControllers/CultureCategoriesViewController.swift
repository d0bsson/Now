//
//  CultureCategoriesViewController.swift
//  Now
//
//  Created by Дэвид Бердников on 11.02.2022.
//

import UIKit

class CultureCategoriesViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var cultures: [Culture] = []
    
    private let url = "https://kudago.com/public-api/v1.2/place-categories/?lang=ru"
    
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
        CGSize(width: UIScreen.main.bounds.width - 48, height: 100)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = cultures[indexPath.item].slug ?? "unowed"
        
        switch item {
        case "airports":
            print("SUCSESS \(item)")
        case "amusement":
            print("SUCSESS \(item)")
        case "animal-shelters":
            print("SUCSESS \(item)")
        case "anticafe":
            print("SUCSESS \(item)")
        case "art-centers":
            print("SUCSESS \(item)")
        case "art-space":
            print("SUCSESS \(item)")
        case "attractions":
            print("SUCSESS \(item)")
        case "bar":
            print("SUCSESS \(item)")
        case "brewery":
            print("SUCSESS \(item)")
        case "bridge":
            print("SUCSESS \(item)")
        case "business":
            print("SUCSESS \(item)")
        case "car-washes":
            print("SUCSESS \(item)")
        case "cats":
            print("SUCSESS \(item)")
        case "church":
            print("SUCSESS \(item)")
        case "cinema":
            print("SUCSESS \(item)")
        case "clubs":
            print("SUCSESS \(item)")
        case "comedy-club":
            print("SUCSESS \(item)")
        case "concert-hall":
            print("SUCSESS \(item)")
        case "coworking":
            print("SUCSESS \(item)")
        case "culture":
            print("SUCSESS \(item)")
        case "dance-studio":
            print("SUCSESS \(item)")
        case "dogs":
            print("SUCSESS \(item)")
        case "education-centers":
            print("SUCSESS \(item)")
        case "fountain":
            print("SUCSESS \(item)")
        case "handmade":
            print("SUCSESS \(item)")
        case "homesteads":
            print("SUCSESS \(item)")
        case "hostels":
            print("SUCSESS \(item)")
        case "inn":
            print("SUCSESS \(item)")
        case "kids":
            print("SUCSESS \(item)")
        case "library":
            print("SUCSESS \(item)")
        case "metro":
            print("SUCSESS \(item)")
        case "monastery":
            print("SUCSESS \(item)")
        case "museums":
            print("SUCSESS \(item)")
        case "observatory":
            print("SUCSESS \(item)")
        case "other":
            print("SUCSESS \(item)")
        case "palace":
            print("SUCSESS \(item)")
        case "park":
            print("SUCSESS \(item)")
        case "photo-places":
            print("SUCSESS \(item)")
        case "prirodnyj-zapovednik":
            print("SUCSESS \(item)")
        case "questroom":
            print("SUCSESS \(item)")
        case "recreation":
            print("SUCSESS \(item)")
        case "restaurants":
            print("SUCSESS \(item)")
        case "rynok":
            print("SUCSESS \(item)")
        case "salons":
            print("SUCSESS \(item)")
        case "shops":
            print("SUCSESS \(item)")
        case "sights":
            print("SUCSESS \(item)")
        case "stable":
            print("SUCSESS \(item)")
        case "station":
            print("SUCSESS \(item)")
        case "strip-club":
            print("SUCSESS \(item)")
        case "suburb":
            print("SUCSESS \(item)")
        case "synagogue":
            print("SUCSESS \(item)")
        case "temple":
            print("SUCSESS \(item)")
        case "theatre":
            print("SUCSESS \(item)")
        case "workshops":
            print("SUCSESS \(item)")
        default:
            break
        }
    }
    
    
    
    private func fetchData() {
        Network.shared.fetchCultureCategories(from: url) { [weak self] culture in
            self?.cultures = culture
            self?.collectionView.reloadData()
        }
    }
}
