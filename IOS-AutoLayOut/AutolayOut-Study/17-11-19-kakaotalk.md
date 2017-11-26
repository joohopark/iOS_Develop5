# 17-11-19 

---

## kakaoTalk Chat UI 만들기

![screen](/study/image/kakaoUI.png)

구현하기 위해서 필요한 요소들

1. 입력되는 Text에 대한 UI AutolayOut 설정
2. 텍스트 길이에 따라서, 디바이스 크기에 따라서 유동적으로 변경되는 Text line 만들기

---

## inputText Cell 만들기

| 내가 작성한 chat Cell Nib 파일| 상대방 Chat Cell Nib 파일|
| :---: | :---: |
| ![screen](/study/image/kakaoUI-1.png) | ![screen](/study/image/kakaoUI-2.png)|


```swift

내가 작성한 chatCell 구조

|--imageView
|--Label
|--Label

각각 정렬, 제약 조건을 통해서 AutoLayout을 지정했습니다.


```
#### - Stretching 이용해서 image 크기 조절

Streching은 이미지가 커질때 어느부분이 늘어나고, 줄어들수 있게 설정할수 있습니다.
`Attribute inspect` 부분에서 `Stretching` 에서 조절할수 있습니다. <br>

| * | x | y | width | height |
|:--:|:--:|:--:|:--:|:--:|
| 기본값 | 0 | 0 | 1 | 1 |
| 설정값 | 0.5 | 0.5 | 0 | 0 |

> 값의 범위는 0~1 까지 입니다. 
> 
> x, y 는 이미지가 늘어났을대 조건을 지정해주는 `시작위치` 가 됩니다. width, height 는 x,y 로 지정 한 `시작위치`에서 width,height 로 설정한 범위 만큼 적용 Stretching 이 적용 됩니다.
> 
> label, imageView의 hugging priority, Constrains 를 설정하여 Autolayout을 설정합니다. 

---

## text 작성 update 설정

```swift



import UIKit

class MainViewController: UIViewController {
  UILabel
  @IBOutlet private weak var tableView: UITableView!
  @IBOutlet private weak var inputviewBottomMargin: NSLayoutConstraint!
  @IBOutlet private weak var inputTextView: UITextView!
  @IBOutlet private weak var inputContainerView: UIView!
  @IBOutlet private weak var inputDoneBtn: UIButton!
  @IBOutlet private weak var inputTextViewHeight: NSLayoutConstraint!
  var chatData: NSMutableArray = ["hi!", "반가워요!"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    UILabel
    inputTextView.delegate = self
    inputContainerView.backgroundColor = UIColor(red:0.80,
                                                 green:0.82,
                                                 blue:0.84,
                                                 alpha:1.00)
    inputDoneBtn.backgroundColor = UIColor(red:0.98,
                                           green:0.93,
                                           blue:0.33,
                                           alpha:1.00)
    tableView.rowHeight = UITableViewAutomaticDimension
    //Nib 파일로 Cell 을 만들경우, 이렇게 등록을 해주어야함.
    tableView.register(UINib(nibName: "MyBubbleCell", bundle: nil),
                       forCellReuseIdentifier: "MyCell")
    
    tableView.register(UINib(nibName: "YourBubbleCell", bundle: nil),
                       forCellReuseIdentifier: "YourCell")
    
    // 키보드 Notification
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(self.keyboardWillShow(noti:)) ,
                                           name: NSNotification.Name.UIKeyboardWillShow,
                                           object: nil)
    
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(self.keyboardWillHide(noti:)) ,
                                           name: NSNotification.Name.UIKeyboardWillHide,
                                           object: nil)
  }
  
  @objc private func keyboardWillShow(noti: NSNotification) {
    // userInfo 값을 가져옴
    guard let notiInfo = noti.userInfo as NSDictionary? else {return}
    //let notiInfo = noti.userInfo //as! NSDictionary
    // keyboardfrema 값을 가져온후, CGRect값으로 변경함
    
    let keyboardFrema = notiInfo[UIKeyboardFrameEndUserInfoKey] as! CGRect
    let height = keyboardFrema.size.height
    self.inputviewBottomMargin.constant = -height
    let keyboardDuration = notiInfo[UIKeyboardAnimationDurationUserInfoKey] as! TimeInterval
    UIView.animate(withDuration: keyboardDuration) {
      // animation, frema 을 실시간으로 적용할때 무조건 필요함
      self.view.layoutIfNeeded()
    }
  }
  
  @objc private func keyboardWillHide(noti: NSNotification){
    guard let notiInfo = noti.userInfo as NSDictionary? else {return}
    
    let keyboardDuration = notiInfo[UIKeyboardAnimationDurationUserInfoKey] as! TimeInterval
    UIView.animate(withDuration: keyboardDuration) {
      self.view.layoutIfNeeded()
      self.inputviewBottomMargin.constant = 0
    }
  }
  
  @IBAction func testInputDone(_ sender: UIButton) {
    if inputTextView.text.isEmpty != true {
      chatData.add(inputTextView.text)
      inputTextView.text = ""
      self.tableView.reloadData()
      let lastIndexPath = IndexPath(row: self.chatData.count-1, section: 0)
      
      //layout 이 잘 안가는경우에, 아래의 녀석을 호출하고 이동시켜보자.
      self.view.layoutIfNeeded()
      //원하는 tableView의 low로 이동하는
      tableView.scrollToRow(at: lastIndexPath, at: UITableViewScrollPosition.bottom, animated: false)
      
    }
    //같은 함수 한번더 호출해서 해결
    textViewDidChange(inputTextView)
    
    
    
  }
  
}

extension MainViewController: UITableViewDelegate,UITableViewDataSource {
  internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    self.view.endEditing(true)
    let testOffset = """
    self.tableView.contentOffset : \(self.tableView.contentOffset)
    self.view.frame.origin.y : \(self.view.frame.origin.y)
    self.view.bounds.origin.y : \(self.view.bounds.origin.y)
    """
    print(testOffset)
    
  }
  internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.chatData.count
  }
  
  internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let defaultCell: UITableViewCell
    if indexPath.row % 2 == 0 {
      let myCell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyBubbleCell
      myCell.myTextBubble.text = self.chatData[indexPath.row] as? String
      defaultCell = myCell
    }else {
      let yourCell = tableView.dequeueReusableCell(withIdentifier: "YourCell", for: indexPath) as! YourBubbleCell
      yourCell.yourTextBubble.text = self.chatData[indexPath.row] as? String
      defaultCell = yourCell
    }
    // 셀 선택되었을때, 나타나는 녀석..
    defaultCell.selectionStyle = UITableViewCellSelectionStyle.none
    return defaultCell
  }
  
  internal func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableViewAutomaticDimension
  }
}

extension MainViewController: UITextViewDelegate {
  
  // textView에 글자를 작성할때마다 호출되는 녀석
  func textViewDidChange(_ textView: UITextView) {
    print("같은 함수 한번더 호출")
    if textView.contentSize.height <= 83 {
      inputTextViewHeight.constant = textView.contentSize.height
      textView.setContentOffset(CGPoint.zero, animated: true)
    }
  }
}
```

> textField 가 아닌 TextView를 통해서 구현했습니다. keyboard 에 대한 처리는 NotificationCenter 을 통해서 keyboardFrema 만큼, 더해주고, 빼준값을 Constraints 에 연산하여 히결 했습니다.
> 
> TextView의 Delegate 를 통해서, textView의 size로 조절하였습니다. 최대 높이는, 4줄 작성했을때 입니다. 
> 
> Cell 을 선택하게되었을때, keyboard를 내리는 방법은 `self.view.endEditing(true)` 을 통해서 구현 했습니다 textLB 크기에 따라서, image 를 유동적으로 만들어 주기 위해서 hugging priority 를 사용했습니다.
> 
> tableView의 구분은 TableView의 Separator 속성을 None으로 만들어 주었습니다.
> 
> keyboard가 올라올때 inputView의 자연스러운 에니메이션 처리를 위해서, keyboardDuration 값을 받아서, 그 시간을 animation을 주었습니다.
> 
> 

---

