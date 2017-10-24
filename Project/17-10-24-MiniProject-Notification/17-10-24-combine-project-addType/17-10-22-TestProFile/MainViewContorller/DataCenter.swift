
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
    
    
    
   
    
    
    
    
}

