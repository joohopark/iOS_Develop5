//
//  data.swift
//  17-10-17-DataModelViewcontroller
//
//  Created by MIN JUN JU on 2017. 10. 17..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import Foundation
import UIKit

class dataModel: UIView {
    
    
    
    
    
    
    
    let album: [String:Any] = ["albumInfo":["albumTitle":"2집 Oh!",
                                            "artist":"소녀시대",
                                            "genre":"댄스"],
                               
                               "songList":[["songTitle":"Oh!",
                                            "trackNum":1,
                                            "artist":"소녀시대",
                                            "writer":"김정배",
                                            "playTime":12340,
                                            "playURL":"http://music.naver.com/123"],
                                           
                                           ["songTitle":"Show! Show! Show!",
                                            "trackNum":2,
                                            "artist":"소녀시대",
                                            "writer":"김부민",
                                            "playTime":10130,
                                            "playURL":"http://music.naver.com/124"],
                                           
                                           ["songTitle":"웃자 (Be Happy)",
                                            "trackNum":4,
                                            "artist":"소녀시대",
                                            "writer":"이트라이브",
                                            "playTime":12134,
                                            "playURL":"http://music.naver.com/126"]]
    ]
    
    
    
    struct AlbumInfoData {
        var albumTitle: String
        var artist: String
        var genre: String
        
        init?(dumidata: [String:Any]) {
            guard let albumTitle = dumidata["albumInfo"] as? [String:Any] else { return nil }
            self.albumTitle = (albumTitle["albumTitle"] as? String)!
            
            guard let artist = dumidata["albumInfo"] as? [String:Any] else { return nil }
            self.artist = (albumTitle["artist"] as? String)!
            
            guard let genre = dumidata["albumInfo"] as? [String:Any] else { return nil }
            self.genre = (albumTitle["genre"] as? String)!
            
        }
    }
    
    
    struct songListData {
        var songTitle: [String] = []
        var trackNum: [String] = []
        var artist: [String] = []
        var writer: [String] = []
        var playTime: [String] = []
        var playURL: [String] = []
        
        
        
        init?(dumidata: [String:Any]) {
            
            
            guard let songTitle = dumidata["songList"] as? [[String:Any]] else { return nil }
            
            
            for i in songTitle {
                // songTitle
                let typeCasting = i as? [String:Any]
                let x = typeCasting!["songTitle"] as? String
                
                self.songTitle.append(x!)
                
                //trackNum
                let typeCasting1 = i as? [String:Any]
                let x1 = typeCasting1!["trackNum"] as? String
                
                self.trackNum.append(x1!)
                
                //artist
                let typeCasting2 = i as? [String:Any]
                let x2 = typeCasting2!["artist"] as? String
                
                self.artist.append(x2!)
                
                //writer
                let typeCasting3 = i as? [String:Any]
                let x3 = typeCasting3!["writer"] as? String
                
                self.writer.append(x3!)
                
                //playTime
                let typeCasting4 = i as? [String:Any]
                let x4 = typeCasting4!["playTime"] as? String
                
                self.playTime.append(x4!)
                
                //playURL
                let typeCasting5 = i as? [String:Any]
                let x5 = typeCasting5!["playURL"] as? String
                
                self.playURL.append(x5!)
            }
        }
        
        
        
        
    }
    
   
    override func awakeFromNib() {
        // override 했기때문에, super를 한다.
        super.awakeFromNib()
     print("abd")
    }
}
