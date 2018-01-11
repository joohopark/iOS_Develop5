


import Foundation


//rawData
let album:Dictionary<String,Any> =
    ["albumInfo":["albumTitle":"2집 Oh!",
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
                  "playURL":"http://music.naver.com/126"]
        ]
]

struct AlbumInfo
{
    var albumTitle:String
    var artist:String
    var genre:String
    
    init?(dataDic:[String:Any])
    {
        guard let albumTitle = dataDic["albumTitle"] as? String else { return nil }
        self.albumTitle = albumTitle
        guard let artist = dataDic["artist"] as? String else { return nil }
        self.artist = artist
        guard let genre = dataDic["genre"] as? String else { return nil }
        self.genre = genre
    }
}



struct SongData
{
    var songTitle:String
    //    var trackNum:Int
    var artist:String
    //    var writer:String
    var formatter:DateFormatter = DateFormatter()
    
    var playTime:Int = 0{
        willSet
        {
            let now = Date(timeIntervalSince1970: TimeInterval(newValue))
            formatter.dateFormat = "mm:ss"
            self.totalPlayTime = formatter.string(from: now)
        }
    }
    var totalPlayTime:String = "00:00"
    //    var playURL:String
    
    init?(dataDic:[String:Any])
    {
        guard let songTitle = dataDic["songTitle"] as? String  else { return nil }
        self.songTitle = songTitle
        guard let artist = dataDic["artist"] as? String else { return nil }
        self.artist = artist
        
        guard let playTime = dataDic["playTime"] as? Int else { return nil }
        self.playTime = playTime
        
        let now = Date(timeIntervalSince1970: TimeInterval(playTime))
        formatter.dateFormat = "mm:ss"
        self.totalPlayTime = formatter.string(from: now)
        
        print(totalPlayTime)
    }
    
    mutating func timeUse()
    {
        playTime -= 1
    }
}



struct AlbumModel
{
    

    
    
    var albumInfo:AlbumInfo
    var songList:[SongData] = []
    
    init?(dataDic:[String:Any])
    {
        guard let infoDic = dataDic["albumInfo"] as? Dictionary<String,Any> else {return nil}
        //데이터 인스턴스 만들기
        guard let info = AlbumInfo(dataDic: infoDic) else {return nil}
        albumInfo = info
        
        guard let list = dataDic["songList"] as? [Dictionary<String,Any>] else {return nil}
        //for문을 통해 각 데이터를 모델로 만든후 Array에 추가
        for songDic in list
        {
            if let songData = SongData(dataDic: songDic)
            {
                songList.append(songData)
            }
        }
    }
}



