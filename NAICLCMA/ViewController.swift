//
//  ViewController.swift
//  NAICLCMA
//
//  Created by Ben Berman on 1/10/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var scheduleButton: UIButton!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let x = CAGradientLayer()
        x.frame = self.view.bounds
        x.colors = [UIColor.black.cgColor, UIColor.systemOrange.cgColor]
        self.view.layer.insertSublayer(x, at: 0)
        
        mapButton.layer.borderWidth = 1
        scheduleButton.layer.borderWidth = 1
        label.layer.borderWidth = 1
    }


}
class tapLocationRecognizer
{
    var x, y, z: Int
    init (X: Int, Y: Int)
    {
        x = X
        y = Y
        z = 0
    }
    init (X: Int, Y: Int, Z: Int)
    {
        x = X
        y = Y
        z = Z
    }
    func sendTap(tapGestureRecognizer: UITapGestureRecognizer)
    {
        
    }
}
