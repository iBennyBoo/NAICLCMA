import Foundation
import UIKit
public class CustomCell: UICollectionViewCell{
    
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var labelOutlet: UILabel!
    @IBOutlet weak var labelOutletTwo: UILabel!
    
    func configure(first: String, picture: UIImage, second: Int){
        imageOutlet.layer.borderWidth = 0.5
        labelOutlet.layer.borderWidth = 0.5
        labelOutletTwo.layer.borderWidth = 0.5
        
        labelOutlet?.text = "Room \(first)"
        imageOutlet?.image = picture
        labelOutletTwo?.text = "Period \(second)"
    }
}
