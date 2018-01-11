import Foundation

// 데이터 모델

struct ProfileModel {
    
    var nickname: String
    var statusDesc: String
    var profileImageName: String
    
    
    var email: String
    var phoneNumber: String
    var myprofileDesc: String
    var bgImageName: String
    
    
    init?(data: [String:String]) {
        
        // 데이터 모델링 합시다.
        
        guard let nickname = data["Nickname"] else { return nil}
        self.nickname = nickname
        
        guard let statusDesc = data["StatusDescription"] else { return nil}
        self.statusDesc = statusDesc
        
        guard let profileImageName = data["ProfileImage"] else { return nil}
        self.profileImageName = profileImageName
        
        guard let email = data["Email"] else { return nil}
        self.email = email
        
        guard let phoneNumber = data["PhoneNumber"] else { return nil}
        self.phoneNumber = phoneNumber
        
        guard let myprofileDesc = data["MyProfileDescription"] else { return nil}
        self.myprofileDesc = myprofileDesc
        
        guard let bgImageName = data["BackgroundImage"] else { return nil}
        self.bgImageName = bgImageName
        
        
    }
    
    
}
