import UIKit
import AVFoundation
class MapController: UIViewController {

    @IBOutlet var node: UIImageView!
    @IBOutlet weak var map: UIImageView!
    @IBOutlet weak var switchButton: UIButton!
    @IBOutlet var tapRecognizer: UITapGestureRecognizer!
    
    var x = 0
    let flip = Bundle.main.path(forResource: "flip", ofType: "mp3")!
    let click = Bundle.main.path(forResource: "click", ofType: "mp3")!
    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchButton.layer.borderWidth = 1
        
    }
    
    //Switches Between Floors of Building\\
    @IBAction func switchButton(_ sender: UIButton) {
        let url = URL(fileURLWithPath: flip)
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        }catch{
            print("error!")
        }
        node.isHidden = true
        if(x == 0){
            x = 1
            navigationItem.title = "2nd Floor"
            map.image = UIImage(named: "Improved Second Floor")
        } else if (x == 1){
            x = 0
            navigationItem.title = "1st Floor"
            map.image = UIImage(named: "Improved First Floor")
        }
    }
    
    //Gets X & Y Coordinates\\
    @IBAction func onTap(_ sender: Any){
        print(view.bounds.maxX)
        
        if view.bounds.contains(tapRecognizer.location(in: view)) && !switchButton.bounds.contains(tapRecognizer.location(in: view))
        {
            print("\(tapRecognizer.location(in: view))")
            print("\(((tapRecognizer.location(in: map).x)/map.bounds.maxX)*100), \(((tapRecognizer.location(in: map).y)/map.bounds.maxY)*100)")
            if node.isHidden
            {
                node.isHidden = false
            }
            node.center = tapRecognizer.location(in: view)
            node.center.y -= 15
        }
    }
}
