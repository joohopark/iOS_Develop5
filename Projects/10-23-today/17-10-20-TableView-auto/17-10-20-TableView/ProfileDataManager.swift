//
//  ProfileDataManager.swift
//  17-10-20-TableView
//
//  Created by MIN JUN JU on 2017. 10. 20..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import Foundation

class ProFileDataManager {
    
    var documentsPath: String?

    
    //실제 데이터를 가지고 있는 녀석, 사용도중 초기화 되면 망하기 떄문에..
    private var profiles: [ProfileModel] = []
    
    // 연산 프로퍼티를 사용해서, 값이 초기화되는것을 허용하지 않으려고 읽어 오는것만을 허용해주었다..
    var profilesData: [ProfileModel] {
        return profiles
    }
    
    // 데이터를 load 하는 녀석
    
    init() {
        loadData()
    }
    
    func loadData() {
        
        
        // 번들의 주소 가져오기
        if let filePath = Bundle.main.path(forResource: "FreindInfo", ofType: "plist"), let dataList = NSArray(contentsOfFile: filePath) as? [Any]{
            
            
            for data in dataList {
                
                if let realData = data as? [String: String],
                    
                    
                    let dataModel = ProfileModel(data: realData) {
                        profiles.append(dataModel)
                    
                    
                    
                    }
                }
            }
        
        }
        
        
        
//        documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/FreindInfo.plist"
//
//        if !FileManager.default.fileExists(atPath: documentsPath!) {
//
//            // 1-1 값이 없다면 복사.
//            // 번들에 있는 값을 가져와야하기때문에 번들에 있는 주소를 가져와야함
//
//            if let bundlePath = Bundle.main.path(forResource: "FreindInfo", ofType: "plist") {
//                // 복사는 fileManager
//                // throw 가 있어서, try를 붙여줌...?
//                // do -> try -> catch 문을 사용해준다.
//                //
//                do {
//                    try FileManager.default.copyItem(atPath: bundlePath, toPath: documentsPath!)
//                    print("복사성공")
//
//                }catch {
//                    print("복사 실패 두둥")
//
//                }
//            }
//
//
//        }
//
//        print(documentsPath)
//        guard let dic = NSArray(contentsOfFile: documentsPath!) as? [[String: Any]] else {return}
//        //         현재 Plist에 있는 값을 dic에 넣음.......이거 나머지 더 해보자
//
//
//        for i in dic {
//            var x = DataMod
//            //self.data.append(i)
//        }
//
//        //print(self.data) // 이후에 계속 더해보자.
        
    
        
        
    
}
