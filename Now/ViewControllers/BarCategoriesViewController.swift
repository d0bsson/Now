//
//  BarCategories.swift
//  Now
//
//  Created by Дэвид Бердников on 11.02.2022.
//

import UIKit

class BarCategoriesViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let bars: [Bar] = []
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "barCell", for: indexPath) as! BarCell
        
        cell.barCellLabel.text = bars[indexPath.item].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: 100)
    }
    
    
}
