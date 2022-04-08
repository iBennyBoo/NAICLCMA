import UIKit
import AVFoundation
class MapController: UIViewController, UIScrollViewDelegate {

    var nodeArr = [UIImageView]()
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
    @IBOutlet weak var schedule: UIImageView!
    
    @IBOutlet weak var bloodyView: UIImageView!
    @IBOutlet weak var switchButton: UIButton!
    @IBOutlet var tapRecognizer: UITapGestureRecognizer!
    @IBOutlet weak var scrollView: UIScrollView!
        @IBOutlet weak var imageViewBottomConstraint: NSLayoutConstraint!
        @IBOutlet weak var imageViewLeadingConstraint: NSLayoutConstraint!
        @IBOutlet weak var imageViewTopConstraint: NSLayoutConstraint!
        @IBOutlet weak var imageViewTrailingConstraint: NSLayoutConstraint!
    
    var date = Date()
    var time = Timer()
    var calendar = Calendar.current
    
    var x = 0
    let flip = Bundle.main.path(forResource: "flip", ofType: "mp3")!
    let click = Bundle.main.path(forResource: "click", ofType: "mp3")!
    var audioPlayer: AVAudioPlayer?
    var skittle = ScheduleController.schedule
    var currNode: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nodeArr = [node1, node2, node3, node4, node5, node6, node7, node8, node9]
        switchButton.layer.borderWidth = 1
        scrollView.maximumZoomScale = 6
        scrollView.minimumZoomScale = 1
        scrollView.delegate = self
        if let items = UserDefaults.standard.data(forKey: "rooms"){
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([String].self, from: items){
                ScheduleController.schedule = InfoClass(StringArray: decoded)
            }
        }
        skittle = ScheduleController.schedule
        viewDidAppear(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        reform()
        deter()
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return map
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        if (scrollView.zoomScale > 1){
        if let image = map.image {
            let width = map.frame.width / image.size.width
            let height = map.frame.height / image.size.height
            
            let ratio = width < height ? width : height
            let newWidth = image.size.width * ratio
            let newHeight = image.size.height * ratio
            let conditionLeft = newWidth * scrollView.zoomScale > map.frame.width
            let left = 0.5 * (conditionLeft ? newWidth - map.frame.width : (scrollView.frame.width - scrollView.contentSize.width))
            let conditionTop = newHeight * scrollView.zoomScale > map.frame.height
            let top = 0.5 * (conditionTop ? newHeight - map.frame.height : (scrollView.frame.height - scrollView.contentSize.height))
            
            scrollView.contentInset = UIEdgeInsets(top: top, left: left, bottom: top, right: left)
            }
        } else{
            scrollView.contentInset = .zero
        }
        reform()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        reform()
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
        deter()
        scrollView.zoomScale = 1
    }
    
    //Gets X & Y Coordinates\\
    @IBAction func onTap(_ sender: Any)
    {
            print("\(tapRecognizer.location(in: view))")
            print("\(((tapRecognizer.location(in: map).x - map.bounds.maxX/2)/map.bounds.maxX)*100), \(((tapRecognizer.location(in: map).y - map.bounds.maxY/2)/map.bounds.maxY)*100)")
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
    func deter()
    {
        var t = 0
        for i in skittle.asList()
        {
            let b = codify(find: i)
            if b.0 == "0" || b.0 == "---"
            {
                nodeArr[t].isHidden = true
            }
            else if b.1 == true
            {
                if x == 0
                {
                    nodeArr[t].isHidden = true
                }
                else
                {
                    nodeArr[t].isHidden = false
                }
            }
            else
            {
                if x == 0
                {
                    nodeArr[t].isHidden = false
                }
                else
                {
                    nodeArr[t].isHidden = true
                }
            }
            t += 1
        }
    }
    func reform()
    {
        let mapCent = map.center
        print("reform fired")
        let cruncher = (1.05 - 0.06 * scrollView.zoomScale / 6)
        let zoomFactorLeft = 3.5 * (scrollView.zoomScale/1.5 + 0.75)
        let zoomFactorRight = 1.75 * (scrollView.zoomScale/1.5 + 0.75)
        var t = 0
        for i in skittle.asList()
        {
            if i != "---"
            {
                nodeArr[t].center = CGPoint(x: (RoomClass.coords[i]![0]/50 * mapCent.x/cruncher) + mapCent.x, y: (RoomClass.coords[i]![1]/50 * mapCent.y/cruncher) + mapCent.y - map.bounds.maxY/30)
                currNode = nodeArr[t]
                if i == skittle.first && currNode != node1
                {
                    print("First'd!")
                    node1.center.x -= zoomFactorLeft
                    currNode?.center.x += zoomFactorRight
                }
                if i == skittle.second && currNode != node2
                {
                    print("Second'!")
                    node2.center.x -= zoomFactorLeft
                    currNode?.center.x += zoomFactorRight
                }
                if i == skittle.third && currNode != node3
                {
                    print("Third'!")
                    node3.center.x -= zoomFactorLeft
                    currNode?.center.x += zoomFactorRight
                }
                if i == skittle.fourth && currNode != node4
                {
                    print("Four'd!")
                    node4.center.x -= zoomFactorLeft
                    currNode?.center.x += zoomFactorRight
                }
                if i == skittle.fifth && currNode != node5
                {
                    print("Fifth'd!")
                    node5.center.x -= zoomFactorLeft
                    currNode?.center.x += zoomFactorRight
                }
                if i == skittle.sixth && currNode != node6
                {
                    print("Sixth'd!")
                    node6.center.x -= zoomFactorLeft
                    currNode?.center.x += zoomFactorRight
                }
                if i == skittle.seventh && currNode != node7
                {
                    print("Seventh'd!")
                    node7.center.x -= zoomFactorLeft
                    currNode?.center.x += zoomFactorRight
                }
                if i == skittle.eighth && currNode != node8
                {
                    print("Eighth'd!")
                    node8.center.x -= zoomFactorLeft
                    currNode?.center.x += zoomFactorRight
                }
                if i == skittle.ninth && currNode != node9
                {
                    print("Nineth'd!")
                    node9.center.x -= zoomFactorLeft
                    currNode?.center.x += zoomFactorRight
                }
            }
            t += 1
        }
    }
}
