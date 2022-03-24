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
        self.becomeFirstResponder()
        pickButton.layer.borderWidth = 1
        pickLabel.layer.borderWidth = 1
        border.layer.borderWidth = 1
        pickLabel.isHidden = true
        
        let x = CAGradientLayer()
        x.frame = self.view.bounds
        x.colors = [UIColor.orange.cgColor, UIColor.systemBrown.cgColor, UIColor.black.cgColor]
        self.view.layer.insertSublayer(x, at: 0)
    }
    
    override var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }
    
//    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
//        if motion == .motionShake {
//            let alert = UIAlertController(title: "Haha Funny Lmao XD", message: "+1 Reddit Gold & Ratio'd", preferredStyle: .alert)
//            let no = UIAlertAction(title: "Thank you Kanye, Very Cool!", style: .default, handler: nil)
//            let image = UIImage(named: "fact")
//            let imageView = UIImageView(frame: CGRect(x: 40, y: -210, width: 200, height: 200))
//            imageView.image = image
//
//            alert.view.addSubview(imageView)
//            //no.setValue(image, forKey: "image")
//            alert.addAction(no)
//            present(alert, animated: true, completion: nil)
//        }
//    }
    
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
