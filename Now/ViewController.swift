//
//  ViewController.swift
//  Now
//
//  Created by Дэвид Бердников on 09.02.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            #colorLiteral(red: 0.6901960784, green: 0.9450980392, blue: 1, alpha: 1).cgColor,
            #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        ]
        view.layer.addSublayer(gradientLayer)
        //sdfsdfsdf
    }


}

