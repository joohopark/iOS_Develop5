# 17-11-18

---

## firebase

---

- 다양한 플랫폼과 기기에서 어플리케이션 데이타를 실시간 동기화를 지원 -> 인터넷 동기화 과정에서 실시간으로 확인 가능.

인터넷 화면에 뿌려주는 원리가, 카카오톡의 사용자가 채팅을 읽었을때 1 이 사라지는 과정이 사실은, 로컬의 데이터에 저장되어 잇다가, 인터넷이 연결되게되면, 인터넷연결된것을 확인후, 데이터를 실시간으로 동기화 해주는 작업..? 

인증과정을 해야할떄 `Authentication`은 따로 서버를 만들어 놓아야함. 
 -> ID,Pw 를 등록을 하면, OK, 이때, ID, 비밀번호를 항상 묻던지, 아니면 항상 저장 하던지 해야함   
 리스, 회원정보, 갱신ㅇ을 요청할때, 예전에는 아이디, 패스워드를 계속 요청을 해야함. 만약, 토큰 하나로 처리를 하게 된다면, 
 아이디 패스워드가 유실이 됬을때, 서버에서는 알수 없음 예전에는, 하지만 토큰에는 유효기간이 있음. 유효기간이 끝났을때, 토큰에 대한 재인증이 필요함. 
 
 id, pass word -> DB -> Auth 
               <-      <-
               
회원가입을 하게되면, DB에 id, pasword 에 저장을 하고 토큰을 Auth 에서 발행을 하고, 
요청을할때 cilent 단에서 -> Auth -> DB 순으로 요청을함.  
만약. Client -> DB -> <- Auth  방식으로 하게 되면 잘못된 서버임 -> 분리 해놓은 의미가 없는 것.

`리버스 엔지니어링,`
https 를 사용하게되면, GET, POST 를 하게되면, 요청을 보낼때 한번 암호화를 함.
local 에는 아이디만 저장, 패스워드는 

우리가 알게모르게, 디도스 공격이 많음..

`블루투스` 한번 해보자 
                                            

---

## firebase 

Analytics 등 지원 -> 함.. 

구글에서도 firebase Analytics지원함...? 구글 analytics, firebase Analytics ㄹ는 서로 다른거같음. 

여러 사용자에게 서로 다른 데이터를 제공해주어야 할때, 상당히 힘듬.. 그것들이 firebase 에 realtime Database 에서 제공해줌..


기존의 일반 데이터 베이스는 요청 -> 응답 인데, realtime Database 는 SDK 만으로 직접 데이터베이스에 접근해서, 그런 개발단계에서 요청을 지속적으로 하면, 서버에 요청을 지속적으로 하게되면

- realtime Database 는, SDK 만으로 직접적으로 데이터 베이스에 접근해서 realtime 

FCM(firebase Cloud Messagin) -> 가장 많이 사용함. 

---

## firebase 

Auth 부분에서 Custom 은 한번 해보는것을 추천함.

질문을 5개 정도 할수 있음. 


RDB 데이터는, 인서트를 하고 난이후에, 인서트 됫다고 반응으로 오지 않음. 
RDB 표 형식 A B C D E 
          data1 data2 data3..
          
         
         
디폴트로 지역은 미국으로 함
---


add 가 되었을때 이벤트를 받는 부분과, 값이 변경이 되었을때 이벤트를 받겟다고 생각함, 노드 삭제 되었을때 이벤트를 받는다는 부분 설정 
추가, 삭제, 셀렉트, 

기본적으로 firebase는 objective-c 임. 그래서 dump 를 해보면, NSDic... 라고 나옴. 이렇게 나오는 이유는 SDK 가 objective-c 라서 그런것임. 

내 핸드폰에 오프라인 데이터를 저장해놓고, 인터넷이 연결되면, 실시간으로 snyc 작업 해줌

---

버전 체크같은 경우에는 singele 데이터로 함

프로그래밍을 할때는, 대문자는 비추하는데, 
데이터베이스를 만들떄는 대문자를 사용하지 않고, 언더바 사용함.

store SDK 를 넣어야함.


요즘에 트랜디하니까 지원한다. 라고 생각하면 다 떨어짐, 본인이 하고싶은게 명확한 사람을 뽑는편....? 하고싶은게 있어서 이것저것 준비하고 가는것은 추천하는데, 
teck blog 하시는분한테, 이력서 메일 보내보는것도 좋은 케이스임...?

이런 teck, 이런 서비스에 관심이 있다고 생각하면, 메일 보내볼꺼같음..!? 

CTO 한테 메일 보내보는것도 나쁘지 않는것같다...? 

그러면 지금 부터라도, github blog 에 글들

linked in 이력서를 보내본다던지...? 
본인이 하고싶은것에 대한 이유를 명확하게 잡아놓아야함...

소프트웨어가 미국에서 시작 되어서, 캐나다에서 일해볼꺼같음..