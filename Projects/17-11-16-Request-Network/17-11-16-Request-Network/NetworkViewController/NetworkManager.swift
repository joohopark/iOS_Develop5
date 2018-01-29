
import Foundation
import UIKit

var baseURL: String = "http://api-ios-dev.ap-northeast-2.elasticbeanstalk.com/api"
var uriSignup: String = "/member/signup/"
var postURL = "/post/"


class NetworkManager {
  
  static var shared: NetworkManager = NetworkManager()
  
  // typealias 지정 하고, 리퀘스트 할거임.
  typealias Completion = (_ isSuccess: Bool,_ returnValue: Any?,_ error:Error?) -> Void
  
  var session = URLSession.shared
  var token: String?
  var imageList: [Data]? = []
  
  private init() {
    loadToKen()
  }
  
  
  func requestSignup(userid:String, pw:String, completion:@escaping Completion)
  {
    //url 생성
    let url = URL(string: baseURL + uriSignup)
    var request = URLRequest(url: url!)
    
    //POST로 보내준다. POST로 보낼시, Body를 넣어야 한다.
    request.httpMethod = "POST"
    
    //JSON 양식 -> 송출시 파라미터 값이 없다고 나올 확률이 큼
    //"{username:\(userid)&password1:\(pw)&password2:(pw)}"
    //네트워크 보낼때 기본적으로 "=" 을 사용하여, 키값과 밸류 값을 구분함.
    
    //body의 형태는, Data이므로 옵션을 만들어서 꾸며줘야 한다.
    let dataStr = "username=\(userid)&password1=\(pw)&password2=\(pw)"
    
    request.httpBody = dataStr.data(using: .utf8)
    
    session.dataTask(with: request) {[unowned self] (data, response, error) in
      
      
      //statusCode를 호출하여, 그 값이 참인지 거짓인지를 확인한다.
      let code = (response as! HTTPURLResponse).statusCode
      
      
      if code == 201
      {
        //제대로 들어올 경우
        // 키값을 가지고 오고, 키 값을 다른곳에 저장하여 준다.
        let resultDic = try! JSONSerialization.jsonObject(with: data!, options: []) as! [String:String]
        self.token = resultDic["key"]!
        print(self.token)
        UserDefaults.standard.setValue(self.token, forKey: "TokenKey")
        completion(true, nil, nil)
        
      }else
      {
        
        
        completion(false, nil, nil)
      }
      }.resume()
  }
  
  
  func saveToken() {
    if let token = token {
      UserDefaults.standard.setValue(token, forKey: "TokenKey")
    }
  }
  
  func loadToKen() {
    if let token = UserDefaults.standard.value(forKey: "TokenKey") as? String {
      self.token = token
      print(self.token)
    }
  }

  
  // image를 넣기 위해서 서버 모델링 하는것.
  func requestGetPosts(completion: @escaping Completion) {
    
    // token 이 없으면, 실행이 안되니까, 옵셔널 바인딩을 해주자
    guard let token = self.token else {return}
    let url = URL(string: baseURL+postURL)
    var request = URLRequest(url: url!)
    request.httpMethod = "GET"
    
    request.addValue("Token \(token)", forHTTPHeaderField: "Authorization")
    
    session.dataTask(with: request) {[unowned self] (data, response, error) in
      // 데이터가 제대로 왔는지 부터 확인해보자
//      if let error = error {
//        completion(false, nil, error)
//      }
      
      let code = (response as! HTTPURLResponse).statusCode
      if code == 200
      {
        //제대로 들어올 경우
        // 키값을 가지고 오고, 키 값을 다른곳에 저장하여 준다.
        let  resultArr = try! JSONSerialization.jsonObject(with: data!, options: []) as! [[String:Any]]
        
        let decoder = JSONDecoder()
        let model = try! decoder.decode([PostModel].self, from: data!)
        
//        print("디코더 테스트! : ", model)
        completion(true, model, nil)
        
//        for item in resultArr {
//          let titleValue = item["title"]
//          let imagCoverValue = item["img_cover"]
//          let contentValue = item["content"]
//
//          let dataTuple = (title: titleValue,
//                           imgCover: imagCoverValue,
//                           content: contentValue)
//
//          completion(true, dataTuple, nil)
//        }
//        completion(true, resultArr, nil)
      }
    }.resume()
  }
  
  func requestPost(post: PostModel, img: UIImage, completion: @escaping Completion) {
    let tokenValue = UserDefaults.standard.value(forKey: "TokenKey") as? String
    guard let token = tokenValue else {return}
    
    let url = URL(string: baseURL+postURL)
    var request = URLRequest(url: url!)
    request.httpMethod = "POST"
    
    request.addValue("Token \(token)", forHTTPHeaderField: "Authorization")
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
      
      print(try! JSONSerialization.jsonObject(with: data!, options: []) as! [String:Any])
      
      
      
      
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
  
}

struct PostModel:Codable {
  
  var title:String
  var content:String
  var imgCoverUrl:String?
  
  var param:[String:String]
  {
    return ["title":title,"content":content]
  }
  
  //Json 데이터와 키값을 맞추기 위하여, 진행하는 것!
  enum Codingkeys : String, CodingKey {
    case title = "title"
    case content = "content"
    case imgCoverUrl = "img_cover"
  }
  
  // decoder, encoder, 할때, 필요한 부분만 가져가려고 할때, init de/encoer 부분을 나누어서 en/decoder 가 필요할때, init 을 넣어서 사용함..
//  init(from decoder: Decoder) throws {
//    let container = try decoder.container(keyedBy: Codingkeys.self)
//    title = try container.decode(String.self, forKey: .title)
//    content = try container.decode(String.self, forKey: .content)
//    imgCoverUrl = try container.decode(String.self, forKey: .imgCoverUrl)
//  }
//
//  //
//  //    //encoding
//  func encode(to encoder: Encoder) throws
//  {
//    var container = encoder.container(keyedBy: Codingkeys.self)
//    try container.encode(title, forKey: .title)
//    try container.encode(content, forKey: .content)
//  }

  
  
}


//struct PostModel: Codable {
//
//  var titleValue: String
//  var imagCoverValue: String?
//  var contentValue: String
//
//  init?(title: String, imageCover: String, content: String) {
//
//    self.titleValue = titleValue
//    self.imagCoverValue = imageCover
//    self.contentValue = contentValue
//
//    }
//
//
//  }


// extention 부분
extension Data {
  mutating func appendString(_ string: String) {
    let data = string.data(using: String.Encoding.utf8, allowLossyConversion: false)
    append(data!)
  }
}
