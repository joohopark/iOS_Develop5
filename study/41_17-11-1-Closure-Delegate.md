# 41_17-11-1

---

## Closuer, Delegate 

---


맨처음의 ViewController에서 didseleted의 closure를 실행하면 -> didSelected -> btnactionViewClosure 에 -> btnAction 의 순서대로 실행이됩니다. 

이번 시간에 조금더 확인 해봐야하는게, Delegate, closure를 사용하는것에 대해서 조금더 고민해보고 사용해야 될것 같다.


---

스토리보드로 만들어진것을, 다른 뷰컨트롤러에서 사용할때, 코드로 var 사용해서 만들지 말고, IBOutl 을 사용해서 연결해서 사용해주어야 한다. `코드로 만들때와`, `스토리 보드로` 만들때의 인스턴스가 서로 다르다 


closure -> map, filter, reduce 

--- 

옵져버 패턴이라는게 나오는게, 사람들의 반응형이라는것에 대한 열망이 있기때문에 패러다임이 변하게 된것임...

함수형 패러다임은 예전부터 나왔던 이야기임.. 근데 RXswift를 통해서 구현이된것임.

RXSwift는 사용자의 인터렉션을 바로바로 사용자에게 보여줄수 있는 장점이 있다. 


---

VC -> customView 에게 closure 를 넘겨줌. -> customView 가 button이 실행되는 시점을 알고 있음. 그래서 vc 에서 받은 view를 -> view에서 vc에게 받은 closure를 실행 시켜서 어떤 액션을 취할수 있게 만들어 주면된다. 

내일 미니 해커톤 

DISC 