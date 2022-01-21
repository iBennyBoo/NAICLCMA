import UIKit

class ScheduleController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource
{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var selected: String!
    var has: [String] = []
    var rooms: [String] = ["106", "108", "109", "120", "122", "123", "124", "127", "128", "129", "130", "131", "132", "133", "134", "150", "151", "152", "153", "154", "155", "156", "158", "159", "160", "162", "163", "164", "165", "166", "167", "168", "169", "171", "172", "173", "200", "201", "201A", "202", "203", "204", "205", "205A", "206", "207", "208", "209", "209A", "210", "211", "212", "213", "214", "215", "216", "217", "218", "220", "221", "222", "223", "224", "225", "226", "230", "231", "232", "234", "235", "250", "251", "252", "253", "254", "255", "256", "259", "260", "261", "263", "264", "265", "266", "267", "268", "269", "AUD", "Athletic Director", "Band Room", "CAFE", "Care Room", "Choir Room", "Dean's Office", "FH", "Front Office", "GYM", "Guidance Office", "Internional Studies Office", "Library", "Nurse's Office", "Principal/Vice Office", "SRO Office", "Social Worker", "Student Services", "Tiger Conference Room", "WR"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let x = CAGradientLayer()
        x.frame = self.view.bounds
        x.colors = [UIColor.systemOrange.cgColor, UIColor.cyan.cgColor, UIColor.red.cgColor]
        self.view.layer.insertSublayer(x, at: 0)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.reloadAllComponents()
        
    }
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        if(has.count == 9){
            let alert = UIAlertController(title: "Unable to Add Room", message: "Schedule is already full", preferredStyle: .alert)
            let apologies = UIAlertAction(title: "My sincerest condolences", style: .default, handler: nil)
            alert.addAction(apologies)
            present(alert, animated: true, completion: nil)
        } else{
            has.append(selected)
            tableView.reloadData()
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return rooms.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return rooms[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selected = rooms[row]
        print(selected)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return has.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = "Room \(has[indexPath.row])"
        cell.detailTextLabel?.text = "Period \(indexPath.row + 1)"
        return cell
}
    
}
