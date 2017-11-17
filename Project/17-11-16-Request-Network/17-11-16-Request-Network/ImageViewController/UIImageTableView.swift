

import UIKit

class UIImageTableView: UIViewController {
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var textTF: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  @IBAction func imagePopBtn(_ sender: UIButton) {
    
    // imagqPickerController 생성
    let cameraController = UIImagePickerController()
    cameraController.delegate = self
    cameraController.sourceType = .photoLibrary
    present(cameraController, animated: true, completion: nil)
    
  }
  
  @IBAction func imageStoreBtn(_ sender: UIButton) {
    
  }
}

extension UIImageTableView: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    print(info)
    print("이미지 선택시 불리는 메소드")
    if let img = info[UIImagePickerControllerOriginalImage] as? UIImage {
      print(img)
    }
    
    if let url = info[UIImagePickerControllerImageURL] as? URL {
      if let data = try? Data(contentsOf: url) {
        imageView.image = UIImage(data: data)
        //유저 디폴트에 저장하고 -> 저장한것을 서버에 보내고, 하는것을 확인해보자.
        UserDefaults.standard.set(data, forKey: "ImgData")
        // image 를 userDefault로 저장해서 사용하는 방식을 채택함.. 오..
        
      }
      
    }
    
    picker.dismiss(animated: true, completion: nil)
  }
  
  //취소했을때 불리는 델리게이트 메소드
  func imagePickerControllerDidCancel(_ picker:UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
}
