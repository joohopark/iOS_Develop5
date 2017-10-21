# 32_17-10-20

---


## TableView 

storyBoard 로도 identifier 를 등록해서 만들어 주는 방법을 한번 찾아보자.

**show**, : navi -> show -> push 
				  viewController -> 강제로 모달리 시키는것임.
				  
				  **show, modal**의 차이를 알아놓고 정리하자.
				  
				  
**modalry**, 를 하는 이유가 show 는 쌓이는것이고, modalry 는 현재 stack밖으로 벗어난다고 생각하자..

- 싱글턴 패턴을 사용할때, struct, class 로 만들어서 사용할떄 차이점은, 데이터를 관리할떄 callbyValue, callbyReference 의 차이를 생각하자 

---

cell에서 view를 사용할때 

self.view.addsubView 말고

self.contentsView.addsubView에 올려야 한다. 

tablewView



---

## 해야 하는것



1. singlerton 사용해서, 인풋텍스트값을 Plist에 저장해서, 다시 load할때 Plist를 생성하고 불러온다. 

2. 테이블뷰 여러가지 형식으로 만들어서 오자(숙제!)



## 10-20 필기

- 테이블뷰의 각셀의 정보를 sender 로 받았을때 다음 뷰컨트롤러로 넘어갈때, sender의 정보를 다음 viewContoller로 넘기는 방법 다시한번 정리하자..!





---

## 옥경님 webView 

- webView : web을 불러오는 View다..? 
- 웹뷰인지 확인하는 방법은 핸드폰에서, 터치를 했을때, 반응이 없을때는 일반 native View이고, 반응이 있으면, webView인것임...! 

- information hieding 하기위해서, webView로 만들어도 괜찮을거 같음..!
- 이 페이지만 확인하면 끝이지만, 웹뷰.....! 

- 반응형 vs 반응형이 아닌것은 화면을 줄이면, 이미지들이 변하지 않음.

---

로그인 유무에 따라서

---


UI 를 돌려서 cell 이 재사용된다고 생각하지 말고, data 자체를 던져주면서, 총 16개의 버튼이 있을때, 1번 버튼의 값이 false가 될때, 그 다음 재사용 될 cell의 값을 변경 해주게 되면, 지속적으로 사용할수 있다.

---

## 테이블뷰 해더뷰 만들기.