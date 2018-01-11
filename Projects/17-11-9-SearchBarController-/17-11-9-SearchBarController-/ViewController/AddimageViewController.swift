
import UIKit

class AddimageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var titleLB: UILabel?
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // 이미지 피커 에서 사진 선택시
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("imagePick")
        
        if let img = info[UIImagePickerControllerOriginalImage] as? UIImage {
            //detailImageView.image = img
            picker.dismiss(animated: true, completion: nil)
            
        }
        // 현재 설정한 이미지를 저장하고 싶으면,
        if let url = info[UIImagePickerControllerImageURL] as? URL {
            if let data = try? Data(contentsOf: url) {
                imageView.image = UIImage(data: data)

                //유저 디폴트에 저장하고
                UserDefaults.standard.set(data, forKey: "profileImgData")
            }
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    // 사진 취소시 불리는 메소드
    func imagePickerControllerDidCancel(_ picker:
        UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        
        print("pick image")
    }
    
    @IBAction func addImageBtnAction(_ sender: UIButton) {
        let cameraController = UIImagePickerController()
        cameraController.delegate = self
        cameraController.sourceType = .photoLibrary
        present(cameraController, animated: true, completion: nil)
    }
    
    
    
    @IBAction func StoreBtnAction(_ sender: UIButton) {
        if let imgData = UserDefaults.standard.value(forKey: "profileImgData") as? Data {
        }
    }


}
