

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

