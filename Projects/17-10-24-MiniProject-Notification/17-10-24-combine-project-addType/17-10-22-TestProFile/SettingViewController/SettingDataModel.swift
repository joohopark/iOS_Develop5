
import Foundation


struct RawData {
    
    
    var documentsPath: String?
    var rawData: [storeData]?
    
    static var singletonRawData: RawData = RawData()

    init() {
        getRawData()
        
    }
    mutating func getRawData() {
        
        documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/Settings.plist"
        
        if !FileManager.default.fileExists(atPath: documentsPath!) {
            
            if let bundlePath = Bundle.main.path(forResource: "Settings", ofType: "plist") {
                do {
                    try FileManager.default.copyItem(atPath: bundlePath, toPath: documentsPath!)
                }catch {
                    print("복사실패")
                    
                }
            }
            
            
        }
        
        
        // [[String:Any]] 형태로 변환
        if let rawArr = NSArray(contentsOfFile: documentsPath!) as? [[String:Any]] {
            
            
            
            var arr = rawArr
            
            //rawData 에 데이터를 모두 집어 넣음.
            rawData = []
            for i in arr {
                
                self.rawData?.append(storeData(inputData: i)!)
                
            }
            
            
            
            let nsDic = NSArray(array: arr)
            nsDic.write(toFile: documentsPath!, atomically: true)

        }
    }
    
}




struct storeData {
    
    var sectionTitle: String
    var accountData: [[String:String]] = []
    
    var informatinData: [[String:String]] = []
    
    var serviceData: [[String:String]] = []
    
    init?(inputData: [String: Any]) {
        
        guard let sectionTitle = inputData["SectionTitle"] as? String else { return nil }
        
        
            self.sectionTitle = sectionTitle
        
        if sectionTitle == "계정" {
            
            var changeData = inputData["Data"] as! [[String:String]]
            
            for i in changeData {
                
                self.accountData.append(i)
                
            }
        }else if sectionTitle == "정보" {
            var changeInformationData = inputData["Data"] as! [[String:String]]
            
            for i in changeInformationData {
                
                self.informatinData.append(i)
            }
        }else if sectionTitle == "서비스" {
            
            var changeServiceData = inputData["Data"] as! [[String:String]]
            for i in changeServiceData {
                self.serviceData.append(i)
            }
        }
    
    }
    
}
