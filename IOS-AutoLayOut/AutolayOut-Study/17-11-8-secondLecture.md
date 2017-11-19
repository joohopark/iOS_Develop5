# 17-11-8

---

# 목차

1. StackView
2. Rotate
3. Dynamic_Text
4. Graph_AutoLayout_Code
5. AutoLayout_Animate
6. popup View 
7. TableView-Expand
8. TableView-Dynamic-Cell

---

# Calc_1_StackView

계산기를 StackView로 만들기 

상황에 따라서 크기가 변하는거라면, Priority 값을 주어야 하지만, 그렇지 않은 경우는 Priority 값을 주지 않아도 됩니다.

stackView로 묶어놓으면, witdh 를 잡을때, 멀리플라이어로 잡아주고, height 를 잡아줄때는 `Aspect Ratio` 로 잡아주면 편하게 잡아줄수 있음..!

StakcView는 4개의 버튼이 있어도, 한개의 높이만 지정해주면 모두 같이 높이가 늘어나기때문에, StackView안에 있는 한개의 button의 높이를 Aspect Ratio 로 잡아주게되면, 편하게 사용할수 있다.

| StackView | Aspect Ratio |
| :---: | :---: |
| ![screen](/study/image/StackView.jpg) | ![screen](/study/image/StackView-1.jpg)] |

> Aspect Ratio 는, 그냥 선택하면 바로 변하지 않고, 일단 Aspect Ratio 추가후, 따로 Multiplier 를 조정해서 설정해주어야 합니다..!
> 
> 일반적으로, 위치나 크기가 균등하다면 StackView가 편하다..! 

---

# Calc_2_rotate

| portrait | LandScape | 
| :---: | :---: 
| ![screen](/study/image/rotate.png) | ![screen](/study/image/rotate-1.png)|

portrait, LandScape 에서 보여지는 부분이 서로 다를때 사용하는 방법 

1. `vary for traits` 에서 LandScape 만 적용될때를 찾는다
2. LandScape 만 적용되었을때 autoLayOut을 다듬어주고, 새롭게 만들어질 아이템들의 autoLayout을 설정합니다.
3. `vary for traits` 설정을 done 하고, `Portrait` 부분으로 돌아갑니다. 

![screen](/study/image/rotate-2.png)

> installed 부분을 + 하고, 아래의 installed 부분을 체크를 풀어줍니다. 이렇게 적용하게되면, LandScape 일때 사용되는 아이템과, Portarait 일때 사용되는 아이템을 다르게 적용 해줄수 있습니다.


상황에 따라서 `instalied` 하여 portarit, landScape 일때 화면 구성을 다르게 해줄수 있습니다.

---

## Dynamic_Text

|--view <br>
|----imageView <br>
|----image <br>

> 이미지속에 작성될 텍스트를, image의 크기에 따라서 동적으로 변경되게 적용 하려고 합니다..!
>
> View, Imageview에 autoLayout을 적용해서, 모든 디바이스에 원하는 형태로 대응할수 있게 만들어 줍니다. <br>

|--View <br>
|----ImageView를 넣어줍니다.  <br>
 
| * | Aspect Fit |  
| :---: | :---: | 
|  ![screen](/study/image/Dynamic_Text.png) |  ![screen](/study/image/Dynamic_Text-1.png)|

  
 - View의 Constraints 는, 좌,우 20, 센터 정렬을 해줍니다(top,bottom 은 지정하지않습니다) <br>
 - imageView의 Constraints 응 상,하,좌,우 0 으로 빽빽하게 적용 하고 image를 넣어줍니다. <br>

> 이렇게 적용하게 되면 image의 pixels 크기로 imageView가 사이즈를 자동으로 변경하게 됩니다. 이때 `Aspect Fit` 을 해주게되면, 보여지는 image는 device 사이즈의 가운데로 오지만, imageView의 CGSize 는 image의 원본 사이즈를 유지하게 됩니다.  
> 


| imagePixeld | Aspect Ratio | multiplier | imageView 사이즈 확인|
| :---: | :---: | :---: | :---: | 
|  ![screen](/study/image/Dynamic_Text-2.png) |  ![screen](/study/image/Dynamic_Text-3.png)|   ![screen](/study/image/Dynamic_Text-4.png) |  ![screen](/study/image/Dynamic_Text-5.png)| 
 
- 디바이스에 보여지는 크기로 만들어 주기 위해서는 이미지의 픽셀 크기를 비율로 imageView의 사이즈를 정의해주면, 디바이스에 보여지는 사이즈의 비율로, 이미지의 비율을 유지할수 있습니다.

> 이미지에 label을 넣어서, 그 레이블과 이미지의 사이즈, 디바이스 변화에 따라서 레이블의 font 값, 위치를 변경하기 위해서 정렬과 멀티 플라이어를 사용해줍니다..
> 

| imageView와 Label선택후, 정렬 지정 | bottom Multiplier 변경 | 확인 | 
| :---: | :---: | :---: | 
|  ![screen](/study/image/Dynamic_Text-6.png) |  ![screen](/study/image/Dynamic_Text-7.png)|   ![screen](/study/image/Dynamic_Text-8.png) |  

> 디바이스 사이즈에 따라서 label의 위치는 고정되어 있습니다. 하지만 Label의 Font size는 초기에 설정한 크기가 그대로 고정 되어 있어서, 아직 완벽하게 동기화 된것은 아닙니다.
> 

| superView 와 Aspect Ratio 선택  | autoshrink -> Minimum Font Scale | 텍스트 Line 가 1이상인경우 |  목적 |
| :---: | :---: | :---: | :---: | 
|  ![screen](/study/image/Dynamic_Text-9.png) |  ![screen](/study/image/Dynamic_Text-10.png)|   ![screen](/study/image/Dynamic_Text-11.png) |  ![screen](/study/image/Dynamic_Text-12.png) |  


Label의 Font Size 는 Label의 넓이에 따라서 유동적으로 변하게 해줄수 있습니다. 그렇게 하기 위해서, Label의 Aspect Ratio 를 superView와 같게 설정해줍니다. 이렇게 설정하게 되면, label의 넓이가 디바이스 사이즈에 따라서 비율로 정의되게 됩니다. 비율로 넓이가 결정되면 font Size로 유동적으로 설정 해줄수 있습니다. 

Line이 1 이 아닌 경우에는, 라인을 '0' 으로 지정 하게 되면, Label의 넓이가 변할때, 라인을 넘겨주어서 처리할수 있으면, 라인을 넘겨주어서 처리하는것을 우선으로 실행합니다. 그것을 방지 하기 위해서, 사용하는 라인수를 정확하게 지정해주면, 라인 변경 없이 label의 font 크기가 변경되는것을 확인 할수 있습니다. 

---

## Graph_AutoLayout_Code(멋지게 그래프를 표현하는 방법과 애니메이션)

![scrrn](/study/video-gif/graph.MOV.gif) <br>

|--View <br>
|----view 6개 <br>

View 속에, 그래프로 사용될 View 6개를 만들어 놓고, autoLayout 을 통해서, 그래프의 변경 되는 값을 조정해줍니다.<br>
기본 superview의 autolayout 을 통해서, 위치와 사이즈를 정해줍니다. 그 속에서, 각 그래프의 bottom 을 superView에 고정 해놓고 각 View들의 height 값을 비율로 정의해서 그래프를 정의하는 방법을 사용합니다.

| superView Constraints | 그래프1의 Constraints | 그래프2의 Constraints | 
| :---: | :---: | :---: | 
|  ![screen](/study/image/graph-1.png) |  ![screen](/study/image/graph-2.png)|   ![screen](/study/image/graph-2.png) |  

> 원리는, View의 bottom 을 고정시켜놓고, 그래프의 height값을 input값으로 받아서 변경시켜주면, 유동적은 그래프를 사용할수 있습니다.
> 


```swift


import UIKit

class ViewController: UIViewController {

	 // autoLayout 으로 지정한 height 값을 IBOutlet을 통해서 가져옵니다. 
    @IBOutlet weak var graph1Height: NSLayoutConstraint!
    @IBOutlet weak var graph2Height: NSLayoutConstraint!
    @IBOutlet weak var graph3Height: NSLayoutConstraint!
    @IBOutlet weak var graph4Height: NSLayoutConstraint!
    @IBOutlet weak var graph5Height: NSLayoutConstraint!
    @IBOutlet weak var graph6Height: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
        
    @IBAction func btn1Action(_ sender: UIButton) {
        UIView.animate(withDuration: 3, animations: {
            self.graph1Height = self.graph1Height.changeMultiplier(changeMultiplier: 0.1)
            self.graph2Height = self.graph2Height.changeMultiplier(changeMultiplier: 0.2)
            self.graph3Height = self.graph3Height.changeMultiplier(changeMultiplier: 0.3)
            self.graph4Height = self.graph4Height.changeMultiplier(changeMultiplier: 0.4)
            self.graph5Height = self.graph5Height.changeMultiplier(changeMultiplier: 0.5)
            self.graph6Height = self.graph6Height.changeMultiplier(changeMultiplier: 0.6)
            
            self.view.layoutIfNeeded()
        })
    }
    
    
    @IBAction func btn2Action(_ sender: UIButton) {
        self.graph1Height = self.graph1Height.changeMultiplier(changeMultiplier: 0.6)
        self.graph2Height = self.graph2Height.changeMultiplier(changeMultiplier: 0.5)
        self.graph3Height = self.graph3Height.changeMultiplier(changeMultiplier: 0.4)
        self.graph4Height = self.graph4Height.changeMultiplier(changeMultiplier: 0.3)
        self.graph5Height = self.graph5Height.changeMultiplier(changeMultiplier: 0.2)
        self.graph6Height = self.graph6Height.changeMultiplier(changeMultiplier: 0.1)
        
        UIView.animate(withDuration: 3, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    
    
    
    
}

// NSLayout의 multiplier 를 코드로 바로 적용하려고 하면, 적용이 되지 않습니다. 그래서 원래의 Constraints 값을 비활성화후, 새롭게 Constraints 값을 생성후, 새로 적용된 값을 Constraints에 적용 시켜서 사용합니다..!
extension NSLayoutConstraint {
    func changeMultiplier(changeMultiplier: CGFloat) -> NSLayoutConstraint {
        
        // 원래 자신의 Constraint 값을 deactivate 하고,
        // 새롭게 Newconstraint 값을 적용한것을, activate 함..
        NSLayoutConstraint.deactivate([self])
        let newConstraint = NSLayoutConstraint(item: self.firstItem,
                                              attribute: firstAttribute,
                                              relatedBy: self.relation,
                                              toItem: self.secondItem,
                                              attribute: self.secondAttribute,
                                              multiplier: changeMultiplier,
                                              constant: self.constant)
        
        // View가 가지고 있는 기본 셋팅값을 사용하겠다는 코드
        newConstraint.priority = self.priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstraint])
        
        return newConstraint
    }
    //NsLayout을 사용하는데, 내가 기본셋팅을 바꾸어서, 원하는 값만 사용하려고함
}
```

> Animate 적용시 `self.view.layoutIfNeeded()` 적용 시켜 주어야, 변경된 Layer 값이 실시간으로 적용이 됩니다..!
> 
> 주의 사항으로는 Constraints 값을 두번 정의하게되면, 오류가 나게 됩니다. 이유는 Constraints 값이 두번 적용이 되고, Priority 값이 기본적으로 1000 이기때문에, 어떤 값을 적용 해야하는데 알수 없어서 나는 오류입니다. 
---

## Popup View 

![screen](/study/image/popup.png)

mainViewController 에서 popup을 다른 Viewcontroller 를 present 하는 형식으로 구현 을 했습니다.

```swift


import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func popupBtn(_ sender: UIButton) {
        
        // `popup`은 storyboard name을 사용하고, withIdentifier 는 ViewController 연결할때, 지정한 identifier 를 사용합니다.
        let popVC: PopupViewController = UIStoryboard(name: "popup", bundle: nil).instantiateViewController(withIdentifier: "popupVC") as! PopupViewController
        
        // View의 background의 투명하게 처리된부분이 아래의 옵션을 통해서 올라와 있는 View 가 보여지게 됨..
        popVC.modalPresentationStyle = .overCurrentContext
        self.present(popVC, animated: false, completion: nil)
    }
}


```

---

## Popup 부분 

![screen](/study/image/popup-1.png)

```swift
import UIKit

class PopupViewController: UIViewController {

    
    @IBOutlet weak var popupViewCenterY: NSLayoutConstraint!
    @IBOutlet weak var imageHeight: NSLayoutConstraint!
    @IBOutlet weak var popupImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()        
    }
        
    override func viewDidLayoutSubviews() {
        let ratio = (self.popupImageView.image?.size.height)! / self.popupImageView.frame.size.height
        let calcHeight = (popupImageView.image?.size.height)! / ratio
        
        imageHeight.constant = calcHeight
        print("viewdidLayoutSubview")
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    

}

- viewdidload > 디스플레이에 보이기 전에 호출됨
- viewdidappear > 디스플레이가 보이고 난 이후에 사용됨
- viewDidLayoutSubviews > 화면(View) 하나하나들이 호출될떄 불림.

```

> View 에 imageView를 올리고 나머지는 autolayout을 통해서 고정 시켜주 었습니다. 흐리게 페이드 되는 부분은, `popVC.modalPresentationStyle = .overCurrentContext ` 이부분을 설정하고, 다음 ViewController 의 rootView의 background 를 디폴츠값으로 변경하면, 그 이전 ViewController가 보이게 됩니다. 
> 



---

## PopupView 간단한 Animate

![screen](/study/video-gif/popup.gif)

```swift


import UIKit

class PopupViewController: UIViewController {

    
    @IBOutlet weak var popupViewCenterY: NSLayoutConstraint!
    @IBOutlet weak var imageHeight: NSLayoutConstraint!
    @IBOutlet weak var popupImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewDidLoad")
        
        // popUpView의 CenterY값을, Screen 에 보여 지기 전에는, 아래로 내려놓고 -> Screen 이 보여지고 난 이후에 원래의 값으로 돌려놓는 형식으로 animate 를 줍니다.
        popupViewCenterY.constant = 1000
        
        
    }

    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
        UIView.animate(withDuration: 1, animations: {
            self.popupViewCenterY.constant = 0
            self.view.layoutIfNeeded()
        }, completion: nil)
        
    }
    
    override func viewDidLayoutSubviews() {
        let ratio = (self.popupImageView.image?.size.height)! / self.popupImageView.frame.size.height
        let calcHeight = (popupImageView.image?.size.height)! / ratio
        
        imageHeight.constant = calcHeight
        print("viewdidLayoutSubview")
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
}

```

>     // popUpView의 CenterY값을, Screen 에 보여 지기 전에는, 아래로 내려놓고 -> Screen 이 보여지고 난 이후에 원래의 값으로 돌려놓는 형식으로 animate 를 줍니다.
> 
> 시점 차이르 이용해서 Animate를 적용 하는것을 확인할수 있습니다.

---

## TableView-Expand

tableView의 Cell의 text 개수에 따라서 유동적으로 cell의 크기를 구성하는 방법..?

StoryBoard 에서 tableView위에 바로 Cell 을 올리게되면 register을 하지 않아도된다. StoryBoard 에서 TableView에 Cell을 올리는 그자체가 register 하는 과정이다.

텍스트의 길이가 다를때, 나의 클릭으로 인해서 텍스트 길이가 늘어나게 하는방법..


- 기본적으로 cell의 높이가 같고, 클릭을 했을떄, cell의 높이가 달라지게 하려면 어떻게 해야할까..?

- 높이를 저장할 변수가 필요함..?

어떤 화면 구성을 바꾸기 위해서는, View,TableView나 화면을 갱신해주는 method가 필요함.

두개의 매서드를 사용해서 구현할수 있음

```swift

        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
//        tableView.reloadData()
```


#### - label의 크기에 따라서 유동적으로 Cell의 높이값을 변하게 하는 방법

```swift


import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let heightArray: NSMutableArray = []
    let textDataArray: NSArray = ["short Text",
                                  "Long Long Long Long Long Long Long Text",
                                  "Very Long Long Long Long Long Long Long Long Long Long Text Very Long text ",
                                  "Very Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Text Very Long text "]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // text의 크기만큼 높이값이 자동으로 계산되어짐.
        tableView.rowHeight = UITableViewAutomaticDimension
        
        for _ in 0...14 {
            heightArray.add(false)
        }
        
        
        
        
    }
    
    // label의 text 줄수만큼, 높이가 가변적으로 변하게됨.
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "expandCell", for: indexPath) as! MyCell
        
        if heightArray[indexPath.row] as! Bool == false {
            cell.myLabel.numberOfLines = 1
        }else {
            cell.myLabel.numberOfLines = 0
        }
        
        cell.myLabel.text = textDataArray[indexPath.row%3] as! String
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.heightArray[indexPath.row] as? Bool == false {
            heightArray.replaceObject(at: indexPath.row, with: true)
        }else {
            heightArray.replaceObject(at: indexPath.row, with: false)
        }
        
        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        //        tableView.reloadData()
    } 
}


class MyCell: UITableViewCell {
    @IBOutlet weak var myLabel: UILabel!
}



```

---

## TableView-Dynamic-Cell

AutoLayout 을, 화면 밖에서 cell을 구성하는 방법, 그렇지 않은 방법을 배워본다..!

tableViewCell 속에서 autoLayout을 구성할때, 모든 label의 값을 지정하고, hugging 변수를 가지고 조정함.

tableView 속에서 Cell의 크기가 고정되어 있다면, LB의 크기에 따라서 줄수가 늘어나야 되는 경우에는, LB의 라인수를 0 으로 지정 해놓으면....LB의 크기에 따라서 늘어남.

tableView의 Row의 높이값은 자동적으로 계산되어서 사용하겠다

table.rowHeight = UITableViewAutomaticDimension

tableView의 estima

```swift
// cell의 높이값을 자동으로 계산 하겠다는 이야기..!
tableView.rowHeight = UITableViewAutomaticDimension

func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    
    return UITableViewAutomaticDimension
  }
```


