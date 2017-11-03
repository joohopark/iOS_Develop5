import Foundation


struct DataModel {
    static var singleton: DataModel = DataModel()
    
    var documentsPath: String?
    var resultdocumentsPath: String?
    var exampleArray: [[String:String]] = []
    var resultArray: [[String:String]] = []
    
    var randomExampleArray: [[String:String]] = []

    
    
    init() {
        loadData()
        
    }
    
    
    mutating func loadData() {
        documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/exampleList.plist"
        
        
        if !FileManager.default.fileExists(atPath: documentsPath!) {
            if let bundlePath = Bundle.main.path(forResource: "exampleList", ofType: "plist") {
                do {
                    try FileManager.default.copyItem(atPath: bundlePath, toPath: documentsPath!)
                    print("복사성공")
                    
                }catch {
                    print("복사 실패 두둥")
                    
                }
            }
            
            
        }
     
        
        if let arr = NSArray(contentsOfFile: documentsPath!) as? [[String:String]] {
            
            // 여기에서 다른 모델링을 통해서 원하는 값을 꺼내 놓아야한다.
            
            for i in arr {
                exampleArray.append(i)
            }
            
            
        }
        
        resultdocumentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/resultList.plist"
        
        
        
        if !FileManager.default.fileExists(atPath: resultdocumentsPath!) {
            if let bundlePath = Bundle.main.path(forResource: "resultList", ofType: "plist") {
                do {
                    try FileManager.default.copyItem(atPath: bundlePath, toPath: resultdocumentsPath!)
                    print("복사성공")
                    
                }catch {
                    print("복사 실패 두둥")
                    
                }
            }
            
            
        }
        
        if let resultArr = NSArray(contentsOfFile: resultdocumentsPath!) as? [[String:String]] {
            
            // 여기에서 다른 모델링을 통해서 원하는 값을 꺼내 놓아야한다.
            
            for i in resultArr {
                resultArray.append(i)
            }
        }
        
        // randomArray 만들기
        
        var tempExampleArray = self.exampleArray
        var tempX: [[String:String]] = []
        
        while tempX.count != 24 {
            
            var RandomX = Int(arc4random_uniform(UInt32(tempExampleArray.count)))
            
            tempX.append(tempExampleArray[RandomX])
            tempExampleArray.remove(at: RandomX)
        }
        
        self.randomExampleArray = tempX
        
        
    }
    
    
    
    
    
}
