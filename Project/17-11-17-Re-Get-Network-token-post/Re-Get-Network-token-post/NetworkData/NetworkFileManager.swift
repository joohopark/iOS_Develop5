import Foundation
import UIKit

let baseUrl = "http://api-ios-dev.ap-northeast-2.elasticbeanstalk.com/api"
let urlSignup = "/member/signup/"
let urlLogin = "/member/login/"
let urlPost = "/post/"



// MARK: Network Data
public class NetworkFileManager {
  static var shread: NetworkFileManager = NetworkFileManager()
  typealias Completion = (_ isSuccess: Bool,_ returnValue: Any?,_ error:Error?) -> Void
  
  var session = URLSession.shared
  var token: String?
  var jsonData: [DataModel] = []
  
  init() {
    
  }
  
  // MARK: Requset Signup
  func requestSignup(userid: String, pw:String, completion: @escaping Completion)  {
    
    let url: URL! = URL(string:baseUrl+urlSignup)
    var request = URLRequest(url: url)
    
    request.httpMethod = "POST"
    let dataStr = "username=\(userid)&password1=\(pw)&password2=\(pw)"
    request.httpBody = dataStr.data(using: .utf8)
    
    session.dataTask(with: request) {[unowned self] (data, response, error) in
      completion(true, response, error)
      
      if let error = error {
        print("error 는 \(error)")
        completion(false, nil, error)
      }
      let code = (response as! HTTPURLResponse).statusCode
      
      
      // return Token
      if code == 201 {
        let resultDic = try! JSONSerialization.jsonObject(with: data!, options: []) as! [String:String]
        let token = resultDic["key"]
        self.token = token
        
        UserDefaults.standard.setValue(token, forKey: "MyToken")
        completion(true, data, nil)
      }
      }.resume()
    
  }
  

  // MARK: RequestGetPost
  func requestGetPosts(completion: @escaping Completion) {
    self.token = UserDefaults.standard.value(forKey: "MyToken") as! String
    let url = URL(string: baseUrl+urlPost)
    var request = URLRequest(url: url!)
    request.httpMethod = "GET"
    request.addValue("Token \(token!)", forHTTPHeaderField: "Authorization")
    session.dataTask(with: request) {[unowned self] (data, response, error) in
      if let error = error {
        completion(false, nil, error)
      }
      
      
      let code = (response as! HTTPURLResponse).statusCode
      if code == 200 {
        
        //제대로 들어올 경우
        // 키값을 가지고 오고, 키 값을 다른곳에 저장하여 준다.
        let  resultArr = try! JSONSerialization.jsonObject(with: data!, options: []) as! [[String:Any]]
        for item in resultArr {
          self.jsonData.append(DataModel(dumiData: item)!)
        }
        let resultData = self.jsonData
        completion(true, resultData, nil)
      }
      }.resume()
  }
  
  // MARK: Request Post
//  func requestPost(post: PostModel, img: UIImage, completion: @escaping Completion) {
//    let token = UserDefaults.value(forKey: "MyToken")
//    let url = URL(string: baseUrl+urlPost)
//    var request = URLRequest(url: url!)
//    request.httpMethod = "POST"
//
//    request.addValue("Token \(token)", forHTTPHeaderField: "Authorization")
//    let boundary = "Boundary-\(UUID().uuidString)"
//    request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
//
//
//    let fileName = String(Date().timeIntervalSince1970) + ".jpeg"
//
//    let body = creatBody(parameters: post.param,
//                         boundary: boundary,
//                         data: UIImageJPEGRepresentation(img, 0.5)!,
//                         dataType: "img_cover",
//                         mimeType: "image/jpeg",
//                         filename: fileName)
//
//
//    request.httpBody = body
//
//    session.dataTask(with: request) { (data, response, error) in
//      print(data,request,error)
//
//
//    }.resume()
//
//
//
//  }
  func requestPost(post: PostModel, img: UIImage, completion: @escaping Completion) {
    let tokenValue = UserDefaults.standard.value(forKey: "MyToken") as! String
//    guard let token = tokenValue else {return}
    
    let url = URL(string: baseUrl+urlPost)
    var request = URLRequest(url: url!)
    request.httpMethod = "POST"
    
    request.addValue("Token \(tokenValue)", forHTTPHeaderField: "Authorization")
    let boundary = "Boundary-\(UUID().uuidString)"
    request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
    
    
    let fileName = String(Date().timeIntervalSince1970) + ".jpeg"
    // multipart로 이미지 변환 후 전송.
    
    // ["title":post.title,"content":post.content] -> parameters 부분에 왼쪽 부분 처럼 작성해주어됨.
    let body = creatBody(parameters: post.param,
                         boundary: boundary,
                         data: UIImageJPEGRepresentation(img, 0.5)!,
                         dataType: "img_cover",
                         mimeType: "image/jpeg",
                         filename: fileName)
    
    
    request.httpBody = body
    
    
    session.dataTask(with: request) { (data, response, error) in
      
      print(data, response, error)
      
      completion(true, data, error)
      print(data, response)
      
//      print(try! JSONSerialization.jsonObject(with: data!, options: []) as! [String:Any])
      
      
      
      
      }.resume()
  }
  
  func creatBody(parameters: [String:String],
                 boundary: String,
                 data: Data,
                 dataType: String,
                 mimeType: String,
                 filename: String) -> Data {
    var body = Data()
    let boundaryPrefix = "--\(boundary)\r\n"
    
    for (key, value) in parameters {
      body.appendString(boundaryPrefix)
      body.appendString("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
      body.appendString("\(value)\r\n")
    }
    body.appendString(boundaryPrefix)
    
    body.appendString("Content-Disposition: form-data; name=\"\(dataType)\"; filename=\"\(filename)\"\r\n")
    
    body.appendString("Content-Type: \(mimeType)\r\n\r\n")
    body.append(data)
    body.appendString("\r\n")
    
    body.appendString("--\(boundary)--")
    return body
    
    
  }
  func loadToken() -> String{
    
    if let token = self.token {
      return token
    }
    return "토큰없음"
  }
}



struct PostModel:Codable {
  
  var title:String
  var content:String
  var imgCoverUrl:String?
  //    var img: NSArray
  
  var param:[String:String]
  {
    return ["title":title,"content":content]
  }
  
  //Json 데이터와 키값을 맞추기 위하여, 진행하는 것!
  enum Codingkeys : String, CodingKey {
    case title = "title"
    case content = "content"
    case imgCoverUrl = "img_cover"
    //      case img = "images"
  }
}

struct DataModel {
  var title:String
  var content:String
  var imgCoverUrl:String?
  
  var param:[String:String]
  {
    return ["title":title,"content":content]
  }
  
  init?(dumiData: [String:Any]) {
    guard let title = dumiData["title"]  else {return nil}
    guard let content = dumiData["content"] else {return nil}
    guard let imgCoverUrl = dumiData["img_cover"] as? String else {return nil}
    
    self.title = title as! String
    self.content = content as! String
    self.imgCoverUrl = imgCoverUrl
    
  }
}


extension Data {
  mutating func appendString(_ string: String) {
    let data = string.data(using: String.Encoding.utf8, allowLossyConversion: false)
    append(data!)
  }
}




















