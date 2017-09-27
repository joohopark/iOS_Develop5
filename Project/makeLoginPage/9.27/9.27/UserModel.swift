//
//  UserModel.swift
//  9.27
//
//  Created by MIN JUN JU on 2017. 9. 27..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import Foundation

// final 을 사용하면, 다른 어느곳에서도 상속을 할수 없게 만듬.
final class UserModel {
    
    // 회원의 정보를 구조체로 만들어서, 클레스의 인스턴스로 사용함
    var model: [User] = [
        User(username: "FC1", password: "123"),
        User(username: "FC2", password: "456")
    ]
    
    // 원래 딕셔너리로 사용해야 하는것을, 구조체로 정의하고, 어레이에 구조체를 넣어서 사용함.
    struct User {
        var username: String
        var password: String
        
    }
    
    
    func findUser(name: String, password: String) -> Bool {
        
        for user in model {
            if user.username == name && user.password == password {
                
                // 조건에 만족했으니까, 로그인에 성공에 의미로 true값 만환
                print("로그인성공")
                return true
            }
        
        }
        print("로그인 실패")
        return false 
        
    }
    
    //////closure 에 영향 주는 함수 만듬, closure 에 name, password dp 넣음
    func addUser(name:String, password: String) {
        let newUser = User(username: name, password: password)
        model.append(newUser)
        
    }
    
    
    
    
    
}
