# 17-11-19 

---

## Kakao_intro

채팅창 구현하기 -> 채팅창의 요소는 TableView로 구현한다..?

TableViewCell 을 Xib 파일을 통해서 만듬.. 
형태는 그대로 고정된 상태에서, 내부의 LB의 값이 늘어나면, 그거에 마추어서 늘어나개..?하려면 `Streching`

x = 0 -> 0.3-> 30% x축으로 30% 간만큼..?
y = 0

> x,y 값 0, 0 은 시작점.

witdh = 1 : 늘어날 범위, 원래 크기의 그대로 이미지의 비율만큼만 늘리겠다 라는 의미..
height = 0

0.5 0.5 
0   0    으로 셋팅하면, 가운데 풍선 크기만 늘어나게됨.

---

textLB 크기에 따라서, image, 크기를 주고 싶을떄, hugging 를 사용함.

## kakao-3mybubble 

제약조건 주는 방법이 조금 다릅니다. 이미지,레이블들을 각각 연동시켜서 constrains 주는 방법을 한번 확인해보자

tableView의 Separator 을 none으로 만들면, cell의 구분선이 없어지게 됩니다.

---

## kakao-4yourBubble 

label 길이에 따라서 이미지가 늘어나는 streching? 한번 다시 정리하자 

---

## ComplexCell 

인풋값에 따라서 상대방의 cell, 혹은 나의 cell을 나오게 하는 방법..
indexpath.row 의 홀,짝수에 따라서 만듬..

---

## CellFinish

profile image 동그랗게 layer.conerRadius

my,your Cell을 구성함.

---

## kakako-7 inputview1

구조 
--View
----button
----TextView

textView의 입력되는 글자에 따라서, textView의 높이가 달라지게 설계함.

button속의 text가 너무 딱 붙어 있는것 같을때 inset을 사용해서 내부 간격을 넓혀줌.


키보드가 올라올때, 키보드위에 같이 올라오고, 내려갈때 같이 내려가는 부분을 정의해주고 만들어보자

textInPutView의 위치가 올라가는 것으로 만들어 주기로함.

```swift

// 키보드 Notification
    NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(noti:)) , name: NSNotification.Name.UIKeyboardWillShow, object: nil)
    
    NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(noti:)) , name: NSNotification.Name.UIKeyboardWillHide, object: nil)
  }
  
  @objc func keyboardWillShow(noti: NSNotification) {
    // userInfo 값을 가져옴
    let notiInfo = noti.userInfo as! NSDictionary
    // keyboardfrema 값을 가져온후, CGRect값으로 변경함
    let keyboardFrema = notiInfo[UIKeyboardFrameEndUserInfoKey] as! CGRect
    let height = keyboardFrema.size.height
    print(keyboardFrema,height)
    
    inputviewBottomMargin.constant = -height
  }
  
  @objc func keyboardWillHide(noti: NSNotification){
    
  }



```

> 위의 방법으로 만들어 놓으면 키보드가 올라오기전에, 인풋뷰가 미리 올라가 있어서 자연스럽지 않은 모습으로 올라오게됨. 그 방법을 해결하기위해서, Animation으로 시간 차를 줌
> 

// 테이블뷰의 본문을 눌렀을때, keyboard가 내려가게 만들기 위해서, 하는 설정

```swift


```

---

## inputTextView3

필요한것<br>

1. 텍스트 입력시 마지막 줄로 가게하는것


---

## kakako



































