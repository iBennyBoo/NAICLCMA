import UIKit
import AVFoundation
class MapController: UIViewController {

    @IBOutlet weak var node1: UIImageView!
    @IBOutlet weak var node2: UIImageView!
    @IBOutlet weak var node3: UIImageView!
    @IBOutlet weak var node4: UIImageView!
    @IBOutlet weak var node5: UIImageView!
    @IBOutlet weak var node6: UIImageView!
    @IBOutlet weak var node7: UIImageView!
    @IBOutlet weak var node8: UIImageView!
    @IBOutlet weak var node9: UIImageView!
    @IBOutlet weak var map: UIImageView!
    @IBOutlet weak var switchButton: UIButton!
    @IBOutlet weak var simpLable: UILabel!
    @IBOutlet var tapRecognizer: UITapGestureRecognizer!
    
    var x = 0
    let flip = Bundle.main.path(forResource: "flip", ofType: "mp3")!
    let click = Bundle.main.path(forResource: "click", ofType: "mp3")!
    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchButton.layer.borderWidth = 1
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let iLoathSwift = 0.09745127436 * view.bounds.maxY
        var t = 0
        for i in ScheduleController.schedule.asList()
        {
            if i != " "
            {
                t += 1
                switch t
                {
                case 1:
                    node1.center = CGPoint(x: (RoomClass.coords[i]![0]/100) * map.bounds.maxX, y: ((RoomClass.coords[i]![1]/100) * map.bounds.maxY) + iLoathSwift)
                case 2:
                    node2.center = CGPoint(x: (RoomClass.coords[i]![0]/100) * map.bounds.maxX, y: ((RoomClass.coords[i]![1]/100) * map.bounds.maxY) + iLoathSwift)
                case 3:
                    node3.center = CGPoint(x: (RoomClass.coords[i]![0]/100) * map.bounds.maxX, y: ((RoomClass.coords[i]![1]/100) * map.bounds.maxY) + iLoathSwift)
                case 4:
                    node4.center = CGPoint(x: (RoomClass.coords[i]![0]/100) * map.bounds.maxX, y: ((RoomClass.coords[i]![1]/100) * map.bounds.maxY) + iLoathSwift)
                case 5:
                    node5.center = CGPoint(x: (RoomClass.coords[i]![0]/100) * map.bounds.maxX, y: ((RoomClass.coords[i]![1]/100) * map.bounds.maxY) + iLoathSwift)
                case 6:
                    node6.center = CGPoint(x: (RoomClass.coords[i]![0]/100) * map.bounds.maxX, y: ((RoomClass.coords[i]![1]/100) * map.bounds.maxY) + iLoathSwift)
                case 7:
                    node7.center = CGPoint(x: (RoomClass.coords[i]![0]/100) * map.bounds.maxX, y: ((RoomClass.coords[i]![1]/100) * map.bounds.maxY) + iLoathSwift)
                case 8:
                    node8.center = CGPoint(x: (RoomClass.coords[i]![0]/100) * map.bounds.maxX, y: ((RoomClass.coords[i]![1]/100) * map.bounds.maxY) + iLoathSwift)
                case 9:
                    node9.center = CGPoint(x: (RoomClass.coords[i]![0]/100) * map.bounds.maxX, y: ((RoomClass.coords[i]![1]/100) * map.bounds.maxY) + iLoathSwift)
                default: break
                }
            }
        }
        t = 0
        for i in ScheduleController.schedule.asList()
        {
            t += 1
            let b = codify(find: i)
            if b.0 == "0"
            {
                switch t
                {
                case 1: node1.isHidden = true
                case 2: node2.isHidden = true
                case 3: node3.isHidden = true
                case 4: node4.isHidden = true
                case 5: node5.isHidden = true
                case 6: node6.isHidden = true
                case 7: node7.isHidden = true
                case 8: node8.isHidden = true
                case 9: node9.isHidden = true
                default: break
                }
            }
            else if b.1 == true
            {
                if x == 0
                {
                    switch t
                    {
                    case 1: node1.isHidden = true
                    case 2: node2.isHidden = true
                    case 3: node3.isHidden = true
                    case 4: node4.isHidden = true
                    case 5: node5.isHidden = true
                    case 6: node6.isHidden = true
                    case 7: node7.isHidden = true
                    case 8: node8.isHidden = true
                    case 9: node9.isHidden = true
                    default: break
                    }
                }
                else
                {
                    switch t
                    {
                    case 1: node1.isHidden = false
                    case 2: node2.isHidden = false
                    case 3: node3.isHidden = false
                    case 4: node4.isHidden = false
                    case 5: node5.isHidden = false
                    case 6: node6.isHidden = false
                    case 7: node7.isHidden = false
                    case 8: node8.isHidden = false
                    case 9: node9.isHidden = false
                    default: break
                    }
                }
            }
            else
            {
                if x == 0
                {
                    switch t
                    {
                    case 1: node1.isHidden = false
                    case 2: node2.isHidden = false
                    case 3: node3.isHidden = false
                    case 4: node4.isHidden = false
                    case 5: node5.isHidden = false
                    case 6: node6.isHidden = false
                    case 7: node7.isHidden = false
                    case 8: node8.isHidden = false
                    case 9: node9.isHidden = false
                    default: break
                    }
                }
                else
                {
                    switch t
                    {
                    case 1: node1.isHidden = true
                    case 2: node2.isHidden = true
                    case 3: node3.isHidden = true
                    case 4: node4.isHidden = true
                    case 5: node5.isHidden = true
                    case 6: node6.isHidden = true
                    case 7: node7.isHidden = true
                    case 8: node8.isHidden = true
                    case 9: node9.isHidden = true
                    default: break
                    }
                }
            }
        }
        t = 0
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
        node2.isHidden = true
        if(x == 0){
            x = 1
            navigationItem.title = "2nd Floor"
            map.image = UIImage(named: "Improved Second Floor")
        } else if (x == 1){
            x = 0
            navigationItem.title = "1st Floor"
            map.image = UIImage(named: "Improved First Floor")
        }
        var t = 0
        for i in ScheduleController.schedule.asList()
        {
            t += 1
            let b = codify(find: i)
            if b.0 == "0"
            {
                switch t
                {
                case 1: node1.isHidden = true
                case 2: node2.isHidden = true
                case 3: node3.isHidden = true
                case 4: node4.isHidden = true
                case 5: node5.isHidden = true
                case 6: node6.isHidden = true
                case 7: node7.isHidden = true
                case 8: node8.isHidden = true
                case 9: node9.isHidden = true
                default: break
                }
            }
            else if b.1 == true
            {
                if x == 0
                {
                    switch t
                    {
                    case 1: node1.isHidden = true
                    case 2: node2.isHidden = true
                    case 3: node3.isHidden = true
                    case 4: node4.isHidden = true
                    case 5: node5.isHidden = true
                    case 6: node6.isHidden = true
                    case 7: node7.isHidden = true
                    case 8: node8.isHidden = true
                    case 9: node9.isHidden = true
                    default: break
                    }
                }
                else
                {
                    switch t
                    {
                    case 1: node1.isHidden = false
                    case 2: node2.isHidden = false
                    case 3: node3.isHidden = false
                    case 4: node4.isHidden = false
                    case 5: node5.isHidden = false
                    case 6: node6.isHidden = false
                    case 7: node7.isHidden = false
                    case 8: node8.isHidden = false
                    case 9: node9.isHidden = false
                    default: break
                    }
                }
            }
            else
            {
                if x == 0
                {
                    switch t
                    {
                    case 1: node1.isHidden = false
                    case 2: node2.isHidden = false
                    case 3: node3.isHidden = false
                    case 4: node4.isHidden = false
                    case 5: node5.isHidden = false
                    case 6: node6.isHidden = false
                    case 7: node7.isHidden = false
                    case 8: node8.isHidden = false
                    case 9: node9.isHidden = false
                    default: break
                    }
                }
                else
                {
                    switch t
                    {
                    case 1: node1.isHidden = true
                    case 2: node2.isHidden = true
                    case 3: node3.isHidden = true
                    case 4: node4.isHidden = true
                    case 5: node5.isHidden = true
                    case 6: node6.isHidden = true
                    case 7: node7.isHidden = true
                    case 8: node8.isHidden = true
                    case 9: node9.isHidden = true
                    default: break
                    }
                }
            }
        }
    }
    
    //Gets X & Y Coordinates\\
    @IBAction func onTap(_ sender: Any){
        print(view.bounds.maxX)
        
        if view.bounds.contains(tapRecognizer.location(in: map)) && !switchButton.bounds.contains(tapRecognizer.location(in: view))
        {
            print("\(tapRecognizer.location(in: view))")
            print("\(((tapRecognizer.location(in: map).x)/map.bounds.maxX)*100), \(((tapRecognizer.location(in: map).y)/map.bounds.maxY)*100)")
//            if node2.isHidden
//            {
//                node2.isHidden = false
//            }
//            node2.center = tapRecognizer.location(in: view)
//            node2.center.y -= tapRecognizer.location(in: view).y/map.bounds.maxY + 20
        }
    }
    func codify(find: String) -> (String, Bool)
    {
        var buul = false
        if find.first == "2" || find == "Band Room" || find == "Choir Room" || find == "Library" || find == "WR"
        {
            buul = true
        }
        else
        { }
        return (find, buul)
    }
    
}
