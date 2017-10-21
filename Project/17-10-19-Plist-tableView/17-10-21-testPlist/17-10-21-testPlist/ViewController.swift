//
//  ViewController.swift
//  17-10-21-testPlist
//
//  Created by MIN JUN JU on 2017. 10. 21..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Data.plist 의 실제 주소!, path 의 차이 한번 확인하자
        // 1. bundle에서 값을 불러오기!
        //var x = Bundle.main.url(forResource: "Data", withExtension: "plist")
        var y = Bundle.main.path(forResource: "Data", ofType: "plist")
        

        // 딕셔너리가 담긴 어레이! // 이렇게 봅아서 사용할수 있다, 여기서 주의해야할점은 url, path 는 서로다름!
        guard let arr = NSArray(contentsOfFile: y!) as? [[String:String]] else {return}
        print(arr)
        
        var arr1 = arr
        // 2. 번들에서 불러온값 사용 -> 저장 하기
        // 현재 arr1에는 bundle에서 불러온 값이 저장되어 있다.
        // 가공후, 다시 Data.Plist 에 값을 넣어보자.
        
        arr1.append(["newValue":"new"])
        
        
        // documentc 파일의 디폴츠 URL 위치
        var documentDirectory: URL {
            return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        }
        
        // dataURL 은 현재 값이 없음
        let dataURL = documentDirectory.appendingPathComponent("Data.plist")
        // 사용하기 위해 스트링으로 바꿈
        let dataStringPath = dataURL.path
        
        print(dataURL)
        
        
        // dataStringPath 에 파일이 없으면, plist의 값을 복사하고 생성한다.
        if !FileManager.default.fileExists(atPath: dataStringPath) {
            
            //bundle에 있는 UserData라는 Plist의 값을 찾아서, plist에 복사해서 넣는다.
            guard let plistURL = Bundle.main.url(forResource: "Data", withExtension: "plist") else { return }
            
            // plistURL 에 bundle에 있는 Plist를 복사하고,dataURL의 위치에 넣어준다.
            try! FileManager.default.copyItem(at: plistURL, to: dataURL)
            
        }
        
        // 현재 dataURL 에 데이터가 생성 되어 있는 상태이다. 이 데이터를 어떻게 핸들링 해서 수정할건지....?
        
        guard let documentsArr = NSArray(contentsOfFile: dataStringPath) as? [[String:String]] else {return}
        
        print(documentsArr)
        
        var loadData = documentsArr
        
        loadData.append(["id":"newMinjun", "password": "new", "email":"abc@gmail.com"])
        
        //NSArray 로 만들고 -> 데이터 추가 완료..!
        let nsArr: NSArray = NSArray(array: loadData)
        nsArr.write(toFile: dataStringPath, atomically: true)
        
        // 데이터 추가 & 수정 하는 방법 완료....!
        
        
        
        
        
        
        
    
        
        

        
        
        
        
        
        
        
        
        
        
        
    
        
        
        
        
        
        
    
        
        
        
        
        
        
        
    }
    
    




}

