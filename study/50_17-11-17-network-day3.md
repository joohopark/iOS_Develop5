# 50_17-11-17

---

## IOS Network

[Fast Sever Documents](https://lhy.kr/FastCampus-iOS-API-Server/#post-list)

위의 Server API 를 참조하여, token 값도 받아보고, POST, GET 을 사용해보자..!

---

## Token 을 받아보자

```swift

let baseUrl = "http://api-ios-dev.ap-northeast-2.elasticbeanstalk.com/api"
let urlSignup = "/member/signup/"

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

```

> NetworkManager 를 만들고, token 값을 얻기위해서, Server 에서 요구하는, 것들을 채워 넣어서 body에 보내줍니다.. 요청이 성공하면, 응답으로 토큰을 줍니다..!
> 

---

## Sever에 어떤 POST들이 있는지 확인해보자!

```swift

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

```

> 서버에서 받아온 데이터를 적절한 `시점` 에 사용하기 위해서, 비동기 처리에 대한 고민을 해주어야 합니다. 데이터가 처리되는 시점이랑, 처리된 데이터가 UI에 보여지는 시점의 차이로 인해서, 어떻게 데이터를 처리할것인가에 대한 고민이 필요하게 되었습니다.

---

## Server 에 이미지를 POST 해보자!

Server에 이미지를 post하기위해서는 여러 form중, Multipart/form 을 사용해야 합니다. 사용방법이 조금 복잡합니다.. 

```swift
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
  
  
  
extension Data {
  mutating func appendString(_ string: String) {
    let data = string.data(using: String.Encoding.utf8, allowLossyConversion: false)
    append(data!)
  }
}

```

> POST 한 이미지를 확인해봅시다..! 

---

## 여담

IOS Network 를 사용하기 위해서, url, request, session, header, body에 대한 개념을 명확하게 잡고 있어야 합니다. request, response 하기위한 전체적인 흐름을 가지고 있어야 합니다.

목적: 어떤 서버에 request를 보내고, response 를 받으려고 합니다. 

1. 어디에 보낼것인가? -> url 을 설정합니다. 

2. request를 통해서 url을 보내기위한 준비를 합니다.

3. request가 필요한 것들이 있습니다. header, body, method 를 설정해줍니다. <br>
	- header는, 내가 가져올 body에 대한, 푯말이고, body는 내가 보낼, 혹은 받을 데이터에 대해서 정의합니다. 

4. 이제 request를 session에 task 로 보내서 작업을 실행시켜 줍니다. 

5. 이떄 비동기 처리를 위해서 task 를 resume() 해주어야 합니다

---

