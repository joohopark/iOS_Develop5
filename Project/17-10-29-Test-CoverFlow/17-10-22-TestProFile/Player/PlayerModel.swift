import Foundation
import UIKit
import AVFoundation


struct PlayListDataModel {
    
    var imgeArray: [UIImage] = []

    var musicTitleArray: [String] = []
    var singerTitleArray: [String] = []
    var lyricsArray: [String] = []
    
    var urlArray: [URL] = []
    
    
    static let PlayListSingleton: PlayListDataModel = PlayListDataModel()
    
    private init() {
        loadData()
        
    }
    
    mutating func loadData() {
        
        // Song 파일에 있는 25번 녀석을 가져옴
        
        
        for idx in 0...29 {
            
            
            var forResourceName:String = "Song/" + "\(idx)"
            
            
            // 메타 데이터를 꺼내오기 위해서 이렇게 작업을함. metadata의 구조가 좋은 편이 아니라서, 모델링을 해주어야 하는데, 그 모델링 해주는 과정을 생략하고 직접 접근해서 사용함.
            if let url = Bundle.main.url(forResource: forResourceName, withExtension: "mp3") {
                
                self.urlArray.append(url)
                // 애셋에 접근한것..!
                let asset = AVURLAsset(url: url)
                // 이런 asset에 있는 녀석의 데이터가 메타 데이터임
                
                lyricsArray.append(asset.lyrics!)
                
                
                let metaData:[AVMetadataItem] = asset.metadata
                
                
                for item in metaData {
                    
                    
                    
                    
                    if let key = item.commonKey?.rawValue {
                        switch key {
                        case "title":
                            var musicTitletext = item.value as? String
                            
                            self.musicTitleArray.append(musicTitletext!)
                            
                        case "artist":
                            var singerTitletext = item.value as? String
                            
                            self.singerTitleArray.append(singerTitletext!)
                            
                        case "artwork":
                            let data = item.dataValue
                            let image = UIImage(data: data!)
                            
                            self.imgeArray.append(image!)
                            
                            
                        default:
                            print("default")
                            
                        }
                        
                    }
                }
            }
            
            
        }
        
        
        
        
    }
}



