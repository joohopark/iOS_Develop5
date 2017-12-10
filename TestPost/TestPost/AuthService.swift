//
//  AuthService.swift
//  ExplogFB
//
//  Created by 황재욱 on 2017. 11. 29..
//  Copyright © 2017년 becomingmacker. All rights reserved.
//

import Foundation
import Alamofire

// MARK: 인증 서비스 관리
struct AuthService : NetworkInfo {
    typealias Completion = (Bool) -> ()
    static func login(email: String, password: String, completion: Completion?){
        let serviceType = ServiceType.login
        let parameters : Parameters = [
            "email" : email,
            "password" : password
        ]
        Alamofire.request(serviceType.routing, method: .post, parameters: parameters).responseJSON { (data) in
            print(data)
            guard let completion = completion else { return }
            completion(data.result.isSuccess)
        }
    }
    static func signup(email: String, password: String, username: String, imgprofile: URL?, completion: Completion?){
        let serviceType = ServiceType.signup
        var parameters : Parameters = [
            "password" : password,
            "img_profile" : imgprofile,
            "email" : email,
            "username" : username
            //"img_profile" : imgprofile
        ]
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            if imgprofile?.path == nil {
                // 이미지를 선택하지 않은경우.
                multipartFormData.append(String("").data(using: .utf8)!, withName: "img_profile")
                parameters = [
                    "password" : password,
                    "email" : email,
                    "username" : username]
            }else {
                if let imagePath = imgprofile?.path,
                    let image = UIImage(contentsOfFile: imagePath),
                    let multipartImage = UIImageJPEGRepresentation(image, 0.5) {
                    multipartFormData.append(multipartImage,
                                             withName: "img_profile",
                                             fileName: "file.png",
                                             mimeType: "image/png")
                }
            }
            for (key, value) in parameters {
                multipartFormData.append(String(describing: value).data(using: .utf8)!,
                                         withName: key)
            }
        }, to: serviceType.routing, method: .post
            ,encodingCompletion: {
                encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        var errorResponse = response.value as! [String:Any]
                        print("""
                            stastus is : \(String(describing: response.response?.statusCode))
                            requset is : \(String(describing: response.request))
                            response is : \(String(describing: response.response))
                            response Data is : \(String(describing: response.data))
                            reseponse result is : \(String(describing:response.result))
                            responser result value is : \(String(describing: String(describing: response.result.value).data(using: .utf8)))
                            
                            인코딩 결과 \(String(describing: response.value as? [String:Any]))
                            데이텨 변환 \(String(describing: response.data as? [String:Any]))
                            """)
                        //                        user 에러 \((response.value as! [String:Any])["username"] as? String)
                        //                        email 에러 \((response.value as! [String:Any])["email"] as? String ?? nil)
                        //                        password 에러 \((response.value as! [String:Any])["password"] as? String ?? nil)
                    }
                case .failure(let encodingError):
                    
                    print("encodingError is \(encodingError)")
                    //print(self.response)
                    
                }
        })
    }
    static func postPhotoCreat(imgprofile: URL?, completion: Completion?){
        let serviceType = ServiceType.postPhotoCreat
        let parameters : Parameters = ["photo" : imgprofile]
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            if imgprofile?.path == nil {
                multipartFormData.append(String("").data(using: .utf8)!, withName: "img_profile")
            }else {
                if let imagePath = imgprofile?.path,
                    let image = UIImage(contentsOfFile: imagePath),
                    let multipartImage = UIImageJPEGRepresentation(image, 0.5) {
                    multipartFormData.append(multipartImage,
                                             withName: "photo",
                                             fileName: "file.png",
                                             mimeType: "image/png")
                }
            }
//            for (key, value) in parameters {
//                multipartFormData.append(String(describing: value).data(using: .utf8)!,
//                                         withName: key)
//            }
        }, to: serviceType.routing, method: .post, headers: ["Authorization":"Token d03c530221f181229b611096490596166631d701"]
            ,encodingCompletion: {
                encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        print("""
                            stastus is : \(String(describing: response.response?.statusCode))
                            requset is : \(String(describing: response.request))
                            response is : \(String(describing: response.response))
                            response Data is : \(String(describing: response.data))
                            reseponse result is : \(response.result)
                            responser result value is : \(String(describing: response.result.value).data(using: .utf8))
                            """)
                        let testValue = String(describing: response.data).data(using: .utf8)
                        print(testValue)
                        
                        //                        (response.result.value as! [String:[String]])["email"]?[0] ?? nil)
                        
                        // email에 대한 값이 리스트로 담겨져서 들어옴
                        if let x = (response.result.value as? [String:Any]) {
                            let y = x["email"]
                            //print(y, )
                        }
                        //guard let x = (response.result.value as! [String:[String]])["email"]) else {return}
                        //asvjknasv@gmail.com asdfgh
                    }
                    
                case .failure(let encodingError):
                    
                    print("encodingError is \(encodingError)")
                    //print(self.response)
                    
                }
        })
    }
}
