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
        @IBOutlet weak var directNode: UIImageView!
    @IBOutlet weak var map: UIImageView!
    @IBOutlet weak var condenser: UIBarButtonItem!
    
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
    
    var x = false
    let flip = Bundle.main.path(forResource: "flip", ofType: "mp3")!
    let click = Bundle.main.path(forResource: "click", ofType: "mp3")!
    var audioPlayer: AVAudioPlayer?
    var skittle = ScheduleController.schedule
    var currNode: UIImageView?
    var condesable = false
    
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
    
    @IBAction func onSwitch(_ sender: Any) {
        condesable.toggle()
        reform()
        print(condesable)
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
        if(x == false)
        {
            x.toggle()
            navigationItem.title = "2nd Floor"
            map.image = UIImage(named: "Improved Second Floor")
        }
        else
        {
            x.toggle()
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
                if x == false
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
                if x == false
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
        let z = codify(find: ScheduleController.directive)
        if ScheduleController.directive != "---" && z.1 == x
        {
            directNode.isHidden = false
        }
        else
        {
            directNode.isHidden = true
        }
    }
    func reform()
    {
        let mapCent = map.center
        print("reform fired")
//        let cruncher = (0.12 - 0.06 * scrollView.zoomScale / 6) + 1
        let sklittle = skittle.asList()
        var zoomFactorLeft: Double
        var zoomFactorRight: Double
        if condesable
        {
            zoomFactorLeft = 3.5 * (scrollView.zoomScale/1.5 + 0.75)
            zoomFactorRight = 1.75 * (scrollView.zoomScale/1.5 + 0.75)
        }
        else
        {
            zoomFactorLeft = 16.625
            zoomFactorRight = 8.3125
        }
        var l = 0
        var t = 0
        for i in sklittle
        {
            if i != "---"
            {
                nodeArr[l].center = CGPoint(x: (RoomClass.coords[i]![0]/50 * mapCent.x) + mapCent.x, y: (RoomClass.coords[i]![1]/50 * mapCent.y) + mapCent.y - map.bounds.maxY/30)
                currNode = nodeArr[l]
                for _ in sklittle
                {
                    if i == sklittle[t] && currNode != nodeArr[t]
                    {
                        nodeArr[t].center.x -= zoomFactorLeft
                        currNode?.center.x += zoomFactorRight
                    }
                    t += 1
                }
            }
            t = 0
            l += 1
        }
        directNode.center = CGPoint(x: (RoomClass.coords[ScheduleController.directive]![0]/50 * mapCent.x) + mapCent.x, y: (RoomClass.coords[ScheduleController.directive]![1]/50 * mapCent.y) + mapCent.y - map.bounds.maxY/30)
    }
}
