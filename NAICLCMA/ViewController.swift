import UIKit
import AVFoundation
class ViewController: UIViewController, CAAnimationDelegate {

    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var scheduleButton: UIButton!
    @IBOutlet weak var lunchButton: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var videoLayer: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var white: UIImageView!
    @IBOutlet weak var settings: UIBarButtonItem!
    
    var audioPlayer: AVAudioPlayer?
    let click = Bundle.main.path(forResource: "click", ofType: "mp3")!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        mapButton.layer.borderWidth = 1
        scheduleButton.layer.borderWidth = 1
        lunchButton.layer.borderWidth = 1
        label.layer.borderWidth = 1
            playVideo()
        if let items = UserDefaults.standard.data(forKey: "rooms6"){
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([String].self, from: items){
                ScheduleController.schedule = InfoClass(StringArray: decoded)
            }
        }
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
        videoLayer.bringSubviewToFront(white)
        videoLayer.bringSubviewToFront(lunchButton)
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
    @IBAction func setNewSchool(_ sender: Any)
    {
        let err = UIAlertController(title: "Select School", message: "", preferredStyle: .alert)
        err.addAction(<#T##action: UIAlertAction##UIAlertAction#>)
        err.addAction(UIAlertAction(title: "Confirm", style: .default, handler: nil))
    }
}
enum SchoolTypes
{
    case CrystalLakeCentral
    case CrystalLakeSouth
    case CylPrarieRidge
    case CylCary
}
