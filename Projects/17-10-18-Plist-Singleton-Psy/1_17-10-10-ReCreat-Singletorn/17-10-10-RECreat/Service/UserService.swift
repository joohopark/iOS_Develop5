//
//  UserService.swift
//  17-10-10-RECreat
//
//  Created by MIN JUN JU on 2017. 10. 18..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import Foundation


struct UserService {
    // 속성으로 Users 를 갖는다.
    var model: Users?
    
    // 연산프로퍼티를 정의함
    var documentDirectory: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    // 싱글턴이라는데..
    static var sharedInstance: UserService = UserService()
    
    init() {
        //plist 에서 정보를 가져와서 model에 넣는다.
        loadData()
    }
    
    //UserData Plist 의 값을 가져와서, 사용한다...?
    mutating func loadData() {
        // Plist 의 값을 가져오려고함.
        // 어느 동에~ 어느 녀석에 있는 녀석을 가져온다고함
        
        // 경로를 덧붙이는것
        let dataURL = documentDirectory.appendingPathComponent("UserData.plist")
        
        print(dataURL)
        
            
//            // 에플의 샌드박스 단위.. app의 사용자를 위한 폴더가 만들어지는데, 그 단위가 document이다..!
//            for: FileManager.SearchPathDirectory.documentDirectory,
//            
//            // 우리는 첫번째의 값을 가져오는데, first은 옵셔널이됨. 근데 이때 강제 언렙핑을 해서 사용한다.
//            // 여기서 first 를 옵셔널을 뜯어줘야 아래의 값에서 옵셔널을 받지 않는 상태로 사용할수 있다.
//            in: FileManager.SearchPathDomainMask.userDomainMask).first!
//        
        let dataStringPath = dataURL.path
        
        // 우리가 찾으려고하는 위치에 값이 없다면,
        
        if !FileManager.default.fileExists(atPath: dataStringPath) {
            
            //bundle에 있는 UserData라는 Plist의 값을 찾아서, plist에 복사해서 넣는다.
            guard let plistURL = Bundle.main.url(forResource: "UserData", withExtension: "plist") else { return }
            
            // plistURL 에 bundle에 있는 Plist를 복사하고,dataURL의 위치에 넣어준다.
            try! FileManager.default.copyItem(at: plistURL, to: dataURL)
            
        }
        
        
        
        guard let dataDictionary = NSDictionary(contentsOf: dataURL) as? [String: Any] else {return}
        self.model = Users(dictionary: dataDictionary)
    }
    
    func validateUserInfo(username: String, password: String) -> Bool {
        
        if let model = self.model {
            
            //user대한 배열을 가지고 있는 녀석을 돌면서, 각각 한명한명에 대한 정보가 날라옴
            for user in model.users {
                
                print(user)
                
                // 사용자가 텍스트 필드에 입력한 유저 정보가 있음.
                if user.username == username && user.password == password {
                    return true
                }
            }
            
        }
        return false
    }
}


