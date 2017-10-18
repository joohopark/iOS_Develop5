# 28_17-10-17

---

## Data Model


---

## Data Model 실습

> 사실 서버쪽에서 데이터가 넘어올떄 '_' 가 포함되어 있다. 이것도 필터링 해주는 방법을 생각해주어야 할것 같다..!

- 시나리오: 서버에서 소녀시대 앨범 데이터를 받아서 데이터 모델링 하기..

```swift


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

-> 위의 코드도 사실, 조금은 보기 편하게 나눈 것 이지만, 사실은 서버에서 한줄로 넘어오면 해석하기가 조금 난해해진다..

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

> 두개의 key값을 기준으로 `albumInfo` 와, `songList` 리스트를 나누어서 모델링을 했습니다.

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

-> songListData 부분의 가정은 옵셔널인 경우가 없을때 가능합니다. for-in 문을 사용해서, 모든 프로퍼트의 값을 인덱스 번호를 패키지로 하나의 데이터로 만들어서 사용할수 있는 장점이 있습니다. 하지만 단점으로는 옵셔널인 경우가 없을때 가능합니다. 옵셔널이 있게되면, 인덱스의 경계가 무의미해 지기때문에 사용효과가 없어집니다. 그래서 좋은 모델링은 아닌것 같습니다..!


```

- 실습 난이도를 올려봅시다 !


```swift


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

```

> key 값으로 `playList , likeInfo` 를 기준으로, 각각의 키, 벨류 값을 타입 캐스팅 하면서 변환시켜줍니다. 




---

