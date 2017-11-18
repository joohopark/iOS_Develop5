

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
    let x = PostModel(title: "앙 기모띠", content: "앙앙", imgCoverUrl: "앙")
    let image = UserDefaults.standard.value(forKey: "ImgData") as? Data
    NetworkManager.shared.requestPost(post: x, img: UIImage(data: image!)!, completion: { (ok, data, error) in
      
      print(ok, data, error)
    })
  }
  
  
  @IBAction func checkBtn(_ sender: UIButton) {
    NetworkManager.shared.requestGetPosts { (ok, data, error) in
      print(ok, data, error)
    }
  }
}

extension UIImageTableView: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    if let url = info[UIImagePickerControllerImageURL] as? URL {
      
      if let data = try? Data(contentsOf: url) {
        imageView.image = UIImage(data: data)
        NetworkManager.shared.imageList?.append(data)
        UserDefaults.standard.set(data, forKey: "ImgData")
      }
    }
    picker.dismiss(animated: true, completion: nil)
  }
  
  //취소했을때 불리는 델리게이트 메소드
  func imagePickerControllerDidCancel(_ picker:UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
}
