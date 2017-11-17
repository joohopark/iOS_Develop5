
import Foundation

var baseURL: String = "http://api-ios-dev.ap-northeast-2.elasticbeanstalk.com/api"
var uriSignup: String = "/member/signup/"
var postURL = "/post/"


class NetworkManager {
  
  static var shared: NetworkManager = NetworkManager()
  
  // typealias 지정 하고, 리퀘스트 할거임.
  typealias Completion = (_ isSuccess: Bool,_ returnValue: Any?,_ error:Error?) -> Void
  
  var session = URLSession.shared
  var token: String?
  
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
      
      print(data,response,error)
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

  
  func requestGetPosts(completion: @escaping Completion) {
    
    //
    guard let token = self.token else {return}
    let url = URL(string: baseURL+postURL)
    var requeset = URLRequest(url: url!)
    requeset.httpMethod = "GET"
    
    requeset.addValue("Token \(token)", forHTTPHeaderField: "Authorization")
    
    session.dataTask(with: requeset) { (data, response, error) in
      // 데이터가 제대로 왔는지 부터 확인해보자
      
      print(data,response,error)
      completion(true, data, error)
      completion(true, response, error)
      
      print(data, response, error)
      if let error = error {
        completion(false, nil, error)
      }
      
      if let data = data {
        completion(true, data, nil)
      }
      
      if let response = response {
        completion(true, response, nil)
      }
      
      
      
    }.resume()
  }
  
  
  
  
  
  
  
  
  
  
}
