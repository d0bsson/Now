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
        Constans.getGradient(with: self.view, to: gradientLayerView)
        
        var shouldAutorotate: Bool {
                return false
            }
    }
}

