import UIKit
import AVFoundation
class ViewController: UIViewController, CAAnimationDelegate {

    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var scheduleButton: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var videoLayer: UIView!
    @IBOutlet weak var image: UIImageView!
    
    var audioPlayer: AVAudioPlayer?
    let click = Bundle.main.path(forResource: "click", ofType: "mp3")!
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        mapButton.layer.borderWidth = 1
        scheduleButton.layer.borderWidth = 1
        label.layer.borderWidth = 1
            playVideo()
        
    }
    
    @IBAction func mapButton(_ sender: UIButton) {
        let url = URL(fileURLWithPath: click)
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        }catch{
            print("error!")
        }
    }
    
    @IBAction func scheduleButton(_ sender: UIButton) {
        let url = URL(fileURLWithPath: click)
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        }catch{
            print("error!")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        playVideo()
    }

    //Background Video\\
    func playVideo(){
        guard let path = Bundle.main.path(forResource: "moon", ofType: "mp4") else{
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        playerLayer.videoGravity = .resizeAspectFill
        self.videoLayer.layer.addSublayer(playerLayer)
        
        player.play()
        
        videoLayer.bringSubviewToFront(image)
        videoLayer.bringSubviewToFront(label)
        videoLayer.bringSubviewToFront(scheduleButton)
        videoLayer.bringSubviewToFront(mapButton)
    }
    
    
    
}

class tapLocationRecognizer{
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
