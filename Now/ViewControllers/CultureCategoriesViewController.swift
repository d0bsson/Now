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
            print("SUCSESS: \(item)")
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
