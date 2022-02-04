import UIKit
import AVFoundation
public struct Classes: Codable{
    var room: String
}

class ScheduleController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource
{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var button: UIButton!
    
    var audioPlayer: AVAudioPlayer?
    var selected: String = "106"
    var selectClass: Int = 1
    var has: [String] = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    var periods: [Int] = [1, 2, 3, 4, 5, 6 ,7 ,8 ,9]
    var rooms: [String] = ["106", "108", "109", "120", "122", "123", "124", "127", "128", "129", "130", "131", "132", "133", "134", "150", "151", "152", "153", "154", "155", "156", "158", "159", "160", "162", "163", "164", "165", "166", "167", "168", "169", "171", "172", "173", "200", "201", "201A", "202", "203", "204", "205", "205A", "206", "207", "208", "209", "209A", "210", "211", "212", "213", "214", "215", "216", "217", "218", "220", "221", "222", "223", "224", "225", "226", "230", "231", "232", "234", "235", "250", "251", "252", "253", "254", "255", "256", "259", "260", "261", "263", "264", "265", "266", "267", "268", "269", "AUD", "Athletic Director", "Band Room", "CAFE", "Care Room", "Choir Room", "Dean's Office", "FH", "Front Office", "GYM", "Guidance Office", "Internional Studies Office", "Library", "Nurse's Office", "Principal/Vice Office", "SRO Office", "Social Worker", "Student Services", "Tiger Conference Room", "WR"]
    var count = 0
    
    let ding = Bundle.main.path(forResource: "Ding-small-bell", ofType: "mp3")!
    let bells = Bundle.main.path(forResource: "bells", ofType: "wav")!
    let click = Bundle.main.path(forResource: "click", ofType: "mp3")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let x = CAGradientLayer()
        x.frame = self.view.bounds
        x.colors = [UIColor.orange.cgColor, UIColor.systemBrown.cgColor, UIColor.black.cgColor]
        self.view.layer.insertSublayer(x, at: 0)
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.reloadAllComponents()
        
        button.layer.borderWidth = 1
        button.isHidden = true
        
        if let items = UserDefaults.standard.data(forKey: "rooms3"){
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([String].self, from: items){
                has = decoded
            }
        }
        
    }
    
    @IBAction func button(_ sender: UIButton) {
        let url = URL(fileURLWithPath: click)
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        }catch{
            print("error!")
        }
    }
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        let url = URL(fileURLWithPath: ding)
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            }catch{
                print("error!")
            }
            has[selectClass - 1] = selected
            count += 1
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(has){
                UserDefaults.standard.set(encoded, forKey: "rooms3")
            }
            tableView.reloadData()
            if(has.count == 9){
                let url = URL(fileURLWithPath: bells)
                do{
                    audioPlayer = try AVAudioPlayer(contentsOf: url)
                    audioPlayer?.play()
                }catch{
                    print("error!")
                }
                button.isHidden = false
            }
            
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0
        {
            return rooms.count
        }
        else
        {
            return 9
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0
        {
            return rooms[row]
        }
        else
        {
            return "\(row + 1)"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0
        {
            selected = rooms[row]
        }
        else
        {
            selectClass = periods[row]
        }
        print(selected)
    }
    
//    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
//        if component == 0
//        {
//            return 200
//        }
//        else
//        {
//            return 40
//        }
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return has.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.layer.borderWidth = 1
        cell.textLabel?.text = "Room \(has[indexPath.row])"
        cell.detailTextLabel?.text = "Period \(indexPath.row + 1)"
        return cell
}
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
//        if(editingStyle == .delete){
//            has.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//            self.count -= 1
//            if(has.count <= 9){
//                button.isHidden = true
//            }
//        }
//        tableView.reloadData()
//    }
    
}
