import UIKit
import AVFoundation
class LunchController: UIViewController {

    @IBOutlet weak var pickButton: UIButton!
    @IBOutlet weak var border: UIImageView!
    @IBOutlet weak var pickLabel: UILabel!
    
    var previous = 20
    let options: [String] = ["McDonalds", "Popeyes", "Raising Canes", "Chick-fil-a", "Culvers", "Panda Express", "Noodles & Co.", "Taco Bell", "Jimmy Johns", "Five Guys", "Wendys"]
    
    var audioPlayer: AVAudioPlayer?
    let click = Bundle.main.path(forResource: "click", ofType: "mp3")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickButton.layer.borderWidth = 1
        pickLabel.layer.borderWidth = 1
        border.layer.borderWidth = 1
        pickLabel.isHidden = true
        
        let x = CAGradientLayer()
        x.frame = self.view.bounds
        x.colors = [UIColor.orange.cgColor, UIColor.systemBrown.cgColor, UIColor.black.cgColor]
        self.view.layer.insertSublayer(x, at: 0)
    }
    
    @IBAction func pickButton(_ sender: UIButton) {
        
        let url = URL(fileURLWithPath: click)
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        }catch{
            print("error!")
        }
        
        pickLabel.isHidden = false
        let random = Int.random(in: 0..<11)
        if(random != previous){
        print(random)
        pickLabel.text = "\(options[random])"
        previous = random
        } else{
            pickLabel.text = "School Lunch"
        }
    }
    
}
