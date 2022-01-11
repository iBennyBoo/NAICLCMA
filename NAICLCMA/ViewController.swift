//
//  ViewController.swift
//  NAICLCMA
//
//  Created by Ben Berman on 1/10/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let x = CAGradientLayer()
        x.frame = self.view.bounds
        x.colors = [UIColor.black.cgColor, UIColor.systemOrange.cgColor]
        self.view.layer.insertSublayer(x, at: 0)
    }


}

