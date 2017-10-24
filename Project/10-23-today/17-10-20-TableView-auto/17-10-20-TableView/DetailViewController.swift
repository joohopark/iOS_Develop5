

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLB: UITextView!
    @IBOutlet weak var phoneLabel: UILabel!
    
    var data: ProfileModel?
    
    
    @IBOutlet weak var emailLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        profileImageView.layer.borderWidth = 2
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = 50
        
        
        if let real = data {
            //data에 값이 넘어온다는것.
            titleImageView.image = UIImage(named: (data?.bgImageName)!)
            nameLabel.text = data?.nickname
            descriptionLB.text = data?.myprofileDesc
            phoneLabel.text = data?.phoneNumber
            emailLabel.text = data?.email
            
            profileImageView.image = UIImage(named: (data?.profileImageName)!)
            

            //self.profileImageView.layer.cornerRadius = 20
            
        }

        // Do any additional setup after loading the view.
    }



}
