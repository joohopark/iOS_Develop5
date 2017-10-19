import Foundation



struct SingleTonDataCenter {
    
    var documentsPath: String?
    
    var dic: Any {
        
        let dicdic = NSDictionary(contentsOfFile: documentsPath!) as? [String:Any]
            return dicdic
        }
    

    
    // 싱글톤 변수 생성
    static var singerTonValue: SingleTonDataCenter = SingleTonDataCenter()
    
    
    private init() {
        loadData()
        
    }
    
    
    mutating func loadData() {
        
        documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/UserPlist.plist"
        
        
        
        
        
        // 현재 위치의 값이 있음.
        print(documentsPath)
        
        // 존재하지 않다면, path의 위치에 plist를 복사해서 넣어준다..!
        if !FileManager.default.fileExists(atPath: documentsPath!) {
            
            // 1-1 값이 없다면 복사.
            // 번들에 있는 값을 가져와야하기때문에 번들에 있는 주소를 가져와야함
            
            if let bundlePath = Bundle.main.path(forResource: "UserPlist", ofType: "plist") {
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
        
        
        
        
        // 여기에선 무조건 파일이 존재 한다. -> print를 사용해서 경로에 plist가 생성 되었는지 확인할수 있다.
        print(documentsPath)
        
        // 파일을 불러올것임.. 그래서 NSDictionary 를 사용해서 변환 -> print 를 통해서 눈으로 확인 가능
        // 여기에서 NSDictionary 를 만들면, 그 안에 plist의 값이 담겨 있는것을 확인할수 잇다.
        if let dic = NSDictionary(contentsOfFile: documentsPath!) as? [String:Any] {
            print(dic)
            
            // 딕셔너리를 다시 쓰려고함..?
            // 여기에서 dic의 key값에 value 값을 넣어 준것임.
            
            //update는 새로운값을 추가한다기보다는 덮어 쓰기의 느낌으로 하면 될꺼같다,
            var dictionary = dic
            dictionary.updateValue("haha", forKey: "user_id")
            dictionary.updateValue("123", forKey: "pw")
            dictionary.updateValue("91-07-13", forKey: "birthday")
            
            // 새로운 키값을 추가해보자
            dictionary.updateValue("new", forKey: "newKeyValue")
            dictionary.updateValue(["dickey":"newValue"], forKey: "NewDicValue")
            
            
            // NSDictionary를 가지고, NSDictionary를 만들어서, documentsPath로 값을 복사해줌
            // 원리는 위에서 dic을 NSDictionary로 만들고, 거기에 key, value 값을 추가해준다음, nsDic변수를 NSDictionary 를 가지고 NSDictionary로 만들고, nsDic.write로 애초에 DocumetnsPath에 값을 넣어서 붙여줌..!
            let nsDic = NSDictionary(dictionary: dictionary)
            nsDic.write(toFile: documentsPath!, atomically: true)
            
            print(nsDic)
            
            // plist의 값을 긁어 오는게 아니라, plist에 있는 xml파일의 key, value 값을 가져와서 사용할수 있을것 같다...!
        }
        
        // 현재 plist의 파일에 복사가 되었다고 가정하고, 수정, 추가 해보자
        // 1. documentsPath 에 파일이 있는지 없는지 먼저 검사해보자
        // NSDictionary 로 선언이 된 이유는 애초에 맨처음 root Plist 의 Value 타입이 dictionary이기 떄문이다. 만약 Array라면, NSArray로 정의 해서 사용할수 있다.
        
        
        
        
    }
    
    func modifiedPlistValue(anyValue value:Any, keyValue forKey: String) {
        
        var newDic = NSDictionary(contentsOfFile: documentsPath!) as? [String:Any]
        
        newDic?.updateValue(value, forKey: forKey)
        
        
        let newDicDic = NSDictionary(dictionary: newDic!)
        newDicDic.write(toFile: documentsPath!, atomically: true)
        
        
    }
    

}


