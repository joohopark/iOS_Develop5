# 17-11-5
---

## AutolayOut, Constraints, Constraints Multiplier


---

## Constraints

#### - Constraints <br>

객체에 제약조건을 주어서, `device` 의 크기가 변화해도, 정해놓은 제약조건을 값, 비율에 따라서 layout이 유동적으로 변하게 만들어 줄수 있다.

#### - align(정렬) <br> 

정렬은 단일 객체가 선택 되면, X,Y 의 Center 값만 설정 할수 있고, 여러개의 객체를 선택 하면 둘간의 관계에 따라서 정렬을 선택 해줄수 있다.
기본적으로 아이폰의 device 에서 왼쪽에서 오른쪽으로 갈수록 x의 값이 커지게 되고, y값은 위에서 아래로 갈수록 값이 커지게 됩니다.

```swift
item1.atrribute = 비율 * item2.atrribute + 간격 
```

위의 공식을 통해서, 오토레이웃은 감으로 하는게 아니라, 공식으로 할수 있다는것을 생각하면 설계하도록 하자.

---

## Constraints 

| update Frame | Reset to Seggest Constraints & Update Constraints Constants |
| :---: | :---: |
| ![screen](/study/image/constraints.jpg) | ![screen](/study/image/constraints-1.jpg) |

#### - update Frame  <br>

오토 레이아웃을 설정하고, 내가 마우스로 크기나 위치를 변경하거나, 어떤 값을 주었을때 변경된 값으로 에러 메세지가 나오는데, 그 상태에서 `update Frame` 을 하게 되면, 변하기 이전의 frame 상태로 돌아간다. 단축키는 `option + command + =`

#### -Reset to Seggest Constraints <br>

system 적으로 AutoLayOut을 제안해준다.

#### - update constraints <br>

AutolayOut 을 적용 시키고, 마우스로 크기나 위치를 변경하고, 어떤 값을 주고난 이후, update Constraints 를 하게되면, 변해있는 상태의값을 Constraints 값으로 변경 한다는 의미이다.

--- 

## Constraints

#### - Label <br>

레이블은 기본크기가 텍스트에 따라서 잡혀 있다. 텍스트 사이즈에 따라서 Label 의 오토레이아웃을 지정할수 있다. <br>

*tip > 오른쪽 마우스를 누르고 객체를 선택하면 controll 누르고 선택하는것과 같은 효과를 볼수 있습니다.*


---

## Constraints Multiplier

| * | Red to grayView | Red to blue |
| :---: | :---: | :---: |
| ![screen](/study/image/constraints-2.jpg) | ![screen](/study/image/constraints-3.jpg) | ![screen](/study/image/constraints-4.jpg) |

RedView를 기준으로, grayView애 1:2 비율이 적용되고, BlueView에 1:3 비율이 적용되었습니다. 따라서 RedView는 상대적으로 grayView는 redView의 2배 width를 가지게 되고, BlueView는 redView의 3배의 width를 가지게 됩니다.

```swift
item1.atrribute = 비율 * item2.atrribute + 간격 
```

> 위의 공식을 생각하면서 적용 해봅니다. 

#### - Align(정렬)

![screen](/study/image/constraints-5.jpg) <br>

- 하나만 선택했을때는 ,가로 정렬, 새로정렬을 할수 있음. <br>

- 비율 정렬시, `0`은 작성할수 없음. -> 0과 비슷한 값 0.001.. 값을 입력해주면, piexle 의 오차가 조금 있을수 있지만, 거의 사용하지 않음. 

---

## Constraints Multiplier
| * | 구름 View의 Constraints |
| :--: | :---: |
| ![screen](/study/image/constraints-6.jpg) | ![screen](/study/image/constraints-7.jpg) |

위같이, View에 상단에 반쯤 걸쳐 있는 View를 만들수 있는 상황이 있는데, 저렇게 표현하기 위한 방법은 여러가지가 있다. 구름 이미지가 GrayView의 자식 View로 들어가서 `AutolayOut` 을 적용해주어서 표현해줄수 있지만, 이런 경우는 좋은 경우가 아니다. 

이유는, 부모뷰의 범위를 넘어가게 되면, 일단 버튼은 눌리지도 않고, `Clip to bounds`를 부모뷰에서 선택하게 되면, 부모뷰를 넘어간 영역이 잘리게 된다. 그래서 좋은 autoLayOut이 아니다. 동등한 계층 구조에서, align 을 사용해서 정렬을 해주면 올바르게 적용 할수 있다.


- 동등한 레벨로 정렬
-  Edges 정렬 

```
item1.atrribute = 비율 * item2.atrribute + 간격 
```

**- 동등한 위치에서 정렬을 하는게, button 을 클릭하는것도 가능함. **
**- 부모뷰의 범위를 넘어가면 click 도 먹지 않음..**

---

## basic8_Hugging_Priority

- Lable
	- 레이블 사이즈를 키워즈는 명령어 `edit->size to fit`, `command + =`, 텍스트의 크기 만큼 사이즈가 지정이됨.
**- 레이블에 위치지정을 하면, 텍스트의 길이가 늘어남에 따라서, 자동으로 레이블의 크기가 증가함**

- 한쪽이 열려 있어야(Constraints) label의 사이즈가 변경됨.
- 레이블은 AutoLayout을 적용해주면, 현재 디바이스에서는 괜찮은데, 다른 디바이스가 되면 오류가남..? 
- 우선순위를 잡아놓지 않으면, 변하지 않는게 기본 셋팅이다...?
- 텍스트 크기에 따라서 레이블이 줄어들고, 늘어나고 해야하는데, 레이블은 이부분이 자동으로 되지 않음. 내가 셋팅을 해주어야함.

huggin, compression resistance 오류에 대한 설정을 해주어야함(우선순위)
-> 늘어날수도 있고, 줄어들수도 있는개념..

사이즈 인스펙터에 가면, Content Hugging Priority, Content Compression resistance Priority


Content Hugging Priority : 기본적인 자신의 사이즈를 유지 하겠느냐 안하겠느냐..?
Content Compression resistance Priority :

상대적으로 Hugging 이 높은 숫자가 우선권을 가지고 -> 우선적으로 그 View가 셋팅이됨. 그래서 의존적인 부분이 어느 부분인지가 결정이됨.

낮은 숫자의  Hugging Priority 는 의존적으로 늘어난다..?

Priority(우선순위) -> 우선순위를 낮추게 되면, 제일 높은 숫자가 먼저 사이즈대로 fit을 하고, 252가 내 사이즈대로 fit을 하고, 그 다음에 낮은 우선 순위의 priority의 

낮은 우선 순위는 늘어나거나, 줄어들수 있음..

레이 아웃을 잡을때 모든 View, 각 Constraints 들은 Priority 를 가지고 있는데, Priority 값이 높은 순서대로, 자신의 본연의 사이즈를 fit 하고, 그 다음 순위 별로 Priority의 Rect 값을 셋을 하고, 가장 낮은 priority 는 의존적으로 자신의 Rect가 늘어나고, 줄어들고 할수 있음.

---

## basic9_Compression_resistance_priority

우선 순위가 높으면, 정확하게 내 자신의 크기대로 유지를 하고, 우선순위가 낮으면, 내 크기보다 커지거나, 작아질수 있다. 

내 크기를 높이는데, 반대되는 경우가 `Compression_resistance_priority`

내 크기보다 작아지는 형태를 -> 반발하겠음 -> prioty 가 높으면 내 크기를 유지하는것이고, 작아지면 내 크기가 작아진다..?

서로가 딱 맞아 떨어지지 않는다면, 우선순위를 유지 해야함. 내 크기를 유지하지 못할때, 

같거나 커질때는 : hugging prioty
같거나 작아질때 : compression Resitance

레이블 속의 텍스트 크기를 늘렸을때, 나와 상대되는 레이블이 있을때, Compression의 값이 작은 쪽이 찌그러지게되고, 값이 큰쪽의 사이즈를 유지한다..?

위의 두개의 값이 어떤 차이가 있는지... 확실하게 이해하고 정리하자.

---

## basic10_image_resolution

- button에 이미지가 추가 됬을경우, 오른쪽이나, 왼쪽에 추가 되었을 경우.. 버튼 타이틀은 오른쪽으로 밀려서 정렬이됨...?

- imageView 의 특성에 대해서 설명하기 위해서, 이미지별로 다른 해상도..
300 짜리 픽셀.. 
- 디바이스에 이미지, 픽셀에 대해서 확실하게 알고 있어야한다...?

`이미지뷰에 command + =`하게되면, 이미지의 원래 사이즈로 변환시켜주게됨..!

@2x, @3x 가 없으면, 이미지의 원래 픽셀 사이즈로 나오게함.
@2x 들은 아이폰 시리즈에서 사용이됨. 
@3x 는 아이폰 플러스 같은 디바이스에서 사용되고 

---

## basic11_align 

버튼의 타이틀 정렬을 주어야함.

inset 이라는 간격을 줄수 있는 
기본적으로 버튼은 타이틀과, 이미지로 구성을 할수 있음. 

`Content Insets` 은 타이틀과 이미지 인셋을 같이 주겠다는 이야기.

준 값 만큼, 가운데 정렬..?

---

## basic12_align 

정렬 부분에서 x,y 의 값에 따라서 정수값, 음수값을 지정해줄수 있는데, 이것은 autolayOut 의 공식에 따라서 atrribute를 주는 것을 생각하자.

- 이미지를 줄여서 살아서 사용하라고 하는 경우가 많이 있음.
- 이미지를 내가 알아서 줄여서 사용해야함..

여러가지 이미지를 내가 원하는 이미지의 autuLayout 으로 사용하려면, 내가 사이즈를 애초에 지정해놓고 사용하면 됨..! 아항..?

---

## basic13_Rotate

- 화면의 회전에 따라 변화율 

기본 postirate

`Vary For traits` -> 상황에 따라서 달라진다라는 버튼..?

어떤 상황이냐에 따라서 설정을 해주어야 함
Width -> 디바이스 제일큰 `Landscape`만 빠진상태로 적용된 상태임. 
Height : -> 모든 landscape 믄 적용되지않고, fortratite만적용됨..?

파란 상태일때, 적용을 하면, 해당 디바이스에 적용이된다고 생각하면됨.

각각 회전 되었을때, 어떻게 적용할지에 대해서 적용 놓는 방법을 작성해서 정리 해놓자..! 

회전 되었을때마다 각각의 view들의 autoLayOut을 모두 다시 잡아줘야하는구나..하핳..

---

## basic14_ScrollView

contents가 많을 경우 autoLayout 이 적용되는 경우를 보는것..

ScrollView 안에 View는 사이즈를 지정해주어야함, 그래야지 에러가 나지않음.

ScrollView의 조정하려고 하는 ContentsView의 간격을 늘어나거나 줄어들게 하기 위해서 priotiry 값을 낮춰준다.

핵심은 ContentsView의 bottom 값의 priority 를 낮추어 주어서 ContentsView의 값을 늘어나고, 줄어나고 변화는것을 유동적으로 확인할수 있음.

---

## basic15_margin

autoLayout 에서 margin 은 조금 애매한 기능인데..

위의 system 적인 값으로 statusBar 

margin 을 

`option 누르고 객체 누르면 autoLayOut 값을 볼수 있음.`

가장 상위뷰를 기준으로 margin이 왼쪽, 오른쪽만 잡힘.

margin 이라고 하는것은, 최상단뷰를 기준으로, 맨 왼쪽 오른쪽만 간격이 잡히고, 그 아래쪽에 있는 object(왼쪽, 오른쪽, 위, 아래) 들은 8이라고 하는 숫자들만 간격이 잡힘

작은 아이폰의 margin 은 최상단 뷰를 기준으로 제일큰 아이폰은 margin이 20 잡히고, 작은 아이폰들은 margin이 16이 잡힘. 

`landscape` 되었을때, 작은 아이폰일때 margin이 20이되고, 
큰 아이폰 일때 `landscape` 가 16이됨..?

magin이 애매한 이유는, 아이폰 크기에 따라서, 회전되어있는 상황에 따라서 값이 다르다.. 사용하기 조금 애매함...

`아이템` 끼리는 마진이 지정이 되지 않음(레이블 9개 넣고 마진 확인하는것) 레이블의 가운데 부분들은 마진이 지정이 안됨..

---




