//
//  ViewController.swift
//  TestPost
//
//  Created by MIN JUN JU on 2017. 12. 10..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit
import Alamofire

let token: String = "Token d03c530221f181229b611096490596166631d701"
let titleParam: String = "타이틀 임의로"
let timeParam: String = "2017-12-05T17:37:34"


// header 형식 Authorization Token d03c530221f181229b611096490596166631d701
class MainViewController: UIViewController{
    
    
    @IBOutlet weak var imagePickerButton: UIButton!
    
    var imageurl: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func postCreatAction(_ sender: UIButton) {
        let parameters: Parameters = ["title": titleParam,
                                      "start_date": timeParam]
        
        let Auth_header = ["Authorization":token]
        let url = ServiceType.postCreat.routing
        Alamofire.request(url,
                          method: .post,
                          parameters: parameters,
                          headers: Auth_header).responseJSON { (response) in
                            
                            print("""
                                statusCode is \(String(describing: response.response?.statusCode))
                                HTTPBody is \(String(describing: NSString(data: (response.request?.httpBody)!, encoding: String.Encoding.utf8.rawValue)))
                                response value is \(String(describing: response.result.value as? [String:Any] ?? nil))
                                """)
                            if response.response?.statusCode == 201 {
                                
                                let resultValue = response.result.value as? [String:Any]
                                print("""
                                    title is \(String(describing: (response.result.value as! [String:Any])["title"]))
                                    pk is \(String(describing: (response.result.value as! [String:Any])["pk"]))
                                    start_date is \(String(describing: (response.result.value as! [String:Any])["start_date"]))
                                    end_date is \(String(describing: (response.result.value as! [String:Any])["end_date"]))
                                    created_at is \(String(describing: (response.result.value as! [String:Any])["created_at"]))
                                    """)
                                for item in resultValue! {
                                    print("item is \(item)")
                                }
                            }
        }
    }
    
    @IBAction func postListAction(_ sender: UIButton) {
        let url = ServiceType.postList.routing
        Alamofire.request(url, method: .get).responseJSON { (response) in
            print(response.response?.statusCode)
            print(response)
            print(response.result)
        }
    }
    
    @IBAction func postDetailAction(_ sender: UIButton) {
        let url = ServiceType.postDetail.routing
        
        Alamofire.request(url, method: .get).responseJSON { (response) in
            
            print(response.response?.statusCode)
            print(response.result.value as! [String:Any])
            print((response.result.value as! [String:Any]).keys)
//            print(response.result)
            
            let statusCode = response.response?.statusCode
            
            if statusCode == 200 {
                let x = response.result.value as! [String:Any]
                // 아래와 같은 방법으로 하나하나씩 뜯어서 사용할수 있음.
                print((x["matter9"] as! [String:Any])["content"] as! String)
                for item in x {
                    print(item as! String)
                }
            }
        }
    }
    
    @IBAction func postTextCreatAction(_ sender: UIButton) {
        let parameters: Parameters = ["title": "글 제목 작성..!",
                                      "content": "글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용...글내용..."]
        
        let Auth_header = ["Authorization":token]
        let url = ServiceType.postTextCreat.routing
        Alamofire.request(url,
                          method: .post,
                          parameters: parameters,
                          headers: Auth_header).responseJSON { (response) in
                            print(response.response?.statusCode)
                            print(response.result.value as? [String:Any])
        }
        
    }
    
    @IBAction func postTextAction(_ sender: UIButton) {
        let Auth_header = ["Authorization":token]
        let url = ServiceType.postText.routing
        Alamofire.request(url,
                          method: .get,
                          headers: Auth_header).responseJSON { (response) in
                            print(response.response?.statusCode)
                            print(response.result.value as? [String:Any])
        }
    }
    
    @IBAction func postReplyAction(_ sender: UIButton) {
        let Auth_header = ["Authorization":token]
        let url = ServiceType.postreply.routing
        Alamofire.request(url,
                          method: .get,
                          headers: Auth_header).responseJSON { (response) in
                            print(response.response?.statusCode)
                            print(response.result.value as? [String:Any])
        }
    }
    @IBAction func postPhotoCreat(_ sender: UIButton) {
        
        
        let url: URL? = self.imageurl ?? nil
        AuthService.postPhotoCreat(imgprofile: url) { (result) in
            print(result)
        }
    }
    @IBAction func imagePickerButtonAction(_ sender: UIButton) {
        let profileImagePickerController = UIImagePickerController()
        profileImagePickerController.delegate = self
        profileImagePickerController.sourceType = .photoLibrary
        present(profileImagePickerController, animated: true, completion: nil)
    }
}


extension MainViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController,didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let imageURL = info[UIImagePickerControllerReferenceURL] as? NSURL {
            let image = info[UIImagePickerControllerOriginalImage] as! UIImage
            let imageUrl = info[UIImagePickerControllerReferenceURL] as? NSURL
            let imageName = imageUrl?.lastPathComponent
            let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                                        .userDomainMask,
                                                                        true).first!
            let photoURL = NSURL(fileURLWithPath: documentDirectory)
            // localPath 의 URL -> multipartForm 으로 던져줄때, 해당 URL 을 던져주어서, 회원가입 시도
            let localPath = photoURL.appendingPathComponent(imageName!)
            
            if FileManager.default.fileExists(atPath: localPath!.path) {
                do {
                    // 이미지를 local Path 에 저장 -> 생성
                    try UIImageJPEGRepresentation(image, 1.0)?.write(to: localPath!)
                    print("file saved")
                    self.imagePickerButton.setImage(image, for: .normal)
                    self.imageurl = localPath
                }catch {
                    print("error saving file")
                }
            }
            else {
                print("file already exists")
                do {
                    // 이미지를 local Path 에 저장 -> 생성
                    try UIImageJPEGRepresentation(image, 1.0)?.write(to: localPath!)
                    print("file saved")
                    self.imagePickerButton.setImage(image, for: .normal)
                    self.imageurl = localPath
                }catch {
                    print("error saving file")
                }
                
            }
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    //취소했을때 불리는 델리게이트 메소드
    func imagePickerControllerDidCancel(_ picker:UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}

