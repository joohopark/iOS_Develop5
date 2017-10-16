//
//  data.swift
//  17-10-16-ClassAndStruct
//
//  Created by MIN JUN JU on 2017. 10. 16..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import Foundation

enum checkGender: Int {
    case man = 1
    case girl = 2
}

struct data {
    var userID: String
    var userPW: String
    var email: String
    var birthDay: String?
    var gender: Int
    
    // enum 으로 정의해서 해보자
    //var genderlist: [String]? = ["남자", "여자"]
    
    

    init?(dumidata: [String:Any]) {
        
        // userID 정의
        guard let userID = dumidata["userID"] as? String else { return nil }
        self.userID = userID
        
        // userPW 정의
        guard let userPW = dumidata["userPW"] as? String else { return nil }
        self.userPW = userPW
        
        //email 정의
        guard let email = dumidata["email"] as? String else { return nil }
        self.email = email
        
        
        // birthDay 는 옵셔널이기 때문에 값이 없을수도 있음. 그렇게 때문에 guard let 말고, 값이 없을수도 있는 경우를 생각해서 그냥 옵셔널일수로 만들어주자
        self.birthDay = dumidata["birthDay"] as? String
        
       
        guard let rawValue = dumidata["gender"] as? Int else {return nil}
        self.gender = checkGender(rawValue: rawValue)!.rawValue

    }
    
}


let userDic: Dictionary<String,Any> = ["userID":"joo", "userPW":"12345!@", "email":"knightjym@gmail.com", "birthDay":"2017/10/15", "gender":1]

//print(userDic)

