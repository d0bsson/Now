//
//  ViewController.swift
//  Now
//
//  Created by Дэвид Бердников on 09.02.2022.
//

import UIKit

class BarAndCultureViewController: UIViewController {

    @IBOutlet weak var gradientLayerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getGradient()
        
        var shouldAutorotate: Bool {
                return false
            }
    }

        
    private func getGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        
        gradientLayer.colors = [#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1).cgColor, UIColor(red: 252/255, green: 238/255, blue: 33/255, alpha: 1).cgColor]
        gradientLayer.shouldRasterize = true
        gradientLayer.startPoint = CGPoint(x: 0, y: 0) // Top left corner.
        gradientLayer.endPoint = CGPoint(x: 1, y: 1) // Bottom right corner.
        
        gradientLayerView.layer.addSublayer(gradientLayer)
        
    }
    
    
}

