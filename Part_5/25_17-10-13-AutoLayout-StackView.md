# 25_10-10

---

## autoLayout, StackView
 
## Refrence : [AutoLayOut PDF](/study/image/AutoLayOut.pdf)

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
## StackView


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

## ScrollView Storyboard 로 만들기

컨텐츠 뷰는 autolayout 으로 잡아주는게 불가능 하기 때문에, rootView랑  높이를 같게 만든다. 

- 내부의 컨텐츠뷰 사이즈를 결정하는 것은 
	- 내부의 콘텐츠의 사이즈에 따라서 변하게 하던가
	- 고정된 픽스값을 주어서 그 값으로 고정 시키느냐.. 둘중 하나로 정할수 있다. 
- 컨텐츠 뷰의 제약을 주면, 그 제약은 내부 `셋`값이다..? 이게 무슨 이야기일까 한번 확인 해보자

| UIHierachy  | Hierachy | 
| :------------ | -----------: | 
| ![screensh](/study/image/Autolayout-1.jpg) | ![screensh](/study/image/Autolayout-2.jpg) |


> Storyboard 로 SscrollView 를 만들때, 계층 구조를 보면, <br>
> 
> |-- ScrollView  <br>
> |------View(이름을 컨텐츠 뷰로 바꿈..) <br>
> |----------StackView<br>
> |--------------View<br>
> |--------------View<br>
> |--------------View<br>
> 
> 사실상 ScrollView 바로 위에 있는 View가 ContentsView의 역활을 수행한다..! 

---

## 정리


![screen](/study/image/AutoLayOut.jpg)

> 왼쪽부터 1~6번까지, AutoLayOut 
> 
> 1번은 비율로 뷰의 크기를 결정
> 
> 2번은 크기와, 가운데에 고정해서 AutoLayOut
> 
> 3번은 stackView를 사용해서, 만들었다. stackView 사용 하는 방법을 찾아가보자.
> 
> 4번은 가운데를 기준으로 3등분 되는 지점을 기준 으로 만들었다.
> 
> 5번은 3번의 스텍뷰로 만들기 전에, autuLayOut 를 사용해서 만들었다.
> 
 
---
