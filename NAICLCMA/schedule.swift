import UIKit
import AVFoundation
//public struct Classes: Codable{
    //var room: String
//}

class schedule: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UICollectionViewDelegateFlowLayout
{
    
   
    
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var button: UIButton!
    
    
    var audioPlayer: AVAudioPlayer?
    var selectClass: String = "106"
    var selectPeriod: Int = 1
    var has: [String: Int] = [:]
    let images: [UIImage] = [UIImage(named: "Vector 1")!, UIImage(named: "Vector 2")!, UIImage(named: "Vector 3")!, UIImage(named: "Vector 4")!, UIImage(named: "Vector 5")!, UIImage(named: "Vector 6")!, UIImage(named: "Vector 7")!, UIImage(named: "Vector 8")!, UIImage(named: "Vector 9")!]
    let periods: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    let rooms: [String] = ["106", "108", "109", "120", "122", "123", "124", "127", "128", "129", "130", "131", "132", "133", "134", "150", "151", "152", "153", "154", "155", "156", "158", "159", "160", "162", "163", "164", "165", "166", "167", "168", "169", "171", "172", "173", "200", "201", "201A", "202", "203", "204", "205", "205A", "206", "207", "208", "209", "209A", "210", "211", "212", "213", "214", "215", "216", "217", "218", "220", "221", "222", "223", "224", "225", "226", "230", "231", "232", "234", "235", "250", "251", "252", "253", "254", "255", "256", "259", "260", "261", "263", "264", "265", "266", "267", "268", "269", "AUD", "Athletic Director", "Band Room", "CAFE", "Care Room", "Choir Room", "Dean's Office", "FH", "Front Office", "GYM", "Guidance Office", "Internional Studies Office", "Library", "Nurse's Office", "Principal/Vice Office", "SRO Office", "Social Worker", "Student Services", "Tiger Conference Room", "WR"]
    
    let ding = Bundle.main.path(forResource: "Ding-small-bell", ofType: "mp3")!
    let bells = Bundle.main.path(forResource: "bells", ofType: "wav")!
    let click = Bundle.main.path(forResource: "click", ofType: "mp3")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let x = CAGradientLayer()
        x.frame = self.view.bounds
        x.colors = [UIColor.orange.cgColor, UIColor.systemBrown.cgColor, UIColor.black.cgColor]
        self.view.layer.insertSublayer(x, at: 0)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.reloadAllComponents()
        
        button.layer.borderWidth = 1
        button.isHidden = true
        
        if let items = UserDefaults.standard.data(forKey: "rooms"){
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([String: Int].self, from: items){
                has = decoded
            }
        }
        
        if(has.count == 9){
            button.isHidden = false
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 340, height: 105)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CustomCell
        cell.configure(first: selectClass, picture: images[selectPeriod - 1], second: selectPeriod)
        cell.layer.borderWidth = 1
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return has.count
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Selected \(1)", message: "Are You Sure You Want To Purchase This Item?", preferredStyle: .alert)
        let no = UIAlertAction(title: "Negative", style: .default, handler: nil)
        let yes = UIAlertAction(title: "Affirmative", style: .default, handler: { [self] action in
                print("Worked")
            })
    
        alert.addAction(no)
        alert.addAction(yes)
        present(alert, animated: true, completion: nil)
        let grab = has.index(has.startIndex, offsetBy: 1)
        print(grab)
    }
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        if(has.count == 9){
            let alert = UIAlertController(title: "Unable to Add Room", message: "Schedule is already full", preferredStyle: .alert)
            let apologies = UIAlertAction(title: "My sincerest condolences", style: .default, handler: nil)
            alert.addAction(apologies)
            present(alert, animated: true, completion: nil)
        } else{
            let url = URL(fileURLWithPath: ding)
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            }catch{
                print("error!")
            }
            has[selectClass] = selectPeriod
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(has){
                UserDefaults.standard.set(encoded, forKey: "rooms")
            }
            collectionView.reloadData()
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
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(component == 0){
            return rooms.count
        } else{
            return periods.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(component == 0){
            return rooms[row]
        }else{
            return "\(periods[row])"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(component == 0){
            selectClass = rooms[row]
            print(selectClass)
        } else{
            selectPeriod = periods[row]
            print(selectPeriod)
        }
    }
    
    
}
