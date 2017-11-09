
import UIKit

class CustomCellTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLB: UILabel!
    @IBOutlet weak var tailImageView: UIImageView!
    @IBOutlet weak var backGroundImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
