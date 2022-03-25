//
//  BarCategories.swift
//  Now
//
//  Created by Дэвид Бердников on 11.02.2022.
//

import UIKit

class BarCategoriesViewController: UICollectionViewController {
    
    @IBOutlet var collectionViewBar: UICollectionView!
    
    var bars: [Bar] = []
    
    private let time = String(Int(Date().timeIntervalSince1970))
    private let urlBar = "https://kudago.com/public-api/v1.4/event-categories/?lang=ru"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
//      getGradient()
        collectionViewBar.backgroundColor = .clear
        
        view.addVerticalGradientLayer(topColor:#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), bottomColor: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        bars.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "barCell", for: indexPath) as! BarCell
        cell.barCellLabel.text = bars[indexPath.item].name
        cell.barCellLabel.font = .boldSystemFont(ofSize: 18)
        cell.contentView.addVerticalGradientLayer(topColor: Constans.buttonTop, bottomColor: Constans.buttonBot)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: UIScreen.main.bounds.height / 6)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = bars[indexPath.item].slug ?? "unowed"
//        let selectedCell:UICollectionViewCell = collectionView.cellForItemAtIndexPath(indexPath)!
//               selectedCell.contentView.backgroundColor = UIColor(red: 102/256, green: 255/256, blue: 255/256, alpha: 0.66)
        
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
        
        if let barVC = storyboard?.instantiateViewController(withIdentifier: "bar") as? FinalEventBarViewController {
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


