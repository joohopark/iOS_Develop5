# 50_17-11-17

---

## 필기





[Fast Sever Documents](https://lhy.kr/FastCampus-iOS-API-Server/#post-list)

baseURL = http://api-ios-dev.ap-northeast-2.elasticbeanstalk.com/api
+
URL: /POST/

Header -> 

Login 해서 token 만 받아놓자.

Header -> Head, body 에 따라서 데이터를 보내주는데, Head 를 읽고, body에 어떤 내용이 있는지에 따라서 값을 긁어 옴. 이때 같은 해더에, method 가 어떤 것인지에 따라서 사용되어지는 로직이 다름.

network할때, resume, 랑 url 확인을 잘 해주어야 할것 같음.

- encoding -> class 의 모든 형태를 바로바로 데이터로 바꾸어줌 
 -> decoding 까지 했으니까, 
- decoding -> 

---

## Multipart/formed-data type

image Content disposition, ty

name = "" -> key값?

filename = "" -> 내가 저장하려고 하는 이름 


앤터 간격으로 

---


URLSession -> 서버랑 직접 통신하는 -> Session이 task 를 돌릴떄 url을 가지고 하는데, Request 
URLReguest -> 통신할 대상이 request, URL 
   	-> Request 는 크게 header,body 로 나눌수 있다.
   	header -> 요청할때 필요한 파라미터를 넣고 -> Method -> get,post
   	                                  -> multipartform 은 ContentsType 
   	                                                      -> ContentsType Json 
   	body 는 내가 요청한 데이터가 들어가 있음.
URL
URLSessionTask -> 통신할 행위가 Task 

-> 코드랑 개념은 반대..? 




URLSessionConfigration -> URLSession 설정 부분 

