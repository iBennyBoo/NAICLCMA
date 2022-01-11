//
//  MapController.swift
//  NAICLCMA
//
//  Created by Ben Berman on 1/11/22.
//

import UIKit

class MapController: UIViewController {

    @IBOutlet weak var map: UIImageView!
    
    var x = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func switchButton(_ sender: UIButton) {
        if(x == 0){
            x = 1
            map.image = UIImage(named: "Improved Second Floor")
        } else if (x == 1){
            x = 0
            map.image = UIImage(named: "Improved First Floor")
        }
    }
    
}
