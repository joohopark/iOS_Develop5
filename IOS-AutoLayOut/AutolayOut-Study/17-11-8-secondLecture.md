# 17-11-8

---

# 목차

1. StackView
2. Rotate
3. Dynamic_Text
4. Graph_AutoLayout_Code
5. AutoLayout_Animate

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
