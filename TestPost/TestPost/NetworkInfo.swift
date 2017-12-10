//
//  NetworkInfo.swift
//  ExplogFB
//
//  Created by 황재욱 on 2017. 11. 28..
//  Copyright © 2017년 becomingmacker. All rights reserved.
//

import Foundation

let baseURL = "http://explog-shz.ap-northeast-2.elasticbeanstalk.com/"

enum ServiceType: String{
    case login
    case signup
    case postCreat
    case postList
    case postDetail
    case postTextCreat
    case postText
    case postreply
    case photoCreat
    var routing : String{
        switch self{
        case .login:
            print()
            return baseURL + "member/login/"
        case .signup:
            print()
            return baseURL + "member/signup/"
        case .postCreat:
            print()
            return baseURL + "post/create/"
        case .postList:
            //print()
            return baseURL + "post/"
        case .postDetail:
            //print()
            return baseURL + "post/8/"
        case .postTextCreat:
            //print()
            return baseURL + "post/24/text/"
        case .postText:
            //print()
            return baseURL + "post/text/10/"
        case .postreply:
            //print()
            return baseURL + "post/8/reply/"
        case .photoCreat:
            //print()
            return baseURL + "post/26/photo/"
        }
        
    }
}

protocol NetworkInfo {
    
}

extension NetworkInfo {
    
    static func getURL(serviceType: ServiceType) -> String {
        return "http://explog-shz.ap-northeast-2.elasticbeanstalk.com/" + serviceType.routing
    }
    
}


