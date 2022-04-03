//
//  BarCategories.swift
//  Now
//
//  Created by Дэвид Бердников on 11.02.2022.
//

import UIKit

class EventCategoriesViewController: UICollectionViewController {
    
    @IBOutlet var collectionViewBar: UICollectionView!
    
    var bars: [Bar] = []
    
    private let time = String(Int(Date().timeIntervalSince1970))
    private let urlBar = "https://kudago.com/public-api/v1.4/event-categories/?lang=ru"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        
        collectionViewBar.backgroundColor = .clear
        view.addVerticalGradientLayer(topColor:Constans.backgroundTop, bottomColor: Constans.backgroundBot)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        bars.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "barCell", for: indexPath) as! EventCell
        
        cell.barCellLabel.text = bars[indexPath.item].name
        cell.barCellLabel.font = .boldSystemFont(ofSize: 18)
        
        cell.contentView.addVerticalGradientLayer(topColor: Constans.buttonBarTop,
                                                  bottomColor: Constans.buttonBarBot)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: UIScreen.main.bounds.height / 6)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = bars[indexPath.item].slug ?? "unowed"
        
        switch item {
        case "business-events": tranferItem(time: time, item: item)
        case "cinema":          tranferItem(time: time, item: item)
        case "concert":         tranferItem(time: time, item: item)
        case "education":       tranferItem(time: time, item: item)
        case "entertainment":   tranferItem(time: time, item: item)
        case "exhibition":      tranferItem(time: time, item: item)
        case "fashion":         tranferItem(time: time, item: item)
        case "festival":        tranferItem(time: time, item: item)
        case "holiday":         tranferItem(time: time, item: item)
        case "kids":            tranferItem(time: time, item: item)
        case "other":           tranferItem(time: time, item: item)
        case "party":           tranferItem(time: time, item: item)
        case "photo":           tranferItem(time: time, item: item)
        case "quest":           tranferItem(time: time, item: item)
        case "recreation":      tranferItem(time: time, item: item)
        case "shopping":        tranferItem(time: time, item: item)
        case "social-activity": tranferItem(time: time, item: item)
        case "stock":           tranferItem(time: time, item: item)
        case "theater":         tranferItem(time: time, item: item)
        case "tour":            tranferItem(time: time, item: item)
        default:                tranferItem(time: time, item: item)
        }
    }
    
    private func tranferItem(time: String, item: String) {
        
        if let barVC = storyboard?.instantiateViewController(withIdentifier: "bar") as? RandomEventBarViewController {
            barVC.time = time
            barVC.item = item
            self.navigationController?.pushViewController(barVC, animated: true)
        }
    }
    
    private func fetchData() {
        Network.shared.fetchBarCategories(from: urlBar) { bar in
            self.bars = bar
            self.collectionView.reloadData()
        }
    }
    
}


