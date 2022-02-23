//
//  BarCategories.swift
//  Now
//
//  Created by Дэвид Бердников on 11.02.2022.
//

import UIKit

class BarCategoriesViewController: UICollectionViewController {

    var bars: [Bar] = []
    
    private let urlBar = "https://kudago.com/public-api/v1.2/event-categories/?lang=ru"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        bars.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "barCell", for: indexPath) as! BarCell
        cell.barCellLabel.text = bars[indexPath.item].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: UIScreen.main.bounds.height / 6)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = bars[indexPath.item].slug ?? "unowed"
        
        switch item {
        case "business-events": print("SUCSESS \(item)")
        case "cinema":          tranferItem(item: item)
        case "concert":         print("SUCSESS \(item)")
        case "education":       print("SUCSESS \(item)")
        case "entertainment":   print("SUCSESS \(item)")
        case "exhibition":      print("SUCSESS \(item)")
        case "fashion":         print("SUCSESS \(item)")
        case "festival":        print("SUCSESS \(item)")
        case "holiday":         print("SUCSESS \(item)")
        case "kids":            print("SUCSESS \(item)")
        case "other":           print("SUCSESS \(item)")
        case "party":           print("SUCSESS \(item)")
        case "photo":           print("SUCSESS \(item)")
        case "quest":           print("SUCSESS \(item)")
        case "recreation":      print("SUCSESS \(item)")
        case "shopping":        print("SUCSESS \(item)")
        case "social-activity": print("SUCSESS \(item)")
        case "stock":           print("SUCSESS \(item)")
        case "theater":         print("SUCSESS \(item)")
        case "tour":            print("SUCSESS \(item)")
        case "yarmarki-razvlecheniya-yarmarki": print("SUCSESS \(item)")
        default:
            break
        }
    }
    
    private func fetchData() {
        Network.shared.fetchBarCategories(from: urlBar) { [weak self] bar in
            self?.bars = bar
            self?.collectionView.reloadData()
        }
    }
}

private func tranferItem(item: String) {
    let vc = FinalEventBarViewController()
    vc.item = item
    print("321")
}
