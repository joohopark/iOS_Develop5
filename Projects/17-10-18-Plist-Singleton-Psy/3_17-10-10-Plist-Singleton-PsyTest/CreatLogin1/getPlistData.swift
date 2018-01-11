//
//  getPlistData.swift
//  TestPlist-Singletorn
//
//  Created by MIN JUN JU on 2017. 10. 18..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import Foundation


struct getPlistData {
    var model: Users?
    
    // 연산프로퍼티를 정의함
    // 애초에 url을 값으로 가지고 사용하는것 같음...
    var documentDirectory: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    // 싱글턴이라는데..
    static var sharedInstance: getPlistData = getPlistData()
    
    // 인스턴스 생성시 Plist의 값을 가져와서 model 변수에 저장 한다.
    init() {
        loadData()
    }
    
    
    
    mutating func loadData() {
        
        
        
        
        
        // 파일디렉토리의 경로를 모르는 경우에 사용한다.. '/' 녀석을 추가하기위해서 사용하는것 같음..
        let dataURL = documentDirectory.appendingPathComponent("UserData.plist")
        
        //dataURL의 타입이 URL 이라, String 로 바꾸어 주기 위함.
        let dataStringPath = dataURL.path
        
        
        
        
        
        // dataStringPath 에 파일이 없다면,
        if !FileManager.default.fileExists(atPath: dataStringPath) {
            
            //bundle에 있는 UserData라는 Plist의 값을 찾아서, plist에 복사해서 넣는다.
            guard let plistURL = Bundle.main.url(forResource: "UserData", withExtension: "plist") else { return }
            
            // plistURL 에 bundle에 있는 Plist를 복사하고,dataURL의 위치에 넣어준다.
            try! FileManager.default.copyItem(at: plistURL, to: dataURL)
            
        }
        
        // Plist의 데이터가 들어가있는 상태이다..!
        // 위에서 어떤 값이 NSDictionary에 저장이 되어 있는 상태...?!
        // URL값을 가지고 원래는 Array의 형태인데, key값을 기준으로 [String:Any] 형태로 만들어줌.
        guard let dataDictionary = NSDictionary(contentsOf: dataURL) as? [String: Any] else {return}
        
        //model 에 값을 넣음
        
        self.model = Users(dictionary: dataDictionary)
        
        
        
        
    }
    
    func validateUserInfo(username: String, password: String) -> Bool {
        
        if let model = self.model {
            
            //user대한 배열을 가지고 있는 녀석을 돌면서, 각각 한명한명에 대한 정보가 날라옴
            for user in model.users {
                
                
                
                // 사용자가 텍스트 필드에 입력한 유저 정보가 있음.
                if user.username == username && user.password == password {
                    return true
                }
            }
            
        }
        return false
    }
    
    
}


// dataDictionary에서 받아온 데이터를 첫번째로 가공해서, 다른 데이터로 넘겨주기 위해서 만들어줌.
struct User {
    let username: String
    
    // 이메일과 패스워드는 바뀔수 있기 때문에 var로 만들어줌
    var email: String
    var password: String
    
    // 이니셜 라이즈가 실패할수도 있기때문에, init? 넣어주고 return nil 을 해주어야한다.
    init?(dictionary: [String: Any]) {
        guard let username = dictionary["username"] as? String else { return nil }
        guard let email = dictionary["email"] as? String else { return nil }
        guard let password = dictionary["password"] as? String else { return nil }
        
        self.username = username
        self.email = email
        self.password = password
        
    }
}


struct Users {
    
    var users: [User]
    
    init(dictionary: [String: Any]) {
        self.users = []
        
        guard let users = dictionary["Item"] as? [[String: Any]] else { return }
        for user in users {
            //var x = User(dictionary: user)
            self.users.append((User(dictionary: user))!)
        }
    }
}






