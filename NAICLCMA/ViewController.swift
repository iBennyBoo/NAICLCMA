import UIKit
import AVFoundation
class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    

    
    //pls work pls
    
    @IBOutlet weak var videoLayer: UIView!
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var scheduleButton: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var directSearch: UIButton!
    @IBOutlet weak var white: UIImageView!
    
    var rooms: [String] = ["106", "108", "109", "120", "122", "123", "124", "127", "128", "129", "130", "131", "132", "133", "134", "150", "151", "152", "153", "154", "155", "156", "158", "159", "160", "162", "163", "164", "165", "166", "167", "168", "169", "171", "172", "173", "200", "201", "201A", "202", "203", "204", "205", "205A", "206", "207", "208", "209", "209A", "210", "211", "212", "213", "214", "215", "216", "217", "218", "220", "221", "222", "223", "224", "225", "226", "230 // Band Room", "231", "232", "234 // Choir Room", "235", "250", "251", "252", "253", "254", "255", "256", "259", "260 // Computer Room", "261", "263", "264", "265", "266", "267", "268", "269 // Library", "Auditorium", "Athletic Director", "CAFE", "Dean's Office", "FH", "Front Office", "AUX GYM", "Nurse", "Principal", "SRO", "Social Worker", "Student Services", "Tiger Conference Room", "WR"]
    
    let screenWidth = UIScreen.main.bounds.width - 10
    let screenHeight = UIScreen.main.bounds.height / 2
    var selectRow = 0
    var selected = ""
    static var directive = "---"
    var audioPlayer: AVAudioPlayer?
    let click = Bundle.main.path(forResource: "click", ofType: "mp3")!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        mapButton.layer.cornerRadius = 26
        scheduleButton.layer.cornerRadius = 26
        directSearch.layer.cornerRadius = 26
        mapButton.layer.borderWidth = 1
        scheduleButton.layer.borderWidth = 1
        directSearch.layer.borderWidth = 1
        if let items = UserDefaults.standard.data(forKey: "rooms6"){
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([String].self, from: items){
                ScheduleController.schedule = InfoClass(StringArray: decoded)
            }
        }

        label.attributedText = NSMutableAttributedString(string: "Student Map App",
        attributes: stroke(font: UIFont(name: "American Typewriter", size: 40)!,
        strokeWidth: 4.5, insideColor: .white, strokeColor: UIColor.black))
    }
    
    @IBAction func directSearch(_ sender: UIButton) {
        
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width: screenWidth, height: screenHeight)
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.selectRow(selectRow, inComponent: 0, animated: false)
        
        vc.view.addSubview(pickerView)
        pickerView.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor).isActive = true
        pickerView.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor).isActive = true
        
        let alert = UIAlertController(title: "Select the Room you Want to Search For", message: "", preferredStyle: .actionSheet)
        
        
        alert.popoverPresentationController?.sourceView = directSearch
        alert.popoverPresentationController?.sourceRect = directSearch.bounds
        alert.setValue(vc, forKey: "contentViewController")
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (UIAlertAction) in
        }))
        alert.addAction(UIAlertAction(title: "Select", style: .default, handler: {
            (UIAlertAction) in
            
            self.selectRow = pickerView.selectedRow(inComponent: 0)
            let selected = Array(self.rooms)[self.selectRow]
            
            
            ViewController.directive = selected
            self.performSegue(withIdentifier: "Identifier", sender: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return rooms.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat{
        return 60
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        label.text = rooms[row]
        label.sizeToFit()
        return label
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
        print("Working...")
        let url = URL(fileURLWithPath: click)
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        }catch{
            print("error!")
        }
    }
    
    @IBAction func scheduleButton(_ sender: UIButton) {
        print("Working...")
        let url = URL(fileURLWithPath: click)
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        }catch{
            print("error!")
        }
    }
    
    
    
}
