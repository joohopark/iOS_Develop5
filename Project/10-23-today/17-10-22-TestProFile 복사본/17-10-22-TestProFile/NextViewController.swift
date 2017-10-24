

import UIKit

class NextViewController: UIViewController {

    
    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var detailProfileImageView: UIImageView!
    @IBOutlet weak var detaliName: UILabel!
    @IBOutlet weak var detaileTextView: UITextView!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var email: UILabel!
    
    // 디테이블 뷰에서는 cell에서 누른 값만 필요하기 때문에 ProfileModel 을 사용함..
    var data: ProfileModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailProfileImageView.clipsToBounds = true
        detailProfileImageView.layer.cornerRadius = 50
        
        if let real = data {
            //data에 값이 넘어온다는것.
            titleImageView.image = UIImage(named: (data?.bgImageName)!)
            detaliName.text = data?.nickname
            detaileTextView.text = data?.myprofileDesc
            phoneNumber.text = data?.phoneNumber
            email.text = data?.email
            
            detailProfileImageView.image = UIImage(named: (data?.profileImageName)!)
        }
            
            
            

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
