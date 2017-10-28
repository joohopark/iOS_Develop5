

import UIKit

class DetailSetting: UIViewController, UITextFieldDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var mainSc: UIScrollView!
    
    
    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var detailImageView: UIImageView!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var statusTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // UserDefaults에 있는 값을 forKey를 가지고 빼와서 사용한다.
        if let imgData = UserDefaults.standard.value(forKey: "profileImgData") as? Data {
            detailImageView.image = UIImage(data: imgData)
        }
        
        // 키보드가 올라오기 직전에 노티피케이션을 사용해서 컨트롤하려고 함.
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillShow, object: nil, queue: nil) { (noti) in
            //print(noti.userInfo)
            
            // noti.userInfo 를 프린트한후, 추측해서 키보드 위치를 내려주려고 함..
            // EndUserInforKey로 바꾸어 주어야 제대로 작동이 됨..!
            if let keyboardFrame = noti.userInfo?[UIKeyboardFrameEndUserInfoKey] as? CGRect {
                // 스크롤뷰를, 키보드가가 올라온 크기 만큼 스크롤을 올릴것임
                self.mainSc.contentOffset = CGPoint(x: 0, y: keyboardFrame.height)
        }
            
        }
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardDidHide, object: nil, queue: nil) { (noti) in
            
            if let keyboardFrame = noti.userInfo?[UIKeyboardFrameEndUserInfoKey] as? CGRect {
                // 스크롤뷰를, 키보드가가 올라온 크기 만큼 스크롤을 올릴것임
                self.mainSc.contentOffset = CGPoint(x: 0, y: keyboardFrame.height/keyboardFrame.height)
            
        }
    }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // textFieldShouldReturn 은 return 키를 누르게되면, 키보드가 내려가게 되는것인데, 그 명령어중 하나가,
        // resignFirstResponder 매소드가 첫번째로 이녀석이 받음.
        // 위의 녀석들을 사용하기 위해서는 델리게이트를 연결해주어서 사용해야 한다.
        textField.resignFirstResponder()
        
        return true
    }
    
    func setUI () {
        
    }
    
    
    @IBAction func changeBtnAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

   
    // imagepicker
    @IBAction func imagepickerAction(_ sender: UIButton) {
        
        let actionSheet = UIAlertController(title: "골라", message: "초이스", preferredStyle: .actionSheet)
        
        // 카메라가 달려있는지 없는지에 대해서 검사하고,
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction: UIAlertAction = UIAlertAction(title: "카메라", style: .default, handler: { (action) in
                let cameraController = UIImagePickerController()
                cameraController.delegate = self
                cameraController.sourceType = .camera
                self.present(cameraController, animated: true, completion: nil)
            })
            // 알럿에 액션 추가
            actionSheet.addAction(cameraAction)
        }
        
        let photoAction: UIAlertAction = UIAlertAction(title: "사진", style: .default, handler: { (action) in
            let cameraController = UIImagePickerController()
            cameraController.delegate = self
            cameraController.sourceType = .photoLibrary
            self.present(cameraController, animated: true, completion: nil)
        })
        actionSheet.addAction(photoAction)
        
        present(actionSheet, animated: true, completion: nil)
    }
    
    // imagePicker 를 사용하기 전에,
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print(info)
        
        if let img = info[UIImagePickerControllerOriginalImage] as? UIImage {
            //detailImageView.image = img
            picker.dismiss(animated: true, completion: nil)
            
        }
        
        // 현재 설정한 이미지를 저장하고 싶으면,
        if let url = info[UIImagePickerControllerImageURL] as? URL {
            
            if let data = try? Data(contentsOf: url) {
                
                print(data)
                detailImageView.image = UIImage(data: data)
                
                //유저 디폴트에 저장하고
                UserDefaults.standard.set(data, forKey: "profileImgData")
                // image 를 userDefault로 저장해서 사용하는 방식을 채택함.. 오..
                
            }
            
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    
}
