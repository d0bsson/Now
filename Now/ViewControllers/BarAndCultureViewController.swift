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
        
        gradientLayer.colors = [Constans.backgroundTop.cgColor,Constans.backgroundBot.cgColor]
        gradientLayer.shouldRasterize = true
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1) 
        
        gradientLayerView.layer.addSublayer(gradientLayer)
    }
}

