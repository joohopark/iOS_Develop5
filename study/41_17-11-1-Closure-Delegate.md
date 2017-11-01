# 41_17-11-1

---

## Closuer, Delegate 

---


맨처음의 ViewController에서 didseleted의 closure를 실행하면 -> didSelected -> btnactionViewClosure 에 -> btnAction 의 순서대로 실행이됩니다. 

이번 시간에 조금더 확인 해봐야하는게, Delegate, closure를 사용하는것에 대해서 조금더 고민해보고 사용해야 될것 같다.


---

스토리보드로 만들어진것을, 다른 뷰컨트롤러에서 사용할때, 코드로 var 사용해서 만들지 말고, IBOutl 을 사용해서 연결해서 사용해주어야 한다. `코드로 만들때와`, `스토리 보드로` 만들때의 인스턴스가 서로 다르다 