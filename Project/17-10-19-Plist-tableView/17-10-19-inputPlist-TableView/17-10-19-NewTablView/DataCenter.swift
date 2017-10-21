//
//  Data.swift
//  17-10-19-NewTablView
//
//  Created by MIN JUN JU on 2017. 10. 19..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import Foundation


// dataCenter
class DataCenter {
    
    // 싱글턴 정의 
    static var mainCenter: DataCenter = DataCenter()
    var nameList: [String] = []
    
    var documentsPath: String?
    
    private init() {
        
    }
    
    func loadNameList() {
        // Plist에서 데이터 불러와서 nameList에 할당
        
        documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/Data.plist"
        
        print(documentsPath)
        
        if !FileManager.default.fileExists(atPath: documentsPath!) {
            
            // 1-1 값이 없다면 복사.
            // 번들에 있는 값을 가져와야하기때문에 번들에 있는 주소를 가져와야함
            
            if let bundlePath = Bundle.main.path(forResource: "Data", ofType: "plist") {
                // 복사는 fileManager
                // throw 가 있어서, try를 붙여줌...?
                // do -> try -> catch 문을 사용해준다.
                //
                do {
                    try FileManager.default.copyItem(atPath: bundlePath, toPath: documentsPath!)
                    print("복사성공")
                    
                }catch {
                    print("복사 실패 두둥")
                    
                }
            }
            
            
        }
        
        guard let dic = NSArray(contentsOfFile: documentsPath!) as? [String] else {return}
        // 현재 Plist에 있는 값을 dic에 넣음.......이거 나머지 더 해보자
        
        for i in dic {
            self.nameList.append(i)
        }
        
        print(self.nameList) // 이후에 계속 더해보자.
        
        
        
        
    }
        
        
    
    
    
    func addName(_ name: String)  {
        // 여기에서는,
        
        self.nameList.append(name)
        saveNameList()
        
    }
    
    
    func saveNameList() {
        // nameList에 있는 데이터를 Plist에 저장
        
       
    
    
}
}
