import UIKit

class MapController: UIViewController {

    @IBOutlet weak var map: UIImageView!
    @IBOutlet weak var switchButton: UIButton!
    @IBOutlet var tapRecognizer: UITapGestureRecognizer!
    
    var x = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchButton.layer.borderWidth = 1
    }
    
    @IBAction func switchButton(_ sender: UIButton) {
        if(x == 0){
            x = 1
            switchButton.setTitle("Switch to First Floor", for: .normal)
            map.image = UIImage(named: "Improved Second Floor")
        } else if (x == 1){
            x = 0
            switchButton.setTitle("Switch to Second Floor", for: .normal)
            map.image = UIImage(named: "Improved First Floor")
        }
    }
    
    @IBAction func onTap(_ sender: Any)
    {
        print(view.bounds.maxX)
        if view.bounds.contains(tapRecognizer.location(in: view))
        {
            print("\(tapRecognizer.location(in: view))")
            print("\(((tapRecognizer.location(in: view).x)/view.bounds.maxX)*100), \(((tapRecognizer.location(in: view).y)/view.bounds.maxY)*100)")
        }
    }
}
