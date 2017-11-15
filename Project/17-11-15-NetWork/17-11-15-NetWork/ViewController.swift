


import UIKit

class ViewController: UIViewController {

    var getData: [[String:Any]]?
    var getResponse: Any?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url: URL! = URL(string: "http://api-ios-dev.ap-northeast-2.elasticbeanstalk.com/api/post/")
        var request = URLRequest(url: url)
        
        
        // 이녀석은 get 이기때문에, 어떤 바디도 존재 하지않음.
        request.httpMethod = "GET"
        request.addValue("Token 173b78e9e0a0553f45fee10f2abf459a118a29a3", forHTTPHeaderField: "Authorization")
        let session = URLSession.shared
        
        // callback closure
        // 요청하는것은 data에 담기고, 요청하는것은 response 에 담기고, 여러가지...설정들...?
        session.dataTask(with: request) { (data, response, error) in
            self.getData = []
            
            
            if let data = data {
                do {
                    let Arr = try JSONSerialization.jsonObject(with: data, options: []) as! [[String: Any]]
                    for item in Arr {
                        self.getData?.append(item)
                        print(item["author"])
                    }
                    
                } catch let error {
                    print("\(error.localizedDescription)")
                }
                
            }
            // response는 실패든, 성공이든 돌아옴, 대신 우리가 원하는 형태냐, 아니느냐에 따라서 알수 있음.
            // 여기에서 error 이 온다는것, 서버에서 응답을 주지 않는 에러임.
        }.resume()
        
        print(self.getData)
        
        
    }

    /*
     2017-11-15 12:30:28.988313+0900 17-11-15-NetWork[22785:302924] App Transport Security has blocked a cleartext HTTP (http://) resource load since it is insecure. Temporary exceptions can be configured via your app's Info.plist file.
     
     2017-11-15 12:30:28.988856+0900 17-11-15-NetWork[22785:302925] Task <79870FE9-5F8C-44C3-AF90-976EBA7F085E>.<1> finished with error - code: -1022
     
     nil nil Optional(Error Domain=NSURLErrorDomain Code=-1022 "The resource could not be loaded because the App Transport Security policy requires the use of a secure connection."
     
     UserInfo={NSUnderlyingError=0x60000005a1f0 {Error Domain=kCFErrorDomainCFNetwork Code=-1022 "(null)"},
     
     NSErrorFailingURLStringKey=http://api-ios-dev.ap-northeast-2.elasticbeanstalk.com/api/post/,
     
     NSErrorFailingURLKey=http://api-ios-dev.ap-northeast-2.elasticbeanstalk.com/api/post/,
     
     NSLocalizedDescription=The resource could not be loaded because the App Transport Security policy requires the use of a secure connection.})

 
     */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    @IBAction func checkData(_ sender: UIButton){
        print(self.getData)
    }
    

}

