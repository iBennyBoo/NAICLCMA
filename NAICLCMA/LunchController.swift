import UIKit

class LunchController: UIViewController {

    @IBOutlet weak var pickButton: UIButton!
    @IBOutlet weak var pickLabel: UILabel!
    
    let options: [String] = ["McDonalds", "Popeyes", "Raising Canes", "Chick-fil-a", "Culvers", "Panda Express", "Noodles & Co.", "Taco Bell", "Jimmy Johns", "Five Guys", "Wendys"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickButton.layer.borderWidth = 1
        pickLabel.layer.borderWidth = 1
        
        let x = CAGradientLayer()
        x.frame = self.view.bounds
        x.colors = [UIColor.orange.cgColor, UIColor.systemBrown.cgColor, UIColor.black.cgColor]
        self.view.layer.insertSublayer(x, at: 0)
    }
    
    @IBAction func pickButton(_ sender: UIButton) {
        let random = Int.random(in: 0..<13)
        print(random)
        pickLabel.text = "\(options[random])"
    }
    
}
