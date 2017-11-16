# 48_17-11-16

---

## IOS NetWork

--


---

## IOS Network

URL 을 가지고 어떤 녀석들을 load 하는

objective-c 에서는 let과 var 가 존재하지 않음. 그래서 NS에 mutable이라는 클레스가 존재함. 이것을 swift에서는 struct로 만들어짐.

인증방식중 Auth -> 서버는 아이디와, 비밀번호를 보내면 그거에대한 응답으로 토큰과 키값을줌, 그 토큰과 키값을 서버에 보내면됨. 서버에서는 이 토큰이 어떤 유저인가 알수 있다. 

feed 를 요청할때, 토큰값을 같이 보내주면 데이터를 보내주고, 그렇지 않으면 데이터를 주지 않음.. 아 이런식으로 Auth 를 구현해놓음. 아이디와 비밀번호를 매번 

리퀘스로 보낸다는것은 URI 로 보내는거고 -> URI 는 하나의 method 임. 
URL 로 보내는것은 URL 로 보낸다고 생각해야함. 


---

## URLSession 

shared 는 singeton 으로 존재함. 

task 는 요청에 대해서 task 하나씩하나씩 만듬. 
task 를 보내고, task가 보내고, delegate, clousre 서 응답을 받음. 

하나의 teask 가 응답을 받고, 응답을 보내는. 

Session 과 task 의 차이

session이 요리사면, task는 session이 만든 요리사.. 리퀘스트 -> 응답, 응답을 처리한느것임. 

---

## URLSessionTask 

resume: 다른것을 하다가 다시 돌아온다는..?

---

## URLSessionConfiguration

dafault 는 값을 디스크에 저장하고
ephemral 은 값을 메모리에 저장합니다.


쿠키는 어디의 방문기록을 가지고 있고
cacsh는 : 필요한 데이터들을 임시저장 -> 메모리에 

---

네트워크 실행 순서

Request 생성 -> session 만듬 -> Session메소드 생성 -> Task 실행 -> 용청에 대한 응답을 처리 

JSONSerialization -> 하나씩 스텝바이 스텝으로 언패킹함.
JSONDecoder -> 들어온 데이터를 -> 모델로 바꾸어줌

---

## URLRequest 생성 방법

apple 는, http로 사용하려면, 해제를 해야함, 기본적으로 https 를 사용행햐ㅏㅁ 

ATS(application trans

webView를 사용할때 https 

---

## openWeatherMap 

날씨를 가져오는 API -> 
location 을 통해서 날씨를 가져올수도 있고,
오늘의 날씨를 리스트로 볼수도 있고, 
나만의 날씨app을 가져오면됨. 

저녀석을 사용할때 appId 를 넣어야함.

가입 -> API KEYS, KEY값이 있는데, 그 키값을 넣으면 됨.

하루에 몇건 제한..

---

지도랑 location 은 따로따로임, 지도를 사용하지 않고, location 을 사용할수 있음.

data -> 실제 서버에서 받아온 데이터 
respons -> 첫번째, data를 보기전에, respons 를 통해서, 어떤값인지 확인 하려는 값


---

# 17-11-16  필기

선생님은, dataTask 의 error = error 을 맨위에 놓고 처리해줌. 

statuscode 를 설정해주기 위해서,  

```

// 성공 했을 경우 
if (response as! HTTPURLResponse).statusCode / 100 == 1 {

  }이런식으로 처리함. 
```

typealias Metwprlcp,[;ectopm 


타입을 정해주지 않으면 www form 인코딩 타입 









