import UIKit
import AVFoundation
class ViewController: UIViewController, CAAnimationDelegate {

    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var scheduleButton: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var videoLayer: UIView!
    @IBOutlet weak var image: UIImageView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let x = CAGradientLayer()
        //x.frame = self.view.bounds
        //x.colors = [UIColor.black.cgColor, UIColor.systemOrange.cgColor]
        //self.view.layer.insertSublayer(x, at: 0)
        
        mapButton.layer.borderWidth = 1
        scheduleButton.layer.borderWidth = 1
        label.layer.borderWidth = 1
            playVideo()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        playVideo()
    }

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
