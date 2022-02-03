import Foundation
import UIKit
public class CustomCell: UICollectionViewCell{
    
    @IBOutlet var imageOutlet: UIImageView!
    @IBOutlet var labelOutlet: UILabel!
    @IBOutlet var labelOutletTwo: UILabel!
    
    
    
    func configure(first: String, picture: UIImage, second: Int){
        imageOutlet.layer.borderWidth = 0.5
        labelOutlet.layer.borderWidth = 0.5
        labelOutletTwo.layer.borderWidth = 0.5
        
        labelOutlet?.text = "Room \(first)"
        imageOutlet?.image = picture
        labelOutletTwo?.text = "Period \(second)"
    }
}
