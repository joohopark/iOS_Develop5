//
//  User.swift
//  17-10-10-RECreat
//
//  Created by MIN JUN JU on 2017. 10. 18..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import Foundation

// struct는 맴버와이징을 통해서, 이닛을 하지않으면, 가지고 있는 모든 변수를 자동으로 초기화해서 사용할수 있게 만들어 준다. 
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
        
        guard let users = dictionary["item"] as? [[String: Any]] else { return }
        for user in users {
            //var x = User(dictionary: user)
            self.users.append((User(dictionary: user))!)
        }
        
    }
    
    
    
    
    
}

