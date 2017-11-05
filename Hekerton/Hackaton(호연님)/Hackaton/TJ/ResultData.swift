
import Foundation

class ResultCenter {
    var result: ResultData?
    
    init() {
        loadData()
    }
    
    func loadData() {
        if let bundleDic = Bundle.main.path(forResource: "resultList", ofType: "plist"),
        let resultDic = NSDictionary(contentsOfFile: bundleDic) as? [String: Any] {
            result = ResultData(resultData: resultDic)
        }
    }
    
}

struct ResultData {
    var d: DetailData?
    var i: DetailData?
    var s: DetailData?
    var c: DetailData?
    
    init?(resultData: [String: Any]) {
        guard let d = resultData["d"] as? [String: String] else { return nil }
        self.d = DetailData(detailData: d)
        
        guard let i = resultData["i"] as? [String: String] else { return nil }
        self.i = DetailData(detailData: i)
        
        guard let s = resultData["s"] as? [String: String] else { return nil }
        self.s = DetailData(detailData: s)
        
        guard let c = resultData["c"] as? [String: String] else { return nil }
        self.c = DetailData(detailData: c)
        
    }

}



struct DetailData {
    var title: String
    var msg: String
    
    init?(detailData: [String: String]) {
        guard let title = detailData["title"] else { return nil }
        self.title = title
        
        guard let msg = detailData["msg"] else { return nil }
        self.msg = msg
        
    }
}
