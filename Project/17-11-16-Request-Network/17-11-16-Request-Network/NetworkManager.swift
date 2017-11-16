
import Foundation

var baseURL: String = "http://api-ios-dev.ap-northeast-2.elasticbeanstalk.com/api"
var uriSignup: String = "/member/signup/"


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
  
  
  
  // 이거 왜에러인지 한번 찾아보자
  //    func requestSignup(userid: String, pw: String, completion:@escaping Completion) {
  //        let url = URL(string: baseURL+uriSignup)
  //        var request = URLRequest(url: url!)
  //        request.httpMethod = "POST"
  //
  //        // key=value&ket=value 타입으로 지정이 되어있음.
  //        // 서버에서 받을수 있는 파라미터도 고려해서 보내주어야함. 그렇지않으면 서버에서 받아주지 않는 경우가 있음.
  //        let dataStr =  "username=\(userid)&password1=\(pw)&password2=\(pw)"
  //
  //        // 데이터 포맷을 utf8로 바꾸어 주어서 보내주어야함..?
  //        request.httpBody = dataStr.data(using: .utf8)
  //
  //        session.dataTask(with: request) { (data, response, error) in
  //            let code = (response as! HTTPURLResponse).statusCode
  //
  //            if code == 201 {
  //                // 토큰 key값을 저장해야하는데, 네트워크 closure 안에서 바로 저장해버리면,
  //                //                // 속도가 느려질수 있음. 데이터가 변수로 가지고 있다가, 백그라운드로 갈때함..
  //                //                // 토근값을 넣어주기 위해서.
  //                let returnDic = try JSONSerialization.jsonObject(with: dataStr, options: []) as! [String:String]
  //                self.token = returnDic["key"]!
  //                completion(true,nil,nil)
  //
  //            }
  //
  //        }
  //
  ////        session.dataTask(with: request) {[unowned self] (data, response, error) in
  ////
  ////
  ////            // 성공한 경우,
  ////            if code == 201 {
  ////                // 토큰 key값을 저장해야하는데, 네트워크 closure 안에서 바로 저장해버리면,
  ////                // 속도가 느려질수 있음. 데이터가 변수로 가지고 있다가, 백그라운드로 갈때함..
  ////                // 토근값을 넣어주기 위해서.
  ////                let returnDic = try JSONSerialization.jsonObject(with: dataStr, options: []) as! [String:String]
  ////                self.token = returnDic["key"]!
  //////                    completion(true,nil,nil)
  ////
  ////
  ////                } catch let error {
  ////                    print("error")
  ////                }
  ////
  ////
  ////
  ////
  ////
  ////
  ////
  ////
  ////            }else {
  ////
  ////                completion(false,nil,nil)
  ////            }
  ////        }.resume()
  ////
  //    }
  
  
  
  
  
  
  
  
  
  
  
}
