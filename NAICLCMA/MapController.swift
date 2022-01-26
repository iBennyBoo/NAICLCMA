import UIKit
import AVFoundation
class MapController: UIViewController {

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
        if view.bounds.contains(tapRecognizer.location(in: view))
        {
            print("\(tapRecognizer.location(in: view))")
            print("\(((tapRecognizer.location(in: view).x)/view.bounds.maxX)*100), \(((tapRecognizer.location(in: view).y)/view.bounds.maxY)*100)")
        }
    }
}
