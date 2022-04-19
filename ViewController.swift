import UIKit
import AVFoundation
class ViewController: UIViewController, CAAnimationDelegate {

    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var scheduleButton: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var videoLayer: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var white: UIImageView!
    
    var audioPlayer: AVAudioPlayer?
    let click = Bundle.main.path(forResource: "click", ofType: "mp3")!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        mapButton.layer.borderWidth = 1
        scheduleButton.layer.borderWidth = 1
            playVideo()
        if let items = UserDefaults.standard.data(forKey: "rooms"){
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([String].self, from: items){
                ScheduleController.schedule = InfoClass(StringArray: decoded)
            }
        }

        label.attributedText = NSMutableAttributedString(string: "Student Map App",
        attributes: stroke(font: UIFont(name: "American Typewriter", size: 40)!,
        strokeWidth: 4, insideColor: UIColor.orange, strokeColor: UIColor.black))
    }
    
    public func stroke(font: UIFont, strokeWidth: Float, insideColor: UIColor, strokeColor: UIColor) -> [NSAttributedString.Key: Any]{
        return [
            NSAttributedString.Key.strokeColor : strokeColor,
            NSAttributedString.Key.foregroundColor : insideColor,
            NSAttributedString.Key.strokeWidth : -strokeWidth,
            NSAttributedString.Key.font : font
            ]
    }
    
    @IBAction func mapButton(_ sender: UIButton) {
        print("working")
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
        guard let path = Bundle.main.path(forResource: "DistanterLights", ofType: "mp4") else{
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
        videoLayer.bringSubviewToFront(white)
        
    }
    
}
