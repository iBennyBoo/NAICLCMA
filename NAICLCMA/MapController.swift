//
//  MapController.swift
//  NAICLCMA
//
//  Created by Ben Berman on 1/11/22.
//

import UIKit

class MapController: UIViewController {

    @IBOutlet weak var map: UIImageView!
    @IBOutlet weak var mapView: UIView!
    @IBOutlet var tapRecognizer: UITapGestureRecognizer!
    
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
    
    @IBAction func onTap(_ sender: Any)
    {
        if  tapRecognizer.location(in: mapView).x < mapView.frame.width && tapRecognizer.location(in: mapView).y < mapView.frame.height && tapRecognizer.location(in: mapView).x > 0 && tapRecognizer.location(in: mapView).y > 0
        {
            print("\(tapRecognizer.location(in: mapView))")
        }
    }
    
}
