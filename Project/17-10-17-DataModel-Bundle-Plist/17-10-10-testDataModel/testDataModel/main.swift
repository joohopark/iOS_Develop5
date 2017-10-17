//
//  main.swift
//  17-10-17-dataModel
//
//  Created by MIN JUN JU on 2017. 10. 17..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import Foundation



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


// DataModel
// 애초에 딕셔너리 형태로 만들지 말고, 어차피 son, up,artist
let playData: [String: Any] = ["playList": ["id": "3",
                                            "upid": "nil",
                                            "title": "나의노래",
                                            "main_img_url": "http://naver.com",
                                            "thumb_img_url": "http://naver.com",
                                            "song_cnt": "3",
                                            "is_premium": "N",
                                            "monthly_ym": "201705"],
                               
                               "likeInfo": ["song": ["id":["like_cnt": "nil", "is_like": "Y"]],
                                            
                                            "up": ["id":["like_cnt": "nil", "is_like": "Y"]],
                                            
                                            "artist": ["id":["like_cnt": "nil", "is_like": "Y"]]]]

// 더미 데이터는 이런 식으로 넘어온다

struct PlayDataModel {
    var id: String
    var upid: String?
    var title: String
    var mainImgRrl: String
    var thumbImgUrl: String
    var songCnt: String
    var isPremium: Bool
    var monthlyYm: String
    
    init?(dumindata: [String: Any] ) {
        
        //key 값을 받아서
        guard let playListValue = playData["playList"] as? [String: Any] else { return nil }
        
        self.id = playListValue["id"] as! String
        
        self.upid = playListValue["upid"] as? String
        
        self.title = playListValue["title"] as! String
        
        self.mainImgRrl = playListValue["main_img_url"] as! String
        
        self.thumbImgUrl = playListValue["thumb_img_url"] as! String
        
        self.songCnt = playListValue["song_cnt"] as! String
        
        // Bool 값 정의
        let checkBool = playListValue["is_premium"] as! String
        if checkBool == "Y" {
            self.isPremium = true
        }else if checkBool == "N" {
            self.isPremium = false
        }else {
            self.isPremium = false
        }
        
        // rawTime정의
        self.monthlyYm = playListValue["monthly_ym"] as! String
        
    }
    
}
















// 나머지 부분 데이터 가공 해보자



//print(y?.monthlyYm)






/*for (k,v) in playData {
 // key 값 저장
 let keyValue = playData["\(k)"] as? [String:Any]
 let x = keyValue!["id"]
 
 print(x)
 
 
 }*/

//print(pl)
