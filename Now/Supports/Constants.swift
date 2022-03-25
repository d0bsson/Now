//
//  Constants.swift
//  Now
//
//  Created by Дэвид Бердников on 25.03.2022.
//

import UIKit

struct Constans {
    static let buttonBarTop = #colorLiteral(red: 0.968627451, green: 0.9803921569, blue: 1, alpha: 1)
    static let buttonBarBot = #colorLiteral(red: 0.6745098039, green: 0.6588235294, blue: 0.9450980392, alpha: 1)
    
    static let backgroundTop = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
    static let backgroundBot = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
    
    static func getGradient(with view: UIView, to outletView: UIView) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        
        gradientLayer.colors = [Constans.backgroundTop.cgColor,Constans.backgroundBot.cgColor]
        gradientLayer.shouldRasterize = true
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        outletView.layer.addSublayer(gradientLayer)
    }
}
