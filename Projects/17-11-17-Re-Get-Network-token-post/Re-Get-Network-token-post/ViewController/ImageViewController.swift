

import UIKit

class ImageViewController: UIViewController {
  
  @IBOutlet weak var titleTextField: UITextField!
  @IBOutlet weak var selectImage: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.selectImage.layer.borderColor = UIColor.black.cgColor
    self.selectImage.layer.borderWidth = 5
    self.selectImage.layer.cornerRadius = 100
  }
  @IBAction func storeBtnAction(_ sender: UIButton) {
    let img: UIImage! = UIImage(named: "test.jpg")
    let x = PostModel(title: "김옥지...", content: "흐앙", imgCoverUrl: "앙")
    
    NetworkFileManager.shread.requestPost(post: x, img: img) { (ok, data, error) in
      print(ok, data, error)
    }
    

    
    self.navigationController?.popViewController(animated: true)
  }
  @IBAction func choiceImageBtnAction(_ sender: UIButton) {
    let imagePickerVC = UIImagePickerController()
    imagePickerVC.delegate = self
    imagePickerVC.sourceType = .photoLibrary
    present(imagePickerVC, animated: true, completion: nil)
    
  }
  @IBAction func checkServerDataBtnAction(_ sender: UIButton) {
    NetworkFileManager.shread.requestGetPosts { (ok, resultData, error) in
      print(ok, resultData,error)
    }
  }
}

extension ImageViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    
    if let url = info[UIImagePickerControllerImageURL] as? URL {
      if let data = try? Data(contentsOf: url) {
        self.selectImage.image = UIImage(data: data)
        UserDefaults.standard.set(data, forKey: "ImgData")
      }
    }
    picker.dismiss(animated: true, completion: nil)
  }
  
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
}
