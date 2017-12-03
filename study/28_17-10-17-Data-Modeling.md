# 28_17-10-17

---

## Data Model


---

## Struct 로 데이터 모델 만들기

| 데이터 컨트롤 흐름 |
| :------------ |
|![screen](/study/image/ClassVSStruct-9.jpg) |


> 이렇게 서버나,데이터 베이스 에서 넘어온 값은 Dictionanry OR Array 또는 다른 형태로 넘어오는데, 이 데이터를 내가 수정, 재사용이 `편하게` 만들어주기 위한 목적으로 데이터 모델을 사용한다. 


---

## 데이터 모델 만들기 실습 Part 1

- var someInts:[Int] = [1,2,3,4] -> -> 이런 문법을 `섭 스크립트` 문법이라고 한다.
  


```swift

enum checkGender: Int {
    case man = 1
    case girl = 2
}

struct data {
    var userID: String
    var userPW: String
    var email: String
    var birthDay: String?
    var gender: Int
    
    // enum 으로 정의해서 해보자
    //var genderlist: [String]? = ["남자", "여자"]
    
    
    // init 시도 할때 실패할수 있는 가능성을 내포하고 있어서 init 을 옵셔널로 선언 해준다.
    init?(dumidata: [String:Any]) {
        
        // userID 정의
        guard let userID = dumidata["userID"] as? String else { return nil }
        self.userID = userID
        
        // userPW 정의
        guard let userPW = dumidata["userPW"] as? String else { return nil }
        self.userPW = userPW
        
        //email 정의
        guard let email = dumidata["email"] as? String else { return nil }
        self.email = email
        
        
        // birthDay 는 옵셔널이기 때문에 값이 없을수도 있음. 그렇게 때문에 guard let 말고, 값이 없을수도 있는 경우를 생각해서 그냥 옵셔널일수로 만들어주자
        self.birthDay = dumidata["birthDay"] as? String
        
       
        guard let rawValue = dumidata["gender"] as? Int else {return nil}
        self.gender = checkGender(rawValue: rawValue)!.rawValue

    }
    
}


let userDic: Dictionary<String,Any> = ["userID":"joo", "userPW":"12345!@", "email":"knightjym@gmail.com", "birthDay":"2017/10/15", "gender":1]



```

var userID: String
    var userPW: String
    var email: String
    var birthDay: String?
    var gender: Int

> userID, userPW, email, birthDay, gender 각각의 값을 Struct 를 통해서 타입을 검사하고, 들어 있는 값이 nil 이냐 아니느냐에 따라서 값을 분류 했다. 그 중 gender 같이 두가지 값을 가지고 있고, 그 값이 어떤 `정보`와 매칭 되어서 Eunm 을 사용해서 원하는 값을 얻게 만들었다, 사실 Array로 담아서 만들어도 가능하다!

---

## 데이터 모델 만들기 실습 part 2

```swift

var data: [[String:Any]] = [["imageURL":"http....",
                                "전시명" : "돈을 드립니다!",
                                "전시장소": "창덕궁",
                                "시작날짜": "2017-5-5",
                                "종료날짜" : "2017-10-10"],
                            
                            ["imageURL":"http....111",
                             "전시명" : "돈을 드립니다!111",
                             "전시장소": "창덕궁111",
                             "시작날짜": "2017-10-10",
                             "종료날짜" : "2017-10-20"]]


struct ImportData {
    var URL: String
    var titleName: String
    var place: String
    
    var startDate: String
    var endDate: String?
    
    init?(dumidata: [String:Any]) {
        
        guard let URL = dumidata["imageURL"] as? String else { return nil }
        self.URL = URL
        
        guard let titleName = dumidata["전시명"] as? String else { return nil }
        self.titleName = titleName
        
        guard let place = dumidata["전시장소"] as? String else { return nil }
        self.place = place
        
        guard let startDate = dumidata["시작날짜"] as? String else { return nil }
        self.startDate = startDate
        
        guard let endDate = dumidata["종료날짜"] as? String else { return nil }
        self.endDate = endDate

        
        

    }
    
    
}

for i in data{
    let indexValue = i
    let value = ImportData(dumidata: indexValue)
    dump(value)
    

}


```
> data 가 조금 많아 졌다고 가정 했을대, 위의 방법을 사용했다, for 문을 사용해서 데이터의 각 인덱스 번호에 접근후, 그 인덱스 번호를 이용해서 struct로 구조화 해서 데이터를 핸들링 하는 방법을 사용했다. 필요한 데이터가 있을떄 for-in 문에서 적절하게 필요한 변수를 넣어서 가공하게 되면, 데이터를 수정하기도 편리하고, 추가되는 데이터는 Struct에서 추가 해주기만 하면 데이터 가공을 조금 용이 하게 사용할수 있다.


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

