# 43-17-11-7

---

## 기기 테스트(app 개발자 등록), MapKit

---

## 기기 테스트

[app 개발자 등록하는방법](http://tech.whatap.io/2016/04/27/apple-개발자-계정-등록하기/)<br>
[App Distribution Guide](https://developer.apple.com/library/content/documentation/IDEs/Conceptual/AppDistributionGuide/Introduction/Introduction.html)<br>
[IOS 인증서 만들기](http://comxp.tistory.com/298)


Developer Center 

- cetification
- AppID-bundleID
- Device ID - UUID(uniqueq ID)

위의 3개를 합쳐서 Provisioning 을 만듬 
uuid 는 하나가 아니라 uuids임.

- app store 에 올리는 방법은 2가지 <br>
	- 하나는 xCode를 통해서 <br>
	- 하나는 app load를 통해서 올려야함 <br>

> Xcode Project를 올릴때는 압축파일로 올려야합니다.


---


## MapKit

mapView를 올렸는데, mapKit을 import 하지않으면 크러쉬임


Region -> mapkit 의 보여주는곳

latitude, longitude 을 가지고 -> Location Coordinate 을 구할수 있음

Span : zoom Scale : Span은 cale 거리임. 

1Degree -> 111km * 111km 가 보임.


Annotation -> pi