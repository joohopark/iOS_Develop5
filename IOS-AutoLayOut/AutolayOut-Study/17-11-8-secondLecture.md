# 17-11-8

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

|--view
|----imageView
|----image

image를 View속에다가 가두어 놓고 autoLayout을 통해서 사용함..
비율이 흐트러지지 않게 같은걸로 나타나게 하는것은 `Aspect Fit` 보이는것은 원래 크기로 보여지는데, View의 크기는 픽셀 크기로 보이게됨.. 
디바이스에 딱 보여지는 크기로 만들어 주기 위해서는 이미지의 픽셀 크기를 비율로서 지정 해주면됨.


이미지를 보여지는 크기대로, 디바이스에 보여지게 하기 위해서 

View속에 imageView를 넣고, 좌,우 constraint값을 주고, 위 아래값을 비율로 정의 해주었다. `Aspect Fit` 을 같이 사용함

이미지의 비율대로 높이가 지정이 됬당.. 

이미지에 따라서 동적인 텍스트를 만들기 위해서, 디바이스의 사이즈를 가장큰 사이즈로 맞추어 놓고 사용하는게 좋습니다. 이유는..?

텍스트의 위치가 맞지 않음.. 정렬할 이미지와, 레이블을 선택하고

비율로 이미지를 정렬하면, 디바이스 사이즈에 따라서 이미지의 크기가 달라져도, 정렬 위치는 고정하게 됩니다. 

텍스트 크기도 이미지가 작아지면, 텍스트도 비율로 작아지게 해야함.

Label 에 Autoshirnk 라는 부분이 있음 -> Minimum Font Scale -> 레이블 사이즈가 작아질수록, 레이블속의 textFont가 작아질수있음..이미지의 크기에 따라서, label의 넓이를 줄이게되면, 텍스트도 중러들수 있게됨.

label의 autoLayout의 필요없는 좌우, 부분을 삭제후 -> 센터정렬을 하면, 디바이스의 사이즈가 작아져도, 텍스트의 배치, 사이즈에 따라서 마추어서 비율이 변하게됨. 이때 사이즈에 따른 정렬을 하기위해서, 가장큰 디바이스 사이즈애서 작업을 해준다.

정확한 위치 지정이 아니라. 정렬을 해야함.


---

## Dynamic_Text 2 

여러줄의 텍스트를 작업할때 발생하는 문제를, 하나의 Label로 처리함

label의 text의 멀티플라이어를 바꾸어서 위치를 바꾸어주려고할때, top의 멀티플라이어로 지정하려고할때, 아래위치로 내리기가 안됨(그래서 bottom) 으로 잡아 주어야함.

텍스트의 사이즈가 비율에 따라서 줄어들때, 다음줄로 넘어갈수 있을때, 넘어가는것을 우선으로함.


따라서, 라인수를 맞추어 주어야함.

위와같은 형태로 autoLayout을 작업하게되면, 디바이스 사이즈에 따라서 편하게 사용할수 있다.

---

## Graph_AutoLayout_Code(멋지게 그래프를 표현하는 방법과 애니메이션)


실제 존재하는 app의 화면설계는 어떻게 할까?

고민해야하는 부분은, 넓이는 같고, 높이는 퍼센트에 따라서 다르다.



|--View
|----view 6개 

부모뷰 클릭후, 부모뷰 영역이 나오면, 드레그를 하게되면 영역들을 선택할수 있다.

높이를 그래프의 크기 영역 만큼 잡는다..?

View속에 있는 그래프들 


그래프속에 autoLay을 가지고, 동적인 값을 적용할수 있습니다. 


```swift
extension NSLayoutConstraint {
    func changeMultiplier(changeMultiplier: CGFloat) {
        
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
    }
```

---

## 2_Graph_AutoLayout_Code(멋지게 그래프를 표현하는 방법과 애니메이션)

사용자한테 입력한 값을 받은 값에 따라서 그래프를 동적으로 움직여주어야함.

grahp의 constant 값을 IBOutlet을 받아서 사용할때, constant,Priority 는 값을 바로 적용해서 사용할수 있지만, 멀티플라이어 값은 바로 받아서 사용할수 없다.

그래서 그 값을 사용할수 있게 만들어 주려고함.

함수를 사용할때, return 값을 설정하지 않고 사용함. 이유는, NSLayout를 다시 적용해서 사용할것이라서. 

**어떤 문법에 대해서 설명하는 강의..?** 이거 한번 찾아봐야겠내

---

## 3_AutoLayout_Animate 적용 방법

코드를 재사용하는 경우 에러가 나옴.. 왜그러는지..? 설명해줌.. 

기본적으로 설정 해놓은 constraints 값을 주면, 기본적을 Priority 값이 기본적으로 1000으로 적용 되어 있음.. 그래서 constraint가 두번 적용되어서 어떤값을 적용해야 할지 몰라서 오류가 나는것임. 

최초의 값이 deactevate 되어 있음. 그래서 추가되는 값들중 하나만 사용하겠다는 이야기..

그것을 해결하기 위해서, 원래 extention 해둔 곳에 return newconstraint 를 해서, 그 값을 받아서 변경 시켜서 사용해줌.

중요한것은 `layoutIFNeeded()` 를 적용하라는 이야기임.. View에 어떤 변경 값이 들어 오게 되면, 그 값을 바로바로 적용 해주라는 코드 임..!

---

## 


















